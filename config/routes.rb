Rails.application.routes.draw do
  
  get 'authors/index'
  get 'authors/books'
  get 'authors/landingpage'
  resources :books
  root to: 'authors#landingpage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
