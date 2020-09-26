class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :ship_from
  belongs_to_active_hash :ship_day
end
