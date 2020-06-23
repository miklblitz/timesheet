Rails.application.routes.draw do
  root to: 'pages#index'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
