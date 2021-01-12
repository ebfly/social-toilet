class Toilet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :number 
  belongs_to :multi

  has_one_attached :image

  validates :name
  validates :text, length: { maximum: 1000 }
  #各項目の選択が「---」の時は保存できない
  validates :category_id, :condition_id, :number_id, :multi_id,  numericality: { other_than: 1 }
end
