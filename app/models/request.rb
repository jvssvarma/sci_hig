class Request < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :reason, :request_hours
  validates :request_hours, numericality: { greater_than: 0.0 }
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  scope :requests_added_by, -> (user) { where(user_id: user.id) }
end
