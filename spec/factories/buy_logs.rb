FactoryBot.define do
  factory :buy_log do
    association :user
    association :item
  end
end
