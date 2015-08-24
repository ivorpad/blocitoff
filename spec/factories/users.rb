FactoryGirl.define do
  factory :user do
    name "Admin Example"
    #sequence(:email, 100) { |n| "person#{n}@example.com" }
    email "admin@example.com"
    password "12345678"
    password_confirmation "12345678"
    confirmed_at Time.now
  end
end
