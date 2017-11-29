require 'open-uri'
require 'google/cloud/speech'

# Speech to text from a Twilio call recording
class VoiceRecogService
  NullSpeech = Struct.new('NullSpeech', :transcript).new ''
  include DefRetry

  def initialize
    # Google::Cloud client needs a keyfile to authenticate,
    # those are kept in ENV vars. More info: http://googlecloudplatform.github.io/google-cloud-ruby/#/docs/google-cloud/v0.44.0/guides/authentication
    @speech_decoder = Google::Cloud::Speech.new(
      project: ENV.fetch('GCP_PROJECT', '1800Helpme')
    )
  end

  def decode(call, phrases: [], language: 'en-US', sample_rate: 8000, encoding: :linear16)
    retryable on: OpenURI::HTTPError, re_raise: false do
      file = open call.recording_url
      @speech_decoder.
        audio(file, phrases: phrases, language: language, sample_rate: sample_rate, encoding: encoding).
        recognize.tap do |a|
          # debug
        end.first || NullSpeech
    end
  end
end
