class Genre < ActiveHash::Base
  #個室の数
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1' },
    { id: 3, name: '1~2' },
    { id: 4, name: '2~3' },
    { id: 5, name: '3以上' }
  ]

  include ActiveHash::Associations
  has_many :toilets
  end