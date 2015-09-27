class Expence < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, as: :transable, dependent: :destroy
  validates :category, :format => { :with => /\A[A-Za-z0-9' ][A-Za-z0-9' ]*\z/, message: "Only allowed letters, numbers and '" }, presence: true
  validates :amount, :format => { :with => /\A[0-9.0-9 ][0-9.0-9' ]*\z/, message: "Only allowed numbers and decimal" }, presence: true

  def self.like(filter)
  	Expence.where("category like ?", "%#{filter}%")
  end

end
