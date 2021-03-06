# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# add or find admin user
ADMIN_EMAIL = 'admin@example.com'
admin = User.find_or_create_by!(email: ADMIN_EMAIL) do |user|
  user.password = 'secret'
  user.password_confirmation = 'secret'
  user.first_name = 'Admin'
  user.last_name = 'Name'
  user.role = :admin
end

p 'Create or find admin account usccessfully!'


# When user isn't exists, then create dummy user
# if !User.with_role(:general).exists? 
20.times { |count|
  user = User.create!( 
    email: Faker::Internet.unique.email,
    password: 'secret',
    password_confirmation: 'secret',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  p 'Create dummy user successfully!'

  # Create dummy 3 boards
  3.times { |count|
    user.boards.create!(
      title: Faker::Book.unique.title,
      body: Faker::Source.hello_world
    )

    p "Create dummy board #{count} successfully!"
  }
}
