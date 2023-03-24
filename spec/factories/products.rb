FactoryBot.define do
  factory :product do
    name                 {'test'}
    explanation          {'説明'}
    category_id          { 2 }
    situation_id         { 2 }
    shipping_charge_id   { 2 }
    prefecture_id        { 2 }
    number_of_day_id     { 2 }
    price                { 1000 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/image/logo.png'), filename: 'logo.png')
    end
  end
end
