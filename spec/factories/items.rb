FactoryBot.define do
  factory :item do
    name { Faker::Food.fruits }
    text { Faker::Food.description }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    genre_id { 2 }
    condition_id { 2 }
    ship_fee_id { 2 }
    ship_from_id { 2 }
    ship_day_id { 2 }
    association :user

    after(:build) do |i|
      i.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
