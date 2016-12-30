class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # belongs_to :category
  # belongs_to :user

  validates :Title, presence: true
  validates :Description, presence: true
  validates :Page_number, presence: true
  validates :Author, presence: true
  validates :Publisher, presence: true

  scope :in_category, -> category_id do
    where Category_id: category_id if category_id.present?
  end

  scope :search, -> (keyword){where "Title LIKE ?", "%#{keyword}%"}

  scope :filter, -> keyword{where("Title LIKE ?", "%#{keyword}%")}
end
