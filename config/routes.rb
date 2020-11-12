require 'sidekiq/web'
Rails.application.routes.draw do
  resources :items
  resources :items_imports
  mount Sidekiq::Web => '/sidekiq'
  get 'pages/home'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "omniauth_callbacks"
  }
  root to: "people#index"
  resources :people
  get '/search' => 'search#search_people'
  resources :messages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end