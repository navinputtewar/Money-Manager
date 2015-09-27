class Income < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, as: :transable, dependent: :destroy

  def self.like(filter)
  	Income.where("category like ?", "%#{filter}%")
  end
end
