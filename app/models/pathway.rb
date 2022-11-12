class Pathway < ApplicationRecord
  validates :title, presence: true, format: {with: /[a-zA-Z0-9_-]/}, length: {maximum: 50}
  validates :details, presence: true, length: {maximum: 1500}
  validates :difficulty, presence: true

  belongs_to :user
  has_many :path_challenges
  has_many :challenges, through: :path_challenges
  has_one_attached :photo
end
