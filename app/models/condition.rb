class Condition < ActiveHash::Base
  #見た目
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'きれい' },
    { id: 3, name: 'ふつう' },
    { id: 4, name: 'あんまり' },
    { id: 5, name: 'きたない' },
  ]

  include ActiveHash::Associations
  has_many :toilets
end