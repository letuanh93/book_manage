class Request < ApplicationRecord
  # belongs_to :user

  validates :Deadline, presence: true
end
