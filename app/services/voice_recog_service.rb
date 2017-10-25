require 'open-uri'
require 'google/cloud/speech'

# Speech to text from a Twilio call recording
class VoiceRecogService
  include DefRetry
  attr_reader :speech_decoder

  def initialize(keyfile: '', project: '')
    @speech_decoder ||= Google::Cloud::Speech.new(
      project: project, keyfile: keyfile
    )
  end

  def decode(call)
    retryable on: OpenURI::HTTPError do
      file = open call.recording_url
      speech_decoder.
        audio(file, language: 'en-US', sample_rate: 8000, encoding: :linear16).
        recognize.first
    end
  end
end
