Rails.application.routes.draw do
  root 'static_pages#top'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, shallow: true, only: %i[create update destroy]
    resources :bookmarks, shallow: true, only: %i[create destroy]
    collection do
      get 'bookmarks', to: 'bookmarks#index'
    end
  end

  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update]

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
