class Comment < ApplicationRecord
  validates :message, presence: true, length: {maximum: 1500}
  belongs_to :user_challenge
  belongs_to :user
  broadcasts_to ->(comment) { "comments" }, inserts_by: :prepend
end
