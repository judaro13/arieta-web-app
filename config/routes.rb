Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  mount ActionCable.server => '/cable'

  resources :resources
  resources :services
  post '/services/:id', to: 'services#create'
end
