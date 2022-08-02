class ExpensesController < ApplicationController
  before_action :authenticate_user!

    def index
      @user = current_user
      @group = @user.groups.find(params[:group_id])
      @expenses = @user.expenses.where(group_id: @group.id)
      @total_transactions = total_transactions
    end

    def new
      @user = current_user
      @expense = Expense.new
      @group = @user.groups.find(params[:group_id])
    end

    def create
      @user = current_user
      @group = @user.groups.find_by(id: expense_params[:group_id])
      @expense = @user.expenses.new(expense_params)
      @expense.group_id = @group.id
      @group_expense = @expense.group_expenses.new(group_id: @group.id, expense_id: @expense.id)
      if @expense.save && @group_expense.save
        flash[:notice] = 'Transaction successfully created!'
        redirect_to user_group_expenses_path(current_user, @group)
      else
        flash[:notice] = 'Transaction not created!'
        render :new, status: :unprocessable_entity
      end
    end

    def total_transactions
      @user = current_user
      @group = @user.groups.find(params[:group_id])
      @expenses = @user.expenses.where(group_id: @group.id)
      @total_transactions = 0
      @expenses.each do |expense|
        @total_transactions += expense.amount
      end
      @total_transactions
    end

    private

    def expense_params 
      params.require(:expense).permit(:name, :amount, :group_id)
    end
  end