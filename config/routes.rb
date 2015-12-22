Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }

  get :home, to: 'pages#home', as: :home
  root 'pages#home'
end
