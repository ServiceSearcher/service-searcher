Rails.application.routes.draw do
  resources :services
  root to: 'services#index'
end
