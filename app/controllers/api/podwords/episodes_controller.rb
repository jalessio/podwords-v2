class Api::Podwords::EpisodesController < Api::Podwords::BaseController
  def transcript
    @transcript = Transcript.new(transcript_params)

    if @transcript.save
      render json: @transcript, status: :created
    else
      render json: @transcript.errors, status: :unprocessable_entity
    end
  end

  def should_transcribe
    episode = Episode.find(params[:id])
    render json: {
      should_transcribe: episode.should_transcribe?,
      audio_file_archive_url: episode.audio_file_archive.url
    }
  end

  private

  def transcript_params
    Rails.logger.info "Received params: #{params.inspect}"
    permitted = params.require(:transcript).permit(:transcript, :episode_id)
    Rails.logger.info "Permitted params: #{permitted.inspect}"
    permitted
  end
end
