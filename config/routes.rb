Rails.application.routes.draw do

  root 'posts#index'
  
  mount Ckeditor::Engine => '/ckeditor'
  
  devise_for :users
  
  namespace :admin do
    resources :posts, :tournaments, :teams, :invites, :users, :matches

    root to: "invites#index"
  end

  resources :posts, :matches
  resources :invites
  resources :teams
  
  get '/profile', to: "users#show"
   get '/profile/:name', to: "users#show"

  resources :users do
    get :send_invite, on: :member
  end

  resources :tournaments do
    get :registration_team, on: :member
    get :detail, on: :member
  end

end
