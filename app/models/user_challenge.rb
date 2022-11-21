class UserChallenge < ApplicationRecord
  has_many :notes, dependent: :destroy

  validates :rating, numericality: {less_than_or_equal_to: 5, only_integer: true, greater_than_or_equal_to: 1}
end
