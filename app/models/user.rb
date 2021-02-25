class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { male: 1, female: 2, others: 3, noanswer: 4 },
       age: { teens: 1, twenties: 2, thirties: 3, forties: 4, more: 5 }

  has_many :poses
  has_many :likes, dependent: :destroy
  # has_many :liked_poses, through: :likes, source: :pose
  # liked_posesによってuserがどの投稿をいいねしているのかを簡単に取得できるようになる。

  with_options presence: true do
    validates :nickname
    validates :password
    validates :gender
    validates :age
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: 'Include both letters and numbers' }

  def already_liked?(pose)
    self.likes.exists?(pose_id: pose.id)
  end
  
end
