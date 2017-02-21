FactoryGirl.define do
  sequence :email do |n|
    "checking#{n}@test.com"
  end

  factory :user do
    first_name 'Johnny'
    last_name 'Depp'
    email { generate :email }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'User'
    email 'admin@user.com'
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
