Rails.application.routes.draw do

  namespace :admin do
  get 'session/new'
  end

  root 'posts#index'

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, skip: :session
  devise_scope :user do
    get    '/login' => 'devise/sessions#new'
    post   '/login' => 'devise/sessions#create'
    delete '/logout' => 'devise/sessions#destroy'
    get    '/register' => 'devise/registrations#new'
  end

  namespace :admin do
    resources :posts, :tournaments, :teams, :invites, :users, :matches, :admin_users
    root to: 'posts#index'
    get 'login/:login' => "session#new", as: "login"
    post 'login/:login' => "session#create"
    get  'logout', to: 'session#destroy', as: 'logout'
  end

  resources :posts, only: [:index, :show]
  resources :matches, only: [:index, :show] do
    post :desired_time, on: :member
  end
  resources :invites
  resources :teams

  get '/profile', to: 'users#show'
  get '/profile/:name', to: 'users#show', as: 'user'

  resources :users, only: :index do
    get :send_invite, on: :member
  end

  resources :tournaments, only: [:index, :show] do
    get '/registration_team', to: 'tournaments#register_team_to_the_tournament', on: :member
    get :detail, on: :member
  end

end
