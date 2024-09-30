class TranscribeEnqueueJob
  include Sidekiq::Job

  def perform(episode_id)
    episode = Episode.find(episode_id)

    # Skip if this doesn't match our current transcribe rules
    return unless episode.should_transcribe?

    # Ensure the audio file is saved to R2
    episode.attach_audio_file

    # Prepare the message payload
    message = {
      episode_id: episode.id
    }.to_json

    # Send message to SQS
    sqs_client.send_message(
      queue_url: ENV["AWS_SQS_TRANSCRIPTS_URL"],
      message_body: message
    )

    Rails.logger.info("Queued transcription job for episode #{episode.id}")
  end

  private

  def sqs_client
    @sqs_client ||= Aws::SQS::Client.new(
      region: ENV["AWS_REGION"],
      access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    )
  end
end
