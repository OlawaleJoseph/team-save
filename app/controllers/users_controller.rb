class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]
  def index
    @users = Users.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.avatar.attach(params[:user][:avatar])
    puts "Avatar!!!!!!!!!!!!!!!!!!"
    puts url_for(user.avatar)
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Account created successfully'
      redirect_to user_path(user)
    else
      flash.now[:alert] = user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar)
  end
end
