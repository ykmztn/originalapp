Rails.application.routes.draw do
  devise_for :users
  root to: "poses#index"
  get 'poses/search'

  resources :poses, only: [:index, :new, :create]
  resources :users, only: :show
 
end