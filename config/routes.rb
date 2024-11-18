Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: :index do
    resources :countries, only: :index
    get '/countries/edit', to: 'countries#edit', as: 'edit_country'
    patch '/countries', to: 'countries#update', as: 'country'
  end
end
