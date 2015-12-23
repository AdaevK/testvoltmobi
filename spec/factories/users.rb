FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@test.com" }
    password '12345678'
    password_confirmation '12345678'

    transient do
      tasks_count 5
    end

    trait :with_tasks do
      after(:create) do |user, evaluator|
        create_list(:task, evaluator.tasks_count, user: user)
      end
    end
  end
end
