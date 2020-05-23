class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :store
  has_many :comments
end
