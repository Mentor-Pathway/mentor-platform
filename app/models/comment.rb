class Comment < ApplicationRecord
  validates :message,
    length: {maximum: 1500},
    presence: true
  belongs_to :user_challenge
  belongs_to :user
end
