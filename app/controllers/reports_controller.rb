class ReportsController < ApplicationController

  def by_category
  	#@reports = Expence.find(:all, :conditions => [ "category IN (?)", Expence], :limit => 50)
  	@reports = Expence.all.group(:category)
  end

  def by_date_range
  end
end
