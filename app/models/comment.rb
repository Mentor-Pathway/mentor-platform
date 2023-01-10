class Comment < ApplicationRecord
  validates :message,
    length: {maximum: 1500},
    presence: true
  belongs_to :user_challenge
  belongs_to :user

  broadcasts_to ->(comment) { "comments" }, inserts_by: :prepend
end
