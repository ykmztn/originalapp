class Effect < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Neck' },
    { id: 3, name: 'Shoulder' },
    { id: 4, name: 'Stomach' },
    { id: 5, name: 'Back' },
    { id: 6, name: 'Lower Back' },
    { id: 7, name: 'Buttock' },
    { id: 8, name: 'Legs' },
    { id: 9, name: 'Mind：Positive' },
    { id: 10, name: 'Mind：Calm Down' },
    { id: 11, name: 'Others' }
  ]

  include ActiveHash::Associations
  has_many :poses
  
  end