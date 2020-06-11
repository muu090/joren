class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :check_ins, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :following, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :following, source: :followed # 自分がフォローしている人
  has_many :followed_user, through: :followed, source: :following # 自分がフォローされている人

  def follow(user_id)
    following.create(followed_id: user_id)
  end
  
  # ユーザーのフォローを外す
  def unfollow(user_id)
    following.find_by(followed_id: user_id).destroy
  end
  
  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  def joren(user)
    user.check_ins.group(:store_id).having('count(*) >= 20') # 20個以上同じstore_idカラムが20個以上重複しているデータを配列で取得
  end

  def not_joren(user)
    user.check_ins.group(:store_id).having('count(*) <= 19') # 同じstore_idカラムを持つレコードが19以下のデータを配列で取得
  end

  attachment :profile_image, destroy: false

  validates :name, length: {maximum: 25, minimum: 2}
  validates :introduction, length: {maximum:50}
end
