class ExpensesController < ApplicationController
  before_action :check_user_expenses, only: [:show]

  def index
    @expenses = current_user.expenses.desc.map { |expense| expense.teams.exists? }
  end

  def external
    @expenses = current_user.expenses.desc.reject { |expense| expense.teams.exists? }
  end

  def new
    @expense = current_user.expenses.build
    @teams = current_user.my_teams
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      flash[:success] = 'Expense succesfully created'
      redirect_to expenses_path
    else
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def destroy
    @expense = Expense.find(params[:id])
    return unless @expense

    @expense.destroy
    flash[:notice] = 'Expense deleted successfully'
    redirect_to expenses_path
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, team_ids: [])
  end

  def check_user_expenses
    return if current_user.expenses.empty?
  end
end
