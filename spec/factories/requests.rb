FactoryGirl.define do
  factory :request do
    date Date.today
    reason "Some excuse for more money"
    request_hours 2.0
    user
  end

  factory :another_request, class: "Request" do
    date Date.tomorrow
    reason "Another excuse still for money"
    request_hours 0.5
    user
  end

  factory :random_request_from_another_user, class: "Request" do
    date Date.yesterday
    reason "Checking with random user"
    request_hours 4
    unauthorized_user
  end
end
