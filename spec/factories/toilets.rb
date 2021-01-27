FactoryBot.define do
  factory :toilet do
    name               {"washlet"}
    prefecture_id      {2}
    category_id        {2}
    condition_id       {2}
    number_id          {2}
    multi_id           {2}
    text               {Faker::Lorem.sentence}
    address            {"東京都渋谷区"}
    latitude           {"35.661971"}
    longitude          {"139.703795"}
    association :user

    after(:build) do |toilet|
      toilet.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end