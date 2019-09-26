Rails.application.routes.draw do
  post 'artwork', to: 'artwork#create'
  delete 'artwork/:id', to: 'artwork#destroy'
  get 'artwork', to: 'artwork#index'
  get 'artwork/:id', to: 'artwork#show'
  patch 'artwork/:id', to: 'artwork#update'

  post 'users', to:'users#create'
  delete 'users/:id', to:'users#destroy'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  patch 'users/:id', to: 'users#update'
end
