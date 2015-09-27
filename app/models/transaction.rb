class Transaction < ActiveRecord::Base
  belongs_to :transable, polymorphic: true
  belongs_to :user
  validates :amount, :format => { :with => /\A[0-9.0-9 ][0-9.0-9' ]*\z/, message: "Only allowed numbers and decimal" }, presence: true
end
