class UserChallenge < ApplicationRecord
  has_many :notes, dependent: :destroy
  validates :notes, length: {maximum: 1500}
  # validates :feedback, length: {maximum: 1500}
  validates :rating, numericality: {less_than_or_equal_to: 5, only_integer: true, greater_than_or_equal_to: 1}, allow_nil: true
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :user_pathway
  belongs_to :challenge
end
