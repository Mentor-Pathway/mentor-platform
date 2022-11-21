class Note < ApplicationRecord
  belongs_to :user_challenge

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(note) { "notes" }, inserts_by: :prepend
end
