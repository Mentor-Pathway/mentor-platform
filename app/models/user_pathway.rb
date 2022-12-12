class UserPathway < ApplicationRecord
    belongs_to :user
    belongs_to :pathway
    has_many :user_challenges, dependent: :destroy
end
