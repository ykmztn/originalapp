class Like < ApplicationRecord
  belongs_to :user
  belongs_to :pose
  
  validates_uniqueness_of :pose_id, scope: :user_id
  # validates_uniqueness_ofによって、pose_idとuser_idの組が1組しかないようにバリデーションをかける。
end
