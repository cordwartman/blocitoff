require 'faker'

# Create Users
5.times do
  User.create!(
    email:    Faker::Internet.unique.email,
    password: Faker::Internet.password(8)
    )
end

# Create a main user
admin = User.create(
  email:    'cordwartman@gmail.com',
  password: 'password'
)

# Create a second main user
admin = User.create!(
  email:    'test@example.com',
  password: 'password',
)

users = User.all

# Create Items
70.times do
  item = Item.create!(
    name: Faker::LordOfTheRings.location,
    user: users.sample,
  )
  item.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
