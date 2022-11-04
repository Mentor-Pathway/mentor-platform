class PathChallenge < ApplicationRecord
    validates :order, numericality: { only_integer: true }

    belongs_to :pathway
    belongs_to :challenge
end
