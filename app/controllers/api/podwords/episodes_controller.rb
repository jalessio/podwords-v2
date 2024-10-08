class Api::Podwords::EpisodesController < Api::Podwords::BaseController
  def transcript
    @transcript = Transcript.new(episode_id: params[:id], **transcript_params)

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
    params.permit(payload: {})
  end
end
