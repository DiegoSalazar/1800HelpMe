class OperatorController < ApplicationController
  include TwilioWebhookable
  skip_before_action :verify_authenticity_token

  def answer_call
    CallCreator.create params

    render_voice_response do |r|
      r.say 'Hello. What is your full name?'
      r.record maxLength: '4', action: '/accept/name'
    end
  end

  def accept_name
    call = CallCreator.create params
    results = Speachy.decode call
    call.update_column :recognized_speech, results.transcript

    binding.pry # debug

    render_voice_response do |r|
      r.say "You said, #{call.recognized_speech}"
    end
  end
end
