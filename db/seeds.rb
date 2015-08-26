
# Use the Faker gem to generate fake data for **users** and **items**.
# Return to this user story as you continue to build Blocitoff,
  # updating seeds.rb to reflect the changes you make in the app.

10.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all

100.times do
  Item.create!(
    name: Faker::Lorem.sentence
  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
