class CallsController < ApplicationController
  include TwilioWebhookable

  def create
    CreateCallService.call params

    render_voice_response do |r|
      r.say 'Hello. What is your full name?'
      r.record maxLength: '4', action: '/voice_auth'
    end
  end

  private

  def call_params
    params.require(:call).permit(:user_id, :params, :env)
  end
end
