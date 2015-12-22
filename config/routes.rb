Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }

  get :home, to: 'pages#home', as: :home

  authenticated :user do
    devise_scope :user do
      root to: "pages#home", as: "root"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "user/registrations#new", as: "unauthenticated"
    end
  end
end
