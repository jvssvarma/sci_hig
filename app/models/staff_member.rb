class StaffMember < ApplicationRecord
  belongs_to :user
  belongs_to :staff_member, class_name: 'User'
end
