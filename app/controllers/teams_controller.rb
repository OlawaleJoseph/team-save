class TeamsController < ApplicationController
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

  def index
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

  def team_params
    params.require(:team).permit(:name, :image)
  end
end
