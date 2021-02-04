class Effect < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '首' },
    { id: 3, name: '肩' },
    { id: 4, name: 'お腹' },
    { id: 5, name: '背中' },
    { id: 6, name: '腰' },
    { id: 7, name: '脚' },
    { id: 8, name: '心：前向き' },
    { id: 9, name: '心：落ち着き' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :poses
  
  end