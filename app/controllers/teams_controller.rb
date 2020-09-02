class TeamsController < ApplicationController
  def index
    @teams = Team.where(creator_id: current_user.id).includes(:expenses, :members)
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
    begin
      invitee = User.find_by!(username: params['username'])
      team = Team.find(params['team_id'])
      
      unless invitee.invited_teams.include?(team)
        invitee.invited_teams << team
        flash[:success] = 'Invite Sent'
        redirect_to team_path(params[:team_id])
      end
    rescue
      flash[:alert] = 'User does not exist'
      redirect_to team_path(params[:team_id])
    end
  end

  def team_params
    params.require(:team).permit(:name, :image)
  end

  def invite_params
    params.require(:team_member).permit(:username)
  end
end
