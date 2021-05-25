FactoryBot.define do
  factory :item do
    name             {Faker::Name.initials(number: 2)}
    description      {Faker::Lorem.paragraph(sentence_count: 2)}
    price            {Faker::Number.number(digits: 4)}
    delivery_cost_id { "2" }
    delivery_day_id  { "2" }
    prefecture_id    { "2" }
    category_id      { "2" }
    status_id        { "2" }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
