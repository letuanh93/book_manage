Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  namespace :admin do
    resources :categories
    resources :books
    resources :users
    resources :requests
  end

  devise_for :users
end
