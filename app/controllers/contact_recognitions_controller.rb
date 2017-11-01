class ContactRecognitionsController < ApplicationController
  include DefRetry
  include TwilioWebhookable
  include TakesCalls
  include VoiceRecognition
  include Loggable
  include GetsUser
  before_action :get_user
  skip_before_action :verify_authenticity_token
  TRIES = ENV.fetch('CONTACT_RECOG_TRIES', 2).to_i

  def create
    call = take_call
    @user.calls << call
    contact = nil

    retryable on: NoMethodError, tries: TRIES, re_raise: false do
      speech = voice_recog_service.decode call
      log "Speech: #{speech.inspect}"
      call.update_column :recognized_speech, speech.transcript
    end

    if call.recognized_speech.present?
      contacts = @user.contacts.search_by_full_name call.recognized_speech
      log "Found #{contacts.size} #{'contact'.pluralize contacts.size}"
      contact = contacts.first
    end

    render_voice_response do |r|
      if contact.present?
        r.say "I found #{contact.full_name}."
        r.say "Their number is, #{phone_num_for_text2speech contact.phone}."
        r.gather input: 'dtmf', digits: 1, action: user_call_voice_auths_path(@user, call.parent_call) do
          r.say "If you'd like to look for another number, press 1. Otherwise, see ya later."
        end
      else
        r.say "I couldn't find that contact. Please, try again."
        r.record maxLength: 3, action: user_call_contact_recognitions_path(@user, call)
      end
    end
  end

  private

  def phone_num_for_text2speech(phone)
    _, part1, part2, part3 = phone.match /^(\d{3})(\d{3})(\d{4})/
    [part1, part2, part3].map { |p| p.chars.join ' ' }.join ?.
  rescue NoMethodError
    log "t2s num warning: #{{ phone: phone, p1: part1, p2: part2, p3: part3 }.inspect}"
    phone.to_s.chars.join ', '
  end
end
