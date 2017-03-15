FactoryGirl.define do
  factory :request do
    date Date.today
    work_summary "Some excuse for more money"
    in_time Time.now-10.hours
    out_time Time.now
    user
  end

  factory :another_request, class: "Request" do
    date Date.tomorrow
    work_summary "Another excuse still for money"
    in_time Time.now.yesterday-9.hours
    out_time Time.now.yesterday
    user
  end

  factory :random_request_from_another_user, class: "Request" do
    date Date.yesterday
    work_summary "Checking with random user"
    in_time Time.now-8.hours
    out_time Time.now
    unauthorized_user
  end
end
