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
end
