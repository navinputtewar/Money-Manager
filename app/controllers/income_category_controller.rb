class IncomeCategoryController < ApplicationController

  #-- 
  # Purpose :- To get IncomeCategory of perticular User 
  #++
  def index
    @user = User.find(current_user.id)
    @income_category = @user.income_categories.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @user = User.find(current_user.id)
    @income_category = IncomeCategory.new
  end

  #--
  # Purpose :- To create IncomeCategory for perticular User 
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

  #-- 
  # Purpose :- To Update IncomeCategory for perticular User 
  #++

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
  # Purpose :- To delete IncomeCategory for perticular User 
  #++
  def destroy
    @income_category = IncomeCategory.find(params[:id])
    @income_category.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Purpose :- To provide strong parameter for creating IncomeCategory for perticular User 
    #++
    def income_category_params
      params.require(:income_category).permit(:income_source, :description)
    end

end

