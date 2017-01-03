Rails.application.routes.draw do
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  namespace :admin do
    resources :categories
  end

  devise_for :users
end
