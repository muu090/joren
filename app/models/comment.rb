class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :check_in
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :comment, presence: true
end
