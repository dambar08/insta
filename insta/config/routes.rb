# frozen_string_literal: true

Rails.application.routes.draw do
  resources :issues, only: [:new, :create, :show]
  namespace :users do
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
  devise_for :admins
  devise_for :users
  resources :notifications
  resources :user_blocks
  namespace :admins do
    root "home#show", as: :admin_root
    resources :users
  end
  resources :posts
  namespace :users, path: :app do
    root "home#show", as: :app_root
    resource :explore, only: [:show] do
      collection do
        get "tabs/for_you", to: "explore#show"
        get "tabs/trending", to: "explore#trending"
      end
    end
    resources :reels, only: [:index, :show]
    resources :bookmarks
    resources :notifications, only: [:index, :show] do
      collection do
        get :mentions
        get :verified
      end
    end
    get "@:username", to: "users#show"
  end
  resources :users, except: [:show] do
    collection do
      get "followers"
      get "followings"
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
  use_doorkeeper
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Rswag::Api::Engine => "/api-docs" if Rails.env.development?
  mount Rswag::Ui::Engine => "/api-docs" if Rails.env.development?

  # mount Blazer::Engine, at: "blazer"
  # mount Rswag::Api::Engine => "/api-docs"
  # mount Rswag::Ui::Engine => "/api-docs"
  get "@:username", to: "users#show"
  draw(:api)
end
