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
      team = Team.find(params['team_id'])
      if team.creator.id != current_user.id
        flash.now[:error] = 'You are authorised to perform this operation'
      elsif current_user.username == params['username']
        flash.now[:error] = 'You can not invite youself'
      end

      invitee = User.find_by!(username: params['username'])

      unless invitee.invited_teams.include?(team)
        invitee.invited_teams << team
        flash[:success] = 'Invite Sent'
        redirect_to team_path(params[:team_id])
      end
    rescue StandardError
      flash[:alert] = 'User does not exist'
      redirect_to team_path(params[:team_id])
    end
  end

  def team_params
    params.require(:team).permit(:name, :image)
  end
end
