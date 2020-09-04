Rails.application.routes.draw do
  root 'pages#index'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create]
  resources :expenses, except: [:edit, :update]
  resources :teams, except: [:edit, :update]
  delete 'logout', to: 'sessions#destroy'
  post 'teams/:team_id/invite', to: 'teams#invite'
  get '/me/invitations', to: 'users#invitation'
  get '/external/expenses', to: 'expenses#external'
  put '/me/:invitation_id/accept', to: 'users#accept_invitation'
  put '/me/:invitation_id/reject', to: 'users#reject_invitation'
end
