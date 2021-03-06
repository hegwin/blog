FactoryGirl.define do
  factory :post do
    title_cn  { Faker::Lorem.sentence }
    title_en  { Faker::Lorem.sentence }
    body      { Faker::Lorem.paragraphs.join("\n") }
    posted_on { Time.now }
  end
end
