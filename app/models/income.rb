class Income < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, as: :transable, dependent: :destroy
  validates :category, :format => { :with => /\A[A-Za-z0-9' ][A-Za-z0-9' ]*\z/, message: "Only allowed letters, numbers and '" }, presence: true
  validates :amount, :format => { :with => /\A[0-9.0-9 ][0-9.0-9' ]*\z/, message: "Only allowed numbers and decimal" }, presence: true
  after_create :create_transaction
  
  def self.like(filter)
  	Income.where("category like ?", "%#{filter}%")
  end
  
  def create_transaction
    Transaction.create(date: params[:income][:date])
  end
  
end

