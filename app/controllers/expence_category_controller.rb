class ExpenceCategoryController < ApplicationController

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To get Qualifications of perticular Employee 
  #++
  def index
    @user = User.find(current_user.id)
    @expence_category = @user.expence_categories.paginate(:page => params[:page], :per_page => 5)
    #@incomes = @incomes.like(params[:filter]) if params[:filter]
  end

  def new
    @user = User.find(current_user.id)
    @expence_category = ExpenceCategory.new
  end

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To create Qualifications for perticular Employee 
  #++
  def create
    @user = User.find(current_user.id)
    @expence_category = @user.expence_categories.create(expence_category_params)
    if @expence_category.valid?
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @expence_category = ExpenceCategory.find(params[:id])    
  end

  def edit
    @user = User.find(current_user.id)
    @expence_category = ExpenceCategory.find_by_user_id(@user)
  end

  def update
    @user = User.find(current_user.id)
    @expence_category = ExpenceCategory.find_by_user_id(@user)
    @expence_category.update_attributes(expence_category_params)
    if @expence_category.valid?
      @expence_category.save
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
    @expence_category = ExpenceCategory.find(current_user.id)
    user_id = @expence_category.user_id
    @expence_category.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Created by- Navin Puttewar 
    # Created on- 4/08/15 
    # Purpose :- To provide strong parameter for creating Qualification for perticular Employee 
    #++
    def expence_category_params
      params.require(:expence_category).permit(:expence_source, :description)
    end

end

