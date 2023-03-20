FactoryBot.define do
  factory :buy_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { '2' }
    municipality { '東京都' }
    address { '1-1' }
    phone_number { '00000000000' }
  end
end
