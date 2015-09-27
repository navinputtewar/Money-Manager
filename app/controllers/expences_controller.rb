class ExpencesController < ApplicationController

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To get Expences of perticular User 
  #++
  def index
    @user = User.find(current_user.id)
    @expences = @user.expences.paginate(:page => params[:page], :per_page => 5)
    @expences = @expences.like(params[:filter]) if params[:filter]
  end

  def new
    @user = User.find(current_user.id)
    @expences = Expence.new
  end

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To create Expences for perticular User 
  #++
  def create
    @user = User.find(current_user.id)
    @expences = @user.expences.create(expences_params)
    if @expences.valid?
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @expences = Expence.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
    @expences = Expence.find_by_user_id(@user)
  end

  def update
    @user = User.find(current_user.id)
    @expences = Expence.find_by_user_id(@user)
    @expences.update_attributes(expences_params)
    if @expences.valid?
      @expences.save
      render 'show'
    else
      render 'new'
    end
  end

  #--
  # Created by- Navin Puttewar 
  # Created on- 4/08/15 
  # Purpose :- To delete Expence for perticular User 
  #++
  def destroy
    @expences = Expence.find(current_user.id)
    user_id = @expences.user_id
    @expences.destroy
    redirect_to dashboard_index_path
  end

  private

    #--
    # Created by- Navin Puttewar 
    # Created on- 4/08/15 
    # Purpose :- To provide strong parameter for creating Expence for perticular User 
    #++
    def expences_params
      params.require(:expence).permit(:category, :amount, :date)
    end

end

