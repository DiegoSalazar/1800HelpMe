class VoiceAuthsController < ApplicationController
  include TwilioWebhookable

  def create
    call = CallCreator.create params
    results = VoiceRecogService.decode call
    call.update_column :recognized_speech, results.transcript

    render_voice_response do |r|
      r.say "You said, #{call.recognized_speech}"
    end
  end
end
