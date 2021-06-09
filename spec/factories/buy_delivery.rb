FactoryBot.define do
  factory :buy_delivery do
    token         { "tok_abcdefghijk00000000000000000" }
    postal_code   { '111-1111' }
    prefecture_id { 1 }
    municipality  { Faker::Address.city }
    address       { Faker::Address.street_name }
    building_name { Faker::Name.last_name }
    phone_number  { Faker::PhoneNumber.subscriber_number(length: 11) }
    association :user
    association :item
  end
end