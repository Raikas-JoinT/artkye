Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "affiliates#index"
  resources :affiliates, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  get 'messages/search', to: 'messages#search'
end