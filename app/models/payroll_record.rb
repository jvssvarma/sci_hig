class PayrollRecord < ApplicationRecord
  belongs_to :user
  validates_presence_of :start_date, :end_date, :hours, :amount
end
