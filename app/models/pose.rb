class Pose < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :intensity
  belongs_to :effect

  belongs_to :user
  has_many :likes, dependent: :destroy
  # has_many :liked_users, through: :likes, source: :user
  # liked_usersによって投稿が誰にいいねされているのかを簡単に取得できるようになる。

  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :minute
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :intensity_id
    validates :effect_id
  end

  validates :minute, numericality: { only_integer: true },
                     format: { with: /\A[0-9]\z/ }
end
