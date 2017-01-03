Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"

  devise_for :users

  # resources :users, except: [:destroy]
  resources :categories, only: [:index, :show]
  resources :books, only: [:create, :show, :update]
  resources :users, only: :show	
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]	
end
