MeiliSearch::Rails.configuration = {
  meilisearch_url: Rails.configuration.x.meilisearch.url,
  meilisearch_api_key: Rails.configuration.x.meilisearch.api_key,
  timeout: 5,
  max_retries: 3,
  pagination_backend: :pagy,
  per_environment: true
}
