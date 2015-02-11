Rails.application.routes.draw do
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/auth/google_oauth2/callback" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :services
  root to: 'services#index'
end
