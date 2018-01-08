Rails.application.routes.draw do
 
  
  namespace :admin do
    resources :posts
    root to: "posts#index"
    resources :pages
    resources :users, only: [:index, :show, :edit] do
     collection do
      patch 'update_password'
    end
   end
  end


  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :pages, only: [:show]
  resources :posts
  root to: 'posts#index'
  resources :users do
   collection do
     patch 'update_password'
     patch 'update_profile'
  end
 end
end
