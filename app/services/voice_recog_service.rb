require 'open-uri'
require 'google/cloud/speech'

# Speech to text from a Twilio call recording
class VoiceRecogService
  GCLOUD_SPEECH_SETTINGS = {
    language: 'en-US', sample_rate: 8000, encoding: :linear16
  }.freeze

  class << self
    def decode(call)
      file = open call.recording_url
      audio = speech_decoder.audio file, GCLOUD_SPEECH_SETTINGS
      audio.recognize.first.transcript
    end

    private

    def speech_decoder
      @speech_decoder ||= Google::Cloud::Speech.new(
        project: '1800Helpme',
        keyfile: '/Users/diego/Desktop/gcp-creds.json'
      )
    end
  end
end
