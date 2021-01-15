class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '洋式・和式' },
    { id: 3, name: '洋式のみ' },
    { id: 4, name: '和式のみ' }
  ]

  include ActiveHash::Associations
  has_many :toilets
  end