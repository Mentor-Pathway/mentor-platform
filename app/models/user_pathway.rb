class UserPathway < ApplicationRecord
    belongs_to :user
    belongs_to :pathway
end
