class IncomeCategoryController < ApplicationController

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To get Qualifications of perticular Employee 
  #++
  def index
    @user = User.find(current_user.id)
    @income_category = @user.income_categories.paginate(:page => params[:page], :per_page => 5)
    #@incomes = @incomes.like(params[:filter]) if params[:filter]
  end

  def new
    @user = User.find(current_user.id)
    @income_category = IncomeCategory.new
  end

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To create Qualifications for perticular Employee 
  #++
  def create
    @user = User.find(current_user.id)
    @income_category = @user.income_categories.create(income_category_params)
    if @income_category.valid?
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @income_category = IncomeCategory.find(params[:id])    
  end

  def edit
    @user = User.find(current_user.id)
    @income_category = IncomeCategory.find_by_user_id(@user)
  end

  def update
    @user = User.find(current_user.id)
    @income_category = IncomeCategory.find_by_user_id(@user)
    @income_category.update_attributes(income_category_params)
    if @income_category.valid?
      @income_category.save
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
    @income_category = IncomeCategory.find(current_user.id)
    user_id = @income_category.user_id
    @income_category.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Created by- Navin Puttewar 
    # Created on- 4/08/15 
    # Purpose :- To provide strong parameter for creating Qualification for perticular Employee 
    #++
    def income_category_params
      params.require(:income_category).permit(:income_source, :description)
    end

end

