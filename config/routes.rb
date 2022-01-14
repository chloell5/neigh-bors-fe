Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create', as: 'oauth'
  get 'auth/failure', to: redirect('/')

  delete '/logout', to: 'sessions#destroy', as: 'user_logout'
  get '/logout',    to: 'sessions#destroy', as: 'logout_user'

  get 'users/register', to: 'users#register'
  get 'users/edit', to: 'users#edit'
  patch 'users', to: 'users#update'

  get 'farms/register', to: 'farms#new'
  get 'farms/edit', to: 'farms#edit'
  patch 'farms', to: 'farms#update'
  post '/farms', to: 'farms#create'
  get '/dashboard', to: 'farms#show'

  get '/missions', to: 'missions#index'
  get '/missions/new', to: 'missions#new'
  post '/missions', to: 'missions#create'
  patch '/missions/:id', to: 'missions#update'

  resources :farms, only: [:show, :edit]
  resources :resources, only: :index

  get 'texts', to: 'texts#index'
  post '/texts/new', to: 'texts#create'

  get '/missions/:mission_id', to: 'missions#show', as: 'mission_show'
end
