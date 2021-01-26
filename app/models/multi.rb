class Multi < ActiveHash::Base
  #設備内容
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '多目的トイレあり' },
    { id: 3, name: '車イス対応あり' },
    { id: 4, name: 'おむつ交換設備あり' },
    { id: 5, name: '設備全てあり' },
    { id: 6, name: '設備なし' },
    { id: 7, name: 'その他(詳細に記入)' }
  ]

  include ActiveHash::Associations
  has_many :toilets
  end