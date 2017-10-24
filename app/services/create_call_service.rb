# Create a call record for an incoming Twilio call
class CreateCallService
  def self.call(params)
    Call.create!({
      called: params[:Called],
      from: params[:From],
      direction: params[:Direction],
      status: params[:CallStatus],
      recording_url: params[:RecordingUrl],
      recording_duration: params[:RecordingDuration],
      call_sid: params[:CallSid],
      account_sid: params[:AccountSid],
      from_zip: params[:FromZip],
      from_city: params[:FromCity],
      from_state: params[:FromState],
      from_country: params[:FromCountry],
      meta: { params: params }
    })
  end
end
