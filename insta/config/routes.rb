# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  use_doorkeeper
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    mount Rswag::Api::Engine => "/api-docs"
    mount Rswag::Ui::Engine => "/api-docs"
    mount Blazer::Engine, at: "/blazer"
  end
  if Rails.env.test?
  end
  if Rails.env.production?
  end
  post "/graphql", to: "graphql#execute"

  get "manifest" => "pwa#manifest", as: :pwa_manifest, defaults: { format: :json }
  get "service-worker" => "pwa#service_worker", as: :pwa_service_worker, defaults: { format: :js }
  resources :issues, only: [:new, :create, :show]
  namespace :users do
    resources :comments
    resources :notifications
  end
  root "pages#index"
  resources :pages, path: "", only: [] do
    collection do
      get :about
      get :tos
      get :cookies
      get :privacy
      get :accessibility
    end
  end

  resources :notifications
  resources :user_blocks

  # ADMINS START
  namespace :admins do
    resources :verification_requests
    root "home#show", as: :admin_root
    resources :users
    resources :reports
    resources :settings
    resources :verification_requests, only: [:index, :show] do
      member do
        patch :review
        patch :approve
        patch :reject
      end
    end
  end
  # ADMINS END

  resources :posts
  namespace :users, path: :app do
    root "home#show", as: :app_root
    resource :explore, only: [:show] do
      collection do
        get "tabs/for_you", to: "explore#show"
        get "tabs/trending", to: "explore#trending"
      end
    end
    resources :verification_requests, only: [:index, :show, :create]
    resources :reels, only: [:index, :show]
    resources :bookmarks
    resources :settings do
    end
    resource :account do
      collection do
        get :followers
        get :followings
        get :blocked_accounts
        get :close_friends
      end
    end
    resources :notifications, only: [:index, :show] do
      collection do
        get :mentions
        get :verified
      end
    end
    get "@:username", to: "accounts#show"
  end
  resources :users, except: [:show] do
    collection do
      get "followers"
      get "followings"
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check

  get "@:username", to: "users#show"
  draw(:api)

  unless Rails.env.production?
    get "/rails/mailers", to: "rails/mailers#index"
    get "/rails/mailers/*path", to: "rails/mailers#preview"
  end
end
