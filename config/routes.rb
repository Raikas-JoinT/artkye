Rails.application.routes.draw do
  root to: "affiliates#index"
  resources :affiliates, only: [:index]
end
