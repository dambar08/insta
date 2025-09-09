# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  namespace :admins do
    resources :users
  end
  resources :posts
  resources :users, except: [:show] do
    collection do
      get "followers"
      get "followings"
    end
  end
  use_doorkeeper
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount Rswag::Api::Engine => "/api-docs"
  mount Rswag::Ui::Engine => "/api-docs"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
  # mount Blazer::Engine, at: "blazer"
  # mount Rswag::Api::Engine => "/api-docs"
  # mount Rswag::Ui::Engine => "/api-docs"
  get "@:username", to: "users#show"
  draw(:api)
end
