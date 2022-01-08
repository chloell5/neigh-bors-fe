Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'auth/:provider/callback', to: 'sessions#create', as: 'oauth'
  get 'auth/failure', to: redirect('/')
  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#dashboard'
  resources :resources, only: :index
  get '/dashboard/missions/:id', to: 'missions#show'
end
