class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :category
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :page_number, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
end
