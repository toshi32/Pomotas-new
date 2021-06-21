Rails.application.routes.draw do
  get 'pomodoros/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'
  devise_for :users
  resources :users, only: [:show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest'
  end
  resources :tasks

end
