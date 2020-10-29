class Item < ApplicationRecord
  has_one_attached :image
  belongs_to       :user
  has_one          :order

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

  #40文字以内でないと投稿できない
  validates :name, length: { maximum: 40 }

  #1000文字以内でないと投稿できない
  validates :description, length: { maximum: 1000 }

  #300〜9999999以内でないと投稿できない
  validates :price, length: { in: 300..9999999 }

  #数字でないと投稿できない
  validates :price, :numericality => { :only_interger => true }
end
