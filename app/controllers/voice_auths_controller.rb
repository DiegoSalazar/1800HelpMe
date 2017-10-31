class VoiceAuthsController < ApplicationController
  include DefRetry
  include TwilioWebhookable
  include TakesCalls
  include VoiceRecognition
  include Loggable
  include GetsUser
  before_action :get_user
  skip_before_action :verify_authenticity_token
  TRIES = ENV.fetch('VOICE_AUTH_TRIES', 5).to_i

  def create
    call = take_call

    if @user.nil?
      retryable on: NoMethodError, tries: TRIES, re_raise: false do
        speech = voice_recog_service.decode call
        log "Speech: #{speech.inspect}"
        call.update_column :recognized_speech, speech.transcript
      end

      if call.recognized_speech
        users = User.search_by_full_name call.recognized_speech
        log "Found #{users.size} #{'user'.pluralize users.size}"
        @user = users.first
      end
    end

    render_voice_response do |r|
      if @user.present?
        @user.calls << call
        r.say "Hello, #{@user.first_name}."
        r.say "Who's phone number can I get for you?"
        r.record maxLength: 3, action: user_call_contact_recognitions_path(@user, call)
      else
        r.say "I didn't hear that. Please say your full name again."
        r.record maxLength: 3, action: call_voice_auths_path(call)
      end
    end
  end
end
