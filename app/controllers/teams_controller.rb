class TeamsController < ApplicationController
  def index
    @teams = []
    @teams.concat(current_user.my_teams, current_user.invited_teams)
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.my_teams.build(team_params)
    if @team.save
      flash[:success] = 'Team succesfully created'
      redirect_to teams_path
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    return unless @team

    @team.destroy
    flash[:notice] = 'Expense deleted successfully'
    redirect_to teams_path
  end

  def invite
    team = Team.find(params['team_id'])
    if current_user.username == params['username']
      flash[:alert] = 'You can not invite youself'
      redirect_to team_path(team)
      return
    end

    invitee = User.find_by!(username: params['username'])

    if invitee.invited_teams.include?(team)
      flash[:alert] = 'Cannot send multiple request to user'
      redirect_to team_path(team)
    else
      invitee.invited_teams << team
      flash[:success] = 'Invite Sent'
      redirect_to team_path(params[:team_id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'User does not exist'
    redirect_to team_path(params[:team_id])
  end

  private
  
  def team_params
    params.require(:team).permit(:name, :image)
  end
end
