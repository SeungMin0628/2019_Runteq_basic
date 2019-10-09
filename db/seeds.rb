# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# When user isn't exists, then create dummy user
if !User.exists? 
  User.create!( 
    email: Faker::Internet.unique.email,
    password: 'secret',
    password_confirmation: 'secret',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  p 'Create dummy user successfully!'
end

# Create dummy 10 boards
user = User.first

10.times { |count|
  user.boards.create!(
    title: Faker::Book.unique.title,
    body: Faker::Source.hello_world
  )

  p "Create dummy board #{count} successfully!"
}