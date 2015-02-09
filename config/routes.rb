Rails.application.routes.draw do
  devise_for :users
  resources :services
  root to: 'services#index'
end
