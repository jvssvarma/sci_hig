# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(email: 'checking1@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf',
                     first_name: 'John', last_name: 'Doe', phone: "4088968055")
@user2 = User.create(email: 'checking2@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf',
                     first_name: 'Jane', last_name: 'Mara', phone: "4088968055")
AdminUser.create(email: 'adminuser@hig.com', password: 'adminuser', password_confirmation: 'adminuser',
                     first_name: 'Darshan', last_name: 'Patel', phone: "5102409970")

40.times do |auditlog|
 AuditLog.create!(user_id: @user1.id, status: 0, start_date: Date.today.beginning_of_week)
 AuditLog.create!(user_id: @user2.id, status: 0, start_date: Date.today.beginning_of_week)
end

20.times do |request|
  Request.create!(date: Date.today, reason: " #{request} sample data set 1.", user_id: @user1.id, request_hours: 3.5)
  Request.create!(date: Date.tomorrow, reason: " #{request} sample data set 2.", user_id: @user1.id, request_hours: 2.5)
  Request.create!(date: Date.today+2, reason: " #{request} sample data set 3.", user_id: @user2.id, request_hours: 1.0)
  Request.create!(date: Date.tomorrow+2, reason: " #{request} sample data set 4", user_id: @user2.id, request_hours: 3.0)
end

puts "Admin and test users created. 80 sample requests and audit logs created"
