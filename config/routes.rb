Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts/index'
  get 'sessions/new'
  get 'users/new'
  resources :users, only: [:index, :show, :edit, :update], :controllers => { registrations: 'registrations' }
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
