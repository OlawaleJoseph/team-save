Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  root 'pages#index'
end
