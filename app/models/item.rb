class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_day

  validates :name, :text, :price, :image, presence: true
  validates :name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  validates :genre_id, :condition_id, :ship_fee_id, :ship_from_id, :ship_day_id, numericality: { other_than: 1, message: 'Select' }
end
