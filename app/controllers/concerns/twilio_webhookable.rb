# https://www.twilio.com/blog/2014/02/twilio-on-rails-integrating-twilio-with-your-rails-4-app.html#crayon-59e6c5eb06d42893192095
module TwilioWebhookable
  extend ActiveSupport::Concern

  included do
    after_action :set_header
  end

  def set_header
    response.headers['Content-Type'] = 'text/xml'
  end

  def render_voice_response(&block)
    render text: Twilio::TwiML::VoiceResponse.new(&block)
  end
end
