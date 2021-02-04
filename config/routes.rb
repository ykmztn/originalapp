Rails.application.routes.draw do
  devise_for :users
  root to: "poses#index"

  resources :poses, only: [:index, :new, :create]
  resources :users, only: :show
 
end