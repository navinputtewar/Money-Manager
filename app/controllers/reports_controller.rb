class ReportsController < ApplicationController

  def by_category
  	#@user = User.find_by_id(current_user.id)
  	@reports = Expence.all
  end

  def by_date_range
  	@reports = Expence.all
    @report_months = @reports.group_by { |t| t.date.beginning_of_month }
  end


end
