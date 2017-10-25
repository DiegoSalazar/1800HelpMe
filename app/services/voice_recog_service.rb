require 'open-uri'
require 'google/cloud/speech'

# Speech to text from a Twilio call recording
class VoiceRecogService
  include DefRetry

  def initialize(keyfile: '')
    # Google::Cloud client needs a keyfile to authenticate,
    # those are kept in ENV vars. More info: http://googlecloudplatform.github.io/google-cloud-ruby/#/docs/google-cloud/v0.44.0/guides/authentication
    @speech_decoder = Google::Cloud::Speech.new(project: project)
  end

  def decode(call)
    retryable on: OpenURI::HTTPError do
      file = open call.recording_url
      @speech_decoder.
        audio(file, language: 'en-US', sample_rate: 8000, encoding: :linear16).
        recognize.first
    end
  end
end
