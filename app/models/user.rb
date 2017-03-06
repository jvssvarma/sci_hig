class User < ApplicationRecord
  has_many :requests
  has_many :audit_logs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PHONE_REGEX = /\A[0-9]*\Z/
  validates_presence_of :first_name, :last_name, :phone
  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
