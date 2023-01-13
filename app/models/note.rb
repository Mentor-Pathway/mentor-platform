class Note < ApplicationRecord
  belongs_to :user_challenge
  belongs_to :user

  broadcasts_to ->(note) { "notes" }, inserts_by: :prepend
end
