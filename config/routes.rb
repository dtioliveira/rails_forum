Rails.application.routes.draw do
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

  get '/users', to: 'users#index', as: :users

  post '/add_friend', to: 'relationships#create', as: :create_relationship
  post '/remove_friend', to: 'relationships#destroy', as: :destroy_relationship
  get 'profile/:user_id', to: 'pages#profile', as: :profile

  get 'home', to: 'pages#home', as: :home
end
