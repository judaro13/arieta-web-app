Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  mount ActionCable.server => '/cable'

  resources :resources
  resources :services
  post '/services/:id', to: 'services#create'
  patch '/services/:id', to: 'services#update'
  post '/services/:id/deploy', to: 'services#deploy', as: "deploy_service"
  post '/services/deploy', to: 'services#deploy_all'
  get '/services/:name/status', to: 'services#status'
end
