class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :freight
  belongs_to_active_hash :status

  #空の状態で投稿できない
  validates :category, :status, :freight, presence: true

  #選択が"--"では投稿できない
  validates :category_id, :status_id, :freight_id,  numericality: { other_than: 1 }
end
