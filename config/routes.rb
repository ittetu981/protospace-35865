Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, pnly: [:edit, :update]
  resources :users, only: :show
  resources :rooms, only: [:new, :create, :destroy, :show] do
    resources :messages, only: [:index, :create]
  end

  resources :prototypes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :prototype do
    resources :comments, only: :create
  end
end
