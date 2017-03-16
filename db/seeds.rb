# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@employee1 = Employee.create(email: 'checking1@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf',
                     first_name: 'John', last_name: 'Doe', phone: "4088968055", property: 'Hotel EReal', ssn: 1234, hourly_rate: 22.0, overtime_rate: 26.0)
@employee2 = Employee.create(email: 'checking2@test.com', password: 'asdfasdf', password_confirmation: 'asdfasdf',
                     first_name: 'Jane', last_name: 'Mara', phone: "4088968055", property: 'Hotel EReal', ssn: 1234, hourly_rate: 20.0, overtime_rate: 24.0)
AdminUser.create(email: 'adminuser@hig.com', password: 'adminuser', password_confirmation: 'adminuser',
                     first_name: 'Vicky', last_name: 'Delgado', phone: "5102409970", property: 'Hotel EReal', ssn: 1234, hourly_rate: 40.0, overtime_rate: 55.0)

AuditLog.create!(user_id: @employee1.id, status: 0, start_date: Date.today.beginning_of_week)
AuditLog.create!(user_id: @employee2.id, status: 0, start_date: 1.week.ago.beginning_of_week)
AuditLog.create!(user_id: @employee1.id, status: 0, start_date: 2.week.ago.beginning_of_week)
AuditLog.create!(user_id: @employee2.id, status: 0, start_date: 3.week.ago.beginning_of_week)

7.times do |num|
  Request.create!(date: 1.week.ago.end_of_week-num.days, work_summary: " #{num} Tacos thundercats +1 post-ironic seitan prism bitters, etsy schlitz meh. Heirloom hot chicken tilde occupy. Keffiyeh kickstarter marfa hot chicken, thundercats austin succulents pug biodiesel craft beer squid hella chambray. Four dollar toast hammock pop-up +1 kickstarter fashion axe. Lumbersexual man braid brunch, bespoke coloring book blog scenester typewriter beard. Authentic raclette locavore, kickstarter iPhone hashtag tacos trust fund pop-up vexillologist DIY art party marfa put a bird on it selvage. Sartorial cardigan listicle, crucifix wayfarers direct trade cray pickled fap hell of.", user_id: @employee1.id, in_time: Time.now-8.hours, out_time: Time.now)
  Request.create!(date: 1.week.ago.end_of_week-num.days, work_summary: " #{num} Keytar everyday carry twee chartreuse quinoa forage. Bespoke normcore man bun, cliche skateboard aesthetic tacos gentrify gastropub. Brunch organic street art next level. Food truck hashtag shabby chic hoodie quinoa master cleanse mumblecore truffaut, affogato literally. Actually tumeric pug air plant, gastropub fingerstache scenester health goth organic pitchfork. Thundercats twee coloring book, humblebrag YOLO quinoa godard keffiyeh wolf flexitarian. Ennui direct trade kombucha, food truck art party sartorial snackwave shabby chic paleo cold-pressed pour-over.", user_id: @employee1.id, in_time: Time.now-9.hours, out_time: Time.now)
  Request.create!(date: 1.week.ago.end_of_week-num.days, work_summary: " #{num} Woke shoreditch brooklyn disrupt portland, hexagon single-origin coffee gluten-free twee wayfarers post-ironic. Activated charcoal 3 wolf moon bespoke kinfolk, mumblecore kombucha whatever brunch meggings bitters artisan. Jianbing pop-up yuccie, scenester chicharrones selvage viral biodiesel. Blue bottle synth dreamcatcher pok pok. Kickstarter intelligentsia slow-carb asymmetrical, paleo bicycle rights selfies godard DIY. Meditation succulents 3 wolf moon poutine, hashtag thundercats meh iPhone bespoke crucifix irony activated charcoal heirloom kinfolk ethical. Prism bushwick trust fund, taxidermy banh mi skateboard meditation four dollar toast keffiyeh art party unicorn.", user_id: @employee2.id, in_time: Time.now.yesterday-9.hours, out_time: Time.now.yesterday)
  Request.create!(date: 1.week.ago.end_of_week-num.days, work_summary: " #{num} Echo park dreamcatcher stumptown, subway tile quinoa bespoke cliche raclette beard. Man bun semiotics wayfarers sartorial gentrify waistcoat quinoa banh mi kogi vice. Church-key kinfolk edison bulb celiac seitan. Pitchfork pour-over wayfarers stumptown, poke man bun small batch ugh franzen pinterest etsy kitsch brooklyn forage. Locavore tbh cornhole, vaporware disrupt schlitz skateboard tacos butcher asymmetrical hot chicken. Direct trade freegan church-key, stumptown ethical bushwick chicharrones tousled. Plaid retro cray pork belly.", user_id: @employee2.id, in_time: Time.now.yesterday-8.hours, out_time: Time.now.yesterday)
end

puts "Admin User and test employees created. 28 sample requests and audit logs created"
