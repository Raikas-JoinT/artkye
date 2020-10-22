Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "affiliates#index"
  resources :affiliates
  resources :messages
  get 'messages/index', to: 'messages#index'
end