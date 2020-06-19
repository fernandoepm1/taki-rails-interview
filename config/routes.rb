Rails.application.routes.draw do
  resources :users, except: %i[index new create destroy]
  resources :businesses, except: %i[index show destroy]
  resources :items

  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#index'
end
