class Challenge < ApplicationRecord
  validates :title, presence: true, format: {with: /[a-zA-Z0-9_-]/}, length: {maximum: 50, minimum: 8}
  validates :details, presence: true, length: {maximum: 1500}

  belongs_to :user
  has_many :path_challenges
  has_many :pathways, through: :path_challenges
  has_one_attached :photo
end
