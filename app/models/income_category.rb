class IncomeCategory < ActiveRecord::Base
  belongs_to :user
  validates :income_source, :format => { :with => /\A[A-Za-z0-9' ][A-Za-z0-9' ]*\z/, message: "Only allowed letters, numbers and '" }, presence: true
end
