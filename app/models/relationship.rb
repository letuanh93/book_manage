class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  validates :Follower_Id, presence: true
  validates :Followed_Id, presence: true
end
