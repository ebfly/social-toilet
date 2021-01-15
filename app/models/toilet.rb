class Toilet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :prefecture
  belongs_to :category
  belongs_to :condition
  belongs_to :number 
  belongs_to :multi

  has_one_attached :image

  validates :name, presence: true
  #各項目の選択が「---」の時は保存できない
  validates :prefecture_id, :category_id, :condition_id, :number_id, :multi_id,  numericality: { other_than: 1 , message: "を選択してください"}
end
