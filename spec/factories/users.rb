FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {"test1234"}
    password_confirmation {password}
    last_name {"中山"}
    first_name {"達彦"}
    last_name_reading {"ナカヤマ"}
    first_name_reading {"タツヒコ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
