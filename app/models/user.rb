class User < ApplicationRecord
  has_many :requests
  has_many :audit_logs
  has_many :staff_members_associations, class_name: 'StaffMember'
  has_many :staff_members, through: :staff_members_associations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PHONE_REGEX = /\A[0-9]*\Z/
  validates_presence_of :first_name, :last_name, :phone, :property, :ssn
  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }
  validates_numericality_of :ssn
  validates :ssn, length: { is: 4 }

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
