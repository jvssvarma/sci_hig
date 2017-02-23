# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(email: 'checking1@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'John', last_name: 'Doe')
@user2 = User.create(email: 'checking2@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf', first_name: 'Jane', last_name: 'Mara')
AdminUser.create(email: 'adminuser@hig.com', password: 'adminuser', password_confirmation: 'adminuser', first_name: 'Darshan', last_name: 'Patel')

puts "Admin and test users created"

20.times do |request|
  Request.create!(date: Date.today, reason: " #{request} sample data set 1.", user_id: @user1.id)
  Request.create!(date: Date.tomorrow, reason: " #{request} sample data set 2.", user_id: @user1.id)
  Request.create!(date: Date.today+2, reason: " #{request} sample data set 3.", user_id: @user2.id)
  Request.create!(date: Date.tomorrow+2, reason: " #{request} sample data set 4", user_id: @user2.id)
end

puts "80 sample data requests created"
