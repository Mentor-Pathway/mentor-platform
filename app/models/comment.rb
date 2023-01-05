class Comment < ApplicationRecord
  belongs_to :user_challenge
  belongs_to :user
end
