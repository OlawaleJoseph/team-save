Rails.application.routes.draw do
  root 'pages#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  delete 'logout', to: 'sessions#destroy'
end
