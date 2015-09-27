class Transaction < ActiveRecord::Base
  belongs_to :transable, polymorphic: true
  belongs_to :user
end
