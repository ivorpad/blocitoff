FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    first_name 'Ivor'
    last_name 'Padilla'
    password 'test1234'
  end
end
