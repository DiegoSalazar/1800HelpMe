class VoiceAuthsController < ApplicationController
  include DefRetry
  include TwilioWebhookable
  include TakesCalls
  include VoiceRecognition
  include Loggable
  skip_before_action :verify_authenticity_token

  def create
    call = take_call
    retryable on: NoMethodError do
      speech = voice_recog_service.decode call
      call.update_column :recognized_speech, speech.transcript
    end
    users = User.search_by_full_name call.recognized_speech
    user = users.first

    log "Found #{users.size} #{'user'.pluralize users.size}"

    render_voice_response do |r|
      if user.present?
        user.calls << call
        r.say "Hello #{user.full_name}"
        r.say "Who's phone number do you need?"
        r.record maxLength: 3, action: user_call_contact_recognitions_path(user, call)
      else
        r.say "I didn't hear that. Please say your full name again."
        r.record maxLength: 3, action: call_voice_auths_path(call)
      end
    end
  end
end
