class Category < ApplicationRecord
  # has_many :books, dependent: :destroy

  validates :Name, presence: true
  validates :Description, presence: true

  scope :search, -> (keyword){where("Name LIKE ?", "%#{keyword}%")}
end
