module VoiceRecognition
  extend ActiveSupport::Concern

  # GCP Creds is a json string that is base64 encoded
  # and stored in ENV.
  def voice_recog_service
    @voice_recog_service ||= VoiceRecogService.new
  end
end
