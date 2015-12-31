Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }

  # AREA DE ADMINS
  resources :videos
  resources :posts
  get '/users', to: 'users#index', as: :users

  # AREA DE USUARIOS COMUNS
  get '/profile/:user_id', to: 'pages#profile', as: :profile
  get '/home', to: 'pages#home', as: :home
  match '/all_videos', to: 'pages#videos', as: :all_videos, via: [:get, :post]
  match '/all_posts', to: 'pages#posts', as: :all_posts, via: [:get, :post]


  # AÇÕES ENTRE ADMIN/USUARIOS COM OUTROS USUARIOS
  resources :relationships, only: :index
  post '/:relationship_id/accept', to: 'relationships#accept', as: :accept_relationship
  post '/:relationship_id/reject', to: 'relationships#reject', as: :reject_relationship
  post '/add_friend', to: 'relationships#create', as: :create_relationship
  post '/remove_friend', to: 'relationships#destroy', as: :destroy_relationship
  post '/ban', to: 'users#ban', as: :ban_user
  post '/became_admin', to: 'users#became_admin', as: :became_admin

  # ALTERAR AVATAR
  post '/change_photo', to: 'users#change_photo', as: :change_photo

  # PUBLICAÇÕES E AVALIAÇÕES
  post '/rate', to: 'rater#create', as: 'rate'
  resources :comments, except: [:edit, :update, :show]

  # ALTERAR IDIOMA
  get 'set_language/portuguese'
  get 'set_language/spanish'

  root "pages#home"
end
