Rails.application.routes.draw do
 
  namespace :admin do
    resources :posts
  end


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :posts
  root to: 'posts#index'
 end 
