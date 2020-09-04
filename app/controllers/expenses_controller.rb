class ExpensesController < ApplicationController
  before_action :check_user_expenses, only: [:show]
  before_action :set_expense, only: [:show, :destroy]

  def index
    @expenses = current_user.expenses.desc.select { |expense| expense.teams.exists? }
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
    
    if @expense
      @expense.destroy
      flash[:notice] = 'Expense deleted successfully'
      redirect_to expenses_path
    else
      flash[:alert] = 'Expense not found'
      redirect_to expenses_path
    end

  end

  private
  def expense_params
    params.require(:expense).permit(:name, :amount, team_ids: [])
  end

  def check_user_expenses
    return if current_user.expenses.empty?
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end
end
