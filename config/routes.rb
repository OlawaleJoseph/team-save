Rails.application.routes.draw do
  root 'pages#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :expenses, except: [:edit, :update]
  resources :teams, except: [:edit, :update]
  delete 'logout', to: 'sessions#destroy'
end
