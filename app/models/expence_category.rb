class ExpenceCategory < ActiveRecord::Base
  belongs_to :user
  validates :expence_source, :format => { :with => /\A[A-Za-z0-9' ][A-Za-z0-9' ]*\z/, message: "Only allowed letters, numbers and '" }, presence: true
end
