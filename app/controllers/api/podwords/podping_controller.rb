class Api::Podwords::PodpingController < Api::Podwords::BaseController
  def create
    url = params[:url]
    urls = params[:urls]

    if url.present?
      FeedFetcherFromUrlJob.perform_async(url)
      render json: {status: "Jobs enqueued: 1"}, status: :ok
    elsif urls.present?
      Rails.logger.info(urls)
      urls_array = urls.is_a?(Array) ? urls : [urls]
      urls_array.each do |url|
        FeedFetcherFromUrlJob.perform_async(url)
      end
      render json: {status: "Jobs enqueued: #{urls_array.length} | #{urls_array.join('\n')}"}, status: :ok
    else
      render json: {error: "URL missing"}, status: :bad_request
    end
  end
end
