class OrderAddress

  include ActiveModel::Model
  
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'Input correctly' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    user = User.find(user_id)
    item = Item.find(item_id)
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end