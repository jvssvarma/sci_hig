# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@employee1 = Employee.create(email: 'checking1@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf',
                     first_name: 'John', last_name: 'Doe', phone: "4088968055")
@employee2 = Employee.create(email: 'checking2@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf',
                     first_name: 'Jane', last_name: 'Mara', phone: "4088968055")
AdminUser.create(email: 'adminuser@hig.com', password: 'adminuser', password_confirmation: 'adminuser',
                     first_name: 'Vicky', last_name: 'Delgado', phone: "5102409970")

AuditLog.create!(user_id: @employee1.id, status: 0, start_date: 1.week.ago.beginning_of_week)
AuditLog.create!(user_id: @employee2.id, status: 0, start_date: 1.week.ago.beginning_of_week)
AuditLog.create!(user_id: @employee1.id, status: 0, start_date: 3.week.ago.beginning_of_week)
AuditLog.create!(user_id: @employee2.id, status: 0, start_date: 3.week.ago.beginning_of_week)

20.times do |request|
  Request.create!(date: Date.today, reason: " #{request} Tacos thundercats +1 post-ironic seitan prism bitters, etsy schlitz meh. Heirloom hot chicken tilde occupy. Keffiyeh kickstarter marfa hot chicken, thundercats austin succulents pug biodiesel craft beer squid hella chambray. Four dollar toast hammock pop-up +1 kickstarter fashion axe. Lumbersexual man braid brunch, bespoke coloring book blog scenester typewriter beard. Authentic raclette locavore, kickstarter iPhone hashtag tacos trust fund pop-up vexillologist DIY art party marfa put a bird on it selvage. Sartorial cardigan listicle, crucifix wayfarers direct trade cray pickled fap hell of.", user_id: @employee1.id, request_hours: 3.5)
  Request.create!(date: Date.tomorrow, reason: " #{request} Woke shoreditch brooklyn disrupt portland, hexagon single-origin coffee gluten-free twee wayfarers post-ironic. Activated charcoal 3 wolf moon bespoke kinfolk, mumblecore kombucha whatever brunch meggings bitters artisan. Jianbing pop-up yuccie, scenester chicharrones selvage viral biodiesel. Blue bottle synth dreamcatcher pok pok. Kickstarter intelligentsia slow-carb asymmetrical, paleo bicycle rights selfies godard DIY. Meditation succulents 3 wolf moon poutine, hashtag thundercats meh iPhone bespoke crucifix irony activated charcoal heirloom kinfolk ethical. Prism bushwick trust fund, taxidermy banh mi skateboard meditation four dollar toast keffiyeh art party unicorn.", user_id: @employee1.id, request_hours: 2.5)
  Request.create!(date: Date.today+2, reason: " #{request} Fixie migas roof party, offal hot chicken single-origin coffee yuccie edison bulb tacos post-ironic hell of schlitz artisan heirloom hammock. Gentrify gluten-free cliche heirloom, +1 cronut kickstarter skateboard austin scenester lo-fi PBR&B. Pok pok franzen echo park next level fap. Marfa cred hammock plaid unicorn godard. Cronut farm-to-table XOXO, stumptown bushwick actually prism hell of tacos jianbing unicorn pour-over typewriter synth. 3 wolf moon knausgaard keytar raw denim. Godard small batch pok pok etsy organic locavore, ennui before they sold out meditation umami.", user_id: @employee2.id, request_hours: 1.0)
  Request.create!(date: Date.tomorrow+2, reason: " #{request} Cornhole bitters lo-fi, fashion axe cronut mlkshk kogi yuccie. Tumblr raw denim gluten-free taxidermy photo booth, shoreditch ennui sriracha. Try-hard bicycle rights XOXO, artisan tofu cred schlitz you probably haven't heard of them man bun semiotics. Tilde wolf lomo vinyl cardigan put a bird on it. Keytar literally synth cred, squid 8-bit fixie brooklyn meggings mlkshk. DIY try-hard freegan, squid actually locavore gochujang jean shorts subway tile. Artisan disrupt four dollar toast fixie jean shorts meh.", user_id: @employee2.id, request_hours: 3.0)
end

puts "Admin User and test employees created. 80 sample requests and audit logs created"
