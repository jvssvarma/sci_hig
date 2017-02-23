class Request < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :reason
  enum status: { submitted: 0, approved: 1, rejected: 2 }
end
