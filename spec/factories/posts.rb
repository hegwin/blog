FactoryBot.define do
  factory :post do
    title_zh  { Faker::Lorem.sentence }
    title_en  { Faker::Lorem.sentence }
    body_zh   { Faker::Lorem.paragraphs.join("\n") }
    body_en   { Faker::Lorem.paragraphs.join("\n") }
    posted_on { Time.now }
    tag_list  { [] }
    status    { :online }
  end
end
