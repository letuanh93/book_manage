class Request < ApplicationRecord
  belongs_to :user

  validates :deadline, presence: true
end
