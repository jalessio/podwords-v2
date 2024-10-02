namespace :api, defaults: {format: :json} do
  namespace :v1 do
    namespace :podwords do
      resource :transcripts, only: :create
    end

    resource :auth
    resource :me, controller: :me
    resource :password
    resources :accounts
    resources :users
    resources :notification_tokens, only: :create
  end

  # The podwords namespace is for internal use only.
  # It requires the user to have the internal_api role.
  namespace :podwords do
    resources :episodes, only: [] do
      get "should_transcribe", on: :member
      post "transcript", on: :member
    end
  end
end

resources :api_tokens
