Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create', as: 'oauth'
  get 'auth/failure', to: redirect('/')

  get '/register', to: 'farms#new'
  post '/register', to: 'farms#create'
  get '/dashboard', to: 'farms#show'
  #get '/login', to: 'users#login_form'
  resources :farms, only: [:show, :edit]
  resources :resources, only: :index

  get 'texts', to: 'texts#index'
  post '/texts/new', to: 'texts#create'
end
