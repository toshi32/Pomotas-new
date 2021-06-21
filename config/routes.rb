Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'

  devise_for :users
  resources :users, only: [:show]
  resources :tasks

end
