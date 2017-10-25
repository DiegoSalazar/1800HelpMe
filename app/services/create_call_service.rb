# Create a call record for an incoming Twilio call
class CreateCallService
  def call(params)
    Call.create!(
      from: params[:From],
      to: params[:To],
      status: params[:CallStatus],
      recording_url: params[:RecordingUrl],
      recognized_speech: params[:SpeechResult],
      parent_id: params[:call_id],
      user_id: params[:user_id],
      meta: {
        params: params.except(:From, :To, :CallStatus, :RecordingUrl, :SpeechResult, :call_id, :user_id)
      },
    )
  end
end
