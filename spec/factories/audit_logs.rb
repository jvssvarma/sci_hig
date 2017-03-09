FactoryGirl.define do
  factory :audit_log do
    user
    status 0
    start_date (Date.today.beginning_of_week)
    end_date "2017-03-06"
  end
end
