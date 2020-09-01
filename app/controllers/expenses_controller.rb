class ExpensesController < ApplicationController

  def index
    @expenses = Expense.includes(:author).where(author_id: current_user.id)
  end

  def new
    @expense = Expense.new
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
  end

  def delete
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
