class IncomesController < ApplicationController

  #--
  # Purpose :- To get Income of perticular User 
  #++
  def index
    @user = User.find(current_user.id)
    @incomes = @user.incomes.paginate(:page => params[:page], :per_page => 5)
    @incomes = @incomes.like(params[:filter]) if params[:filter]
  end

  def new
    @user = User.find(current_user.id)
    @incomes = Income.new
  end

  #-- 
  # Purpose :- To create Income for perticular User 
  #++
  def create
    @user = User.find(current_user.id)
    @incomes = @user.incomes.create(incomes_params)
    if @incomes.valid?
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @incomes = Income.find(params[:id])    
  end

  def edit
    @user = User.find(current_user.id)
    @incomes = Income.find_by_user_id(@user)
  end

  def update
    @user = User.find(current_user.id)
    @incomes = Income.find_by_user_id(@user)
    @incomes.update_attributes(incomes_params)
    if @incomes.valid?
      @incomes.save
      render 'show'
    else
      render 'new'
    end
  end

  #--
  # Purpose :- To delete Income for perticular User 
  #++
  def destroy
    @incomes = Income.find(params[:id])
    @incomes.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Purpose :- To provide strong parameter for creating Income for perticular User 
    #++
    def incomes_params
      params.require(:income).permit(:category, :amount, :date)
    end

end

