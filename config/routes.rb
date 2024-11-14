Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index'
  resources :countries, only: :index
  resources :users, only: :show
end
