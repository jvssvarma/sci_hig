FactoryGirl.define do
  factory :audit_log do
    user
    status 0
    start_date (Date.yesterday)
    end_date "2017-03-06"
  end
end
