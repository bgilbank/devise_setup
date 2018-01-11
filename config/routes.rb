Rails.application.routes.draw do
 
  
  namespace :dashboard do
    resources :posts
    resources :mains
    root to: "mains#index"
  end


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :pages, only: [:show]
  resources :posts
  root to: 'posts#index'
  resources :users do
   collection do
     patch 'update_password'
     patch 'update_profile'
     patch 'update_profile_image'
  end
 end
end
