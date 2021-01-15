FactoryBot.define do
  factory :user do
    nickname              { 'now' }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    prefecture_id         { '2' }
    city                  { '新宿区'}
  end
end
