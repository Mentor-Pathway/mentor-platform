class Note < ApplicationRecord
  belongs_to :user_challenge

  broadcasts_to ->(note) { "notes" }, inserts_by: :prepend
end
