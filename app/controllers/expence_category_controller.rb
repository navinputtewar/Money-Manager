class ExpenceCategoryController < ApplicationController

  #--
  # Purpose :- To get ExpenceCategory of perticular User 
  #++
  def index
    @user = User.find(current_user.id)
    @expence_category = @user.expence_categories.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @user = User.find(current_user.id)
    @expence_category = ExpenceCategory.new
  end

  #--
  # Purpose :- To create ExpenceCategory for perticular User 
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
  # Purpose :- To delete ExpenceCategory for perticular User 
  #++
  def destroy
    @expence_category = ExpenceCategory.find(params[:id])
    @expence_category.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Purpose :- To provide strong parameter for creating ExpenceCategory for perticular User 
    #++
    def expence_category_params
      params.require(:expence_category).permit(:expence_source, :description)
    end

end

