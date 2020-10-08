Rails.application.routes.draw do
  devise_for :users
  root to: "affiliates#index"
  resources :affiliates
end