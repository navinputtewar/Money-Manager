class Transaction < ActiveRecord::Base
  belongs_to :trackble, polymorphic: true
  belongs_to :user
end
