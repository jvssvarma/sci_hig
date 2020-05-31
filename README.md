# Santa Clara Investments and Hotel Investments Group Employee Overtime Tracker
- Sample Admin ID: adminuser@hig.com, Password: adminuser
- Sample User ID: checking1@test.com, Password: asdfasdf

## Features
- Approve Overtime requests
- Send SMS to employees with links
- Admin Dashboard with administrate
- Summary emails to respective property managers
- Admin dashboard to create organization & User accounts

## Key: Salaried employees did or did not get overtime each week

## UI: Bootstrap (No special UI requested)
## Models
- Request: date:date, rationale:text
- User: devise
- AdminUser: STI

## Custom Notification Rake
- Iterate over all the employees in the database skipping Admin users
- Send a message that has instructions and a link
- This must run on mondays at 5am

# New ToDo's
- Document if Employee did not log overtime

# Testing Change
- Just testing git change on my local machine
