FactoryGirl.define do
  factory :task do
    sequence(:name) { Faker::Lorem.sentence }
    sequence(:description) { Faker::Lorem.paragraph(5) }
  end
end
