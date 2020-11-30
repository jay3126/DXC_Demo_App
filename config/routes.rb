require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :items
    resources :items_imports
    mount Sidekiq::Web => '/sidekiq'
    get 'pages/home'
    devise_for :users, skip: :omniauth_callbacks
    root to: "people#index"
    resources :people
    get '/search' => 'search#search_people'
    resources :messages
    get 'download_sample_excel' => 'items_imports#download_sample_excel'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end