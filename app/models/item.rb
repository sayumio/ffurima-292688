class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :freight

  #空の状態で投稿できない
  validates :category, :freight, presence: true

  #選択が"--"では投稿できない
  validates :category_id, :freight_id,  numericality: { other_than: 1 }
end
