class Pose < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :intensity
  belongs_to :effect

  belongs_to :user
  has_many :comments
  
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

end
