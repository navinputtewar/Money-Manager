class IncomesController < ApplicationController

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To get Qualifications of perticular Employee 
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
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To create Qualifications for perticular Employee 
  #++
  def create
    @user = User.find(current_user.id)
    @incomes = @user.incomes.create(incomes_params)
    byebug
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
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To delete Qualification for perticular Employee 
  #++
  def destroy
    @incomes = Income.find(current_user.id)
    user_id = @incomes.user_id
    @incomes.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Created by- Navin Puttewar 
    # Created on- 4/08/15 
    # Purpose :- To provide strong parameter for creating Qualification for perticular Employee 
    #++
    def incomes_params
      params.require(:income).permit(:category, :amount, :date)
    end

end

