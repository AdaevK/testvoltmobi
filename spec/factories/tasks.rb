include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :task do
    sequence(:name) { Faker::Lorem.sentence }
    sequence(:description) { Faker::Lorem.paragraph(5) }

    factory :task_with_file do
      file { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'image.jpg'), 'image/jpg') }
    end
  end
end
