Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'tournaments#index'

  get '/auth/epic/callback', to: "authentications#epic"
  get '/login', to: redirect("https://developer-paragon.epicgames.com/v1/auth/login/#{ENV['CLIENTID']}")
  get '/logout', to: redirect("https://developer-paragon.epicgames.com/v1/auth/logout/#{ENV['CLIENTID']}")

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
  resources :teams do 
    post 'remove_user/:user_id', to: 'teams#remove_user_from_team', as: 'remove_user', on: :member
    post 'leave', to: 'teams#leave_team', on: :member
  end

  get '/profile', to: 'users#show'
  get '/profile/:name', to: 'users#show', as: 'user'

  resources :users, only: :index do
    get :send_invite, on: :member
    get :no_team, on: :collection
    put :request_assemble_team, on: :collection
  end
  
  resources :team_factory, only: [:new ,:create]
  get 'assemble_team', to: 'team_factory#new', as: 'new_assemble_team'
  post 'assemble_team', to: 'team_factory#create'

  resources :tournaments, only: [:index, :show] do
    get '/registration_team', to: 'tournaments#register_team_to_the_tournament', on: :member
    get :detail, on: :member
  end

end
