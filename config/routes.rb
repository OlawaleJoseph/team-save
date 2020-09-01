Rails.application.routes.draw do
  root 'pages#index'
  resources :users, only: [:new, :create, :show]
end
