Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/merchants', to: 'merchants#index'
  get '/merchants/:id', to: 'merchants#show', as: 'merchant'
  get '/items/:id', to: 'items#show', as: 'item'
end
