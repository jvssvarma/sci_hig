FactoryGirl.define do
  factory :request do
    date Date.today
    reason "Some excuse for more money"
    user
  end

  factory :another_request, class: "Request" do
    date Date.tomorrow
    reason "Another excuse still for money"
    user
  end

  factory :random_request_from_another_user, class: "Request" do
    date Date.yesterday
    reason "Checking with random user"
    unauthorized_user
  end
end
