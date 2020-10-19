Rails.application.routes.draw do
  devise_for :users
  root to: "affiliates#index"
  resources :affiliates, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  get 'messages/index', to: 'messages#index'
end