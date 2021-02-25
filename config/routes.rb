Rails.application.routes.draw do
  devise_for :users
  root to: "poses#index"
  get 'poses/search'

  resources :users, only: :show
  resources :poses, only: [:index, :new, :create, :destroy] do
    resource :likes, only: [:create, :destroy]
  end

end