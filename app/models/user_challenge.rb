class UserChallenge < ApplicationRecord
    validates :completed, 
    validates :notes, length: { maximum: 1500, }
    validates :feedback, length: { maximum: 1500, }
    validates :rating, numericality: { less_than_or_equal_to: 5, only_integer: true, greater_than_or_equal_to: 1 }
end
