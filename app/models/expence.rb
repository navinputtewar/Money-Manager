class Expence < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, as: :transable, dependent: :destroy

  def self.like(filter)
  	Expence.where("category like ?", "%#{filter}%")
  end
end
