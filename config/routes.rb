Rails.application.routes.draw do
  get 'countries/index'
  get 'countries/show'
  get 'countries/create'
  get 'countries/update'
  get 'countries/destroy'
  resources :countries
  resources :properties
  resources :user, only: :show
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
