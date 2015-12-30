Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  authenticated :user do
    devise_scope :user do
      root to: "pages#home", as: "root"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "users/registrations#new", as: "unauthenticated"
    end
  end

  resources :videos
  resources :posts
  resources :comments

  get '/users', to: 'users#index', as: :users
  get '/profile/:user_id', to: 'pages#profile', as: :profile
  get '/home', to: 'pages#home', as: :home
  get '/videos', to: 'pages#videos', as: :all_videos
  get '/posts', to: 'pages#posts', as: :all_posts

  post '/add_friend', to: 'relationships#create', as: :create_relationship
  post '/remove_friend', to: 'relationships#destroy', as: :destroy_relationship
  post '/ban', to: 'users#ban', as: :ban_user
  post '/became_admin', to: 'users#became_admin', as: :became_admin

  post '/change_photo', to: 'users#change_photo', as: :change_photo
end
