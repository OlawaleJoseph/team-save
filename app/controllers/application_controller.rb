class ApplicationController < ActionController::Base
  before_action :authenticate_user

  def current_user
    User.where(id: session[:user_id]).first
  end

  def authenticate_user
    redirect_to new_session_path unless current_user
  end

  helper_method :current_user
end
