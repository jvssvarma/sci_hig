class Request < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :reason
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  scope :requests_added_by, -> (user) { where(user_id: user.id) }
end
