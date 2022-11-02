class PathChallenge < ApplicationRecord
    validates :order, numericality: { only_integer: true }
end
