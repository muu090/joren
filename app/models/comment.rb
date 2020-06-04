class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :check_in
  has_many :likes, dependent: :destroy

  def liked_by?(user)  # 引数で渡されたユーザidがlikesテーブル内に存在（exists?）するかどうかを確認
    likes.where(user_id: user.id).exists?
  end

  validates :comment, presence: true
end
