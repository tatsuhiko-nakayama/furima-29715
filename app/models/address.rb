class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'Input correctly' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
end
