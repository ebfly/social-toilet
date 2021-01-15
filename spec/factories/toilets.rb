FactoryBot.define do
  factory :toilet do
    name               {"washlet"}
    prefecture_id      {2}
    category_id        {2}
    condition_id       {2}
    number_id          {2}
    multi_id           {2}
    text               {Faker::Lorem.sentence}

    association :user

    after(:build) do |toilet|
      toilet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end