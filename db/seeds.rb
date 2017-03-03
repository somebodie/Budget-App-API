# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.destroy_all
Event.destroy_all
Item.destroy_all

10.times do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password)
end

10.times do
    Event.create(budget: Faker::Commerce.price, name: Faker::Name.title, user_id: Faker::Number.between(1, 10))
end

10.times do
    Item.create(cost: Faker::Commerce.price, event_id: Faker::Number.between(1, 10), name: Faker::Pokemon.name )
end

# https://github.com/stympy/faker
