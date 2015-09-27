class TransactionsController < ApplicationController
  before_action :new, only: [:income_new, :expence_new]

  def index
    @transaction = Transaction.all
  end

  def new
    @context = context
    @transaction = @context.transactions.new
  end

  def create
    @context = context
    @transaction = @context.transactions.new(transaction_params)
    @transaction.user_id = current_user.id

    if @transaction.save
      redirect_to context_url(context), notice: "The transaction has been successfully created."
    end
  end


  def show
    @transaction = Transaction.all
  end

  def edit
    @context = context
    @transaction = context.transactions.find(params[:id])
  end

  def update
    @context = context
    @transaction = @context.transactions.find(params[:id])
    if @transaction.update_attributes(transaction_params)
      redirect_to context_url(context), notice: "The transaction has been updated"
    end
  end

private
  def transaction_params
    params.require(:transaction).permit(:date, :from, :to, :amount, :description)
  end

  def context
    if params[:income_id]
      id = params[:income_id]
      Income.find(params[:income_id])
    else
      id = params[:expence_id]
      byebug
      Expence.find(params[:expence_id])
    end
  end 

  def context_url(context)
    if Income === context
      dashboard_index_path
    else
      dashboard_index_path
    end
  end
end
