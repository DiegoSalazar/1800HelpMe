class ContactRecognitionsController < ApplicationController
  include DefRetry
  include TwilioWebhookable
  include TakesCalls
  skip_before_action :verify_authenticity_token
  before_action :get_user

  def create
    call = take_call
    @user.calls << call
    retryable on: NoMethodError do
      speech = VoiceRecogService.new.decode call
      call.update_column :recognized_speech, speech.transcript
    end
    contact = @user.contacts.search_by_full_name(call.recognized_speech).first

    render_voice_response do |r|
      if contact.present?
        r.say "I found #{contact.full_name}"
        r.say "The number is #{phone_num_for_text2speech contact.phone}"
        r.say "Take care now bye bye then!"
      else
        r.say "I couldn't find that contact. Please, try again."
        r.record maxLength: 3, action: user_call_contact_recognitions_path(@user, call)
      end
    end
  end

  private

  def get_user
    @user = User.find params[:user_id]
  end

  def phone_num_for_text2speech(phone)
    _, part1, part2, part3 = phone.match /^(\d{3})(\d{3})(\d{4})/
    [part1, part2, part3].map { |p| p.chars.join ' ' }.join ?.
  rescue NoMethodError
    phone.to_s.chars.join ', '
  end
end
