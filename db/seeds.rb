# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |request|
  Request.create!(date: Date.today, reason: " #{request} sample data set 1.")
  Request.create!(date: Date.tomorrow, reason: " #{request} sample data set 2.")
  Request.create!(date: Date.today+2, reason: " #{request} sample data set 3.")
  Request.create!(date: Date.tomorrow+2, reason: " #{request} sample data set 4")
end

puts "80 sample data requests created"
