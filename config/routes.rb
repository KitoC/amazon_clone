Rails.application.routes.draw do

  get 'authors/index'
  get 'authors/:id', to: 'authors#show', as: 'author'
  get 'authors/landingpage'
  resources :books
  resources :stores
  resources :charges
  root to: 'authors#landingpage'
  post '/search', to: 'stores#index'
  get '/search', to: 'stores#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
