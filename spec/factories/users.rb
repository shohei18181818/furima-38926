FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'00000a'}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birth_date            {'1987-01-07'}
  end
end