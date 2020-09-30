Rails.application.routes.draw do
  resources :affiliates, only: [:index]
end
