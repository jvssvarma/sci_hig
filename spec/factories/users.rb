FactoryGirl.define do
  sequence :email do |n|
    "checking#{n}@test.com"
  end

  factory :user do
    first_name 'Johnny'
    last_name 'Depp'
    phone '5555555555'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    property 'Hotel EReal'
    ssn 1234
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    phone "5555555555"
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    property 'Hotel EReal'
    ssn 1234
  end

  factory :unauthorized_user, class: 'User' do
    first_name 'Unauthorized'
    last_name 'User'
    phone "5555555555"
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
    property 'Hotel EReal'
    ssn 1234
  end
end
