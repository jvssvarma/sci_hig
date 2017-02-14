class Request < ApplicationRecord
  validates_presence_of :date, :reason
end
