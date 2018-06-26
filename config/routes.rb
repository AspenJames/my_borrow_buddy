Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items

  resources :items, only: [:show, :index] do
    resources :transactions, only: [:new, :index]
  end

  resources :users

  resources :users, only: [:show, :index] do
    resources :items, only: [:show, :new, :index, :edit]
  end

  root 'static#welcome'
  get '/test', to: 'static#test'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: "sessions#destroy"
  get '/signup', to: 'users#new'
  get '/auth/facebook/callback', to: 'sessions#create'
  post '/signin', to: 'sessions#create'
  post '/items/:item_id/transactions/new', to: 'transactions#new'
end
