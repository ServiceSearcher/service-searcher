Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/update'

  get 'comments/destroy'

  # devise_for :users, :controllers => { :omniauth_callbacks => "users/auth/google_oauth2/callback" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :services
  resources :comments, only: [:create, :update, :destroy]
  root to: 'services#index'
end
