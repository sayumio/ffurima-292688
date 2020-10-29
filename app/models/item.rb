class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :freight
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_region
  belongs_to_active_hash :ship_date

  #空の状態で投稿できない
  validates :name, :description, :category, :status, :freight, :ship_region, :ship_date, presence: true

  #選択が"--"では投稿できない
  validates :category_id, :status_id, :freight_id, :ship_region_id, :ship_date_id, numericality: { other_than: 1 }
end
