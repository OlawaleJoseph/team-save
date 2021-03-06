class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: %i[new create]

  def index
    @users = Users.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Account created successfully'
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    redirect_to expenses_path
  end

  def invitation
    @invitations = current_user.invitations
  end

  def accept_invitation
    invitation = find_invite
    invitation.update(confirmed: true)
    flash[:success] = 'You have been added'
    redirect_to team_path(invitation.team_id)
  end

  def reject_invitation
    invitation = find_invite
    invitation.destroy
    flash[:success] = 'Invitation has been rejected'
    redirect_to '/me/invitations'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar)
  end

  def find_invite
    current_user.team_members.find(params[:invitation_id])
  end
end
