class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :Follower_Id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :Followed_Id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  before_save :downcase_email
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

 def follow other_user
    active_relationships.create(Followed_Id: other_user.id)
  end

  def unfollow other_user
    active_relationships.find_by(Followed_Id: other_user.id).destroy
  end

  def following? other_user
    following.include?(other_user)
  end
    private

    def downcase_email
      self.email = email.downcase
    end
end
