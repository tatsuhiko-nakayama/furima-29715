FactoryBot.define do
  factory :order_address do
    postal_code { '000-0000' }
    prefecture_id { 2 }
    city { 'a' }
    house_number { 'a' }
    building_name { 'a' }
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token { 1 }
  end
end
