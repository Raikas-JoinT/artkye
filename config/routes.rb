Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "affiliates#index"
  resources :affiliates, only: [:index, :show, :create]
  resources :messages, only: [:index, :create]
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:create,:show] do
    resources :chats, only: [:create]
  end
  get 'messages/search', to: 'messages#search'

  put 'users/follow/:user_id',to: 'users#follow'
  put 'users/unfollow/:user_id',to: 'users#unfollow'
  get 'users/follow/:user_id',to: 'users#follow'
  get 'users/unfollow/:user_id',to: 'users#unfollow'

  get 'users/follow_list/:user_id',to: 'users#follow_list'
  get 'users/follower_list/:user_id',to:'users#follower_list'
end