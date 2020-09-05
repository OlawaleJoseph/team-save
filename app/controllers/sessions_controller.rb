class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]

  def new; end

  def create
    user = User.where(username: params['user']['username']).first
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.first_name}"
      redirect_to expenses_path
    else
      flash.now[:alert] = 'Invalid username'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:notice] = 'Logged out successfully'
    render :new
  end
end
