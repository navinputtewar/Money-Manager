class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :incomes, dependent: :destroy
  has_many :expences, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :income_categories, dependent: :destroy
  has_many :expence_categories, dependent: :destroy
end
