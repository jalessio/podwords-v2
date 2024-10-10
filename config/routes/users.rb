devise_for :users,
  skip: [:registrations], # 2024-10-10 Disable new user registration until we are ready to launch.
  controllers: {
    omniauth_callbacks: ("users/omniauth_callbacks" if defined? OmniAuth),
    registrations: "users/registrations",
    sessions: "users/sessions"
  }.compact

# Add custom routes for existing user account management
devise_scope :user do
  get "/users/edit", to: "users/registrations#edit", as: :edit_user_registration
  put "/users", to: "users/registrations#update", as: :user_registration
  delete "/users", to: "users/registrations#destroy", as: nil
end

namespace :account do
  resource :password
end
namespace :users do
  resources :mentions, only: [:index]
end
namespace :user, module: :users do
  resource :two_factor, controller: :two_factor do
    get :backup_codes
    get :verify
  end
  resources :connected_accounts
end

resources :agreements, module: :users
resources :notifications, only: [:index, :show] do
  collection do
    patch :mark_as_read
  end
end

resources :referrals, module: :users if defined? Refer

post :sudo, to: "users/sudo#create"
