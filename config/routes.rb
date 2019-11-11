Rails.application.routes.draw do
  root 'static_pages#top'

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, shallow: true, only: %i[create]
    resources :bookmarks, shallow: true, only: %i[create destroy]
    collection do
      get 'bookmarks', to: 'bookmarks#index'
    end
  end

  resource :profile, only: %i[show edit update]

  # Admin routes
  namespace :admin do
    # Top Page
    root to: 'dashboards#index'

    # Sessions
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    # Resources
    resources :users, only: %i[index edit update destroy]
    resources :boards, only: %i[index show edit update destroy]
  end
end
