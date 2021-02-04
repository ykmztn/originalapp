class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: { male: 1, female: 2, others: 3, noanswer: 4 },
       age:    { teens: 1, twenties: 2, thirties: 3, forties: 4, more: 5}

  has_many :poses
  has_many :comments
end