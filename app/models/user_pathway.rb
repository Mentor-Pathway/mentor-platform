class UserPathway < ApplicationRecord
    has_one :pathway
    belongs_to :user
end
