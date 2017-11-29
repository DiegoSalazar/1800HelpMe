class CallsController < ApplicationController
  include TwilioWebhookable
  include TakesCalls
  skip_before_action :verify_authenticity_token

  def create
    call = take_call

    render_voice_response do |r|
      r.say 'What is your full name?'
      r.record maxLength: 3, playBeep: false, action: call_voice_auths_path(call)
    end
  end
end
