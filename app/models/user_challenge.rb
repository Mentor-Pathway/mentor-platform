class UserChallenge < ApplicationRecord
    validates :completed, presence: true
    validates :user_notes, presence: true, length: { maximum: 1500, }
    validates :res_feedback, presence: true, length: { maximum: 1500, }
    validates :rating, numericality: { less_than_or_equal_to: 5, only_integer: true }
end         