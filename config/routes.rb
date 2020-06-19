Rails.application.routes.draw do
  resources :users, except: %i[index new destroy]
  resources :businesses
  resources :items

  get    '/signup', to: 'users#new'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#index'
end
