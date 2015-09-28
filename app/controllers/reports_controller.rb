class ReportsController < ApplicationController

  def by_category
  	@reports = Expence.all.group(:category)
  end

  def by_date_range
  	@reports = Expence.all
    @report_months = @reports.group_by { |t| t.date.beginning_of_month }
  end


end
