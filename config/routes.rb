Rails.application.routes.draw do
  devise_for :users
  resources :services
  root to: 'services#index'
end

# GmailAlerts::Application.routes.draw do
#   get "/auth/:provider/callback" => 'sessions#create'
# end
