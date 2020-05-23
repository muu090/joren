class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :check_in

  validates :comment, presence: true
end
