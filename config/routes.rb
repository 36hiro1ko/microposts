Rails.application.routes.draw do

  root to: 'static_pages#home'
  get 'signup', to: 'users#new' #signupという名前でアクセスできるように
  get 'login', to:  'sessions#new'
  post   'login',   to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'  
  
  get 'followings/:id', to: 'users#followings', as: 'followings'
  get 'followers/:id', to: 'users#followers', as: 'followers'
  
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
  
  
  
  get '*path', to: 'application#render_404'
end