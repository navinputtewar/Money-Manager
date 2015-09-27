class ReportsController < ApplicationController

  def by_category
  	@reports = Expence.all.group(:category)
  end

  def by_date_range

  end

end
