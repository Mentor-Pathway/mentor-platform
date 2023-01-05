class Pathway < ApplicationRecord
  validates :title, presence: true, format: {with: /[a-zA-Z0-9_-]/}, length: {maximum: 50, minimum: 8}
  validates :details, presence: true, length: {maximum: 1500, minimum: 8}
  validates :difficulty, presence: true

  enum difficulty: {beginner: 0, intermediate: 1, advanced: 2}

  belongs_to :user
  has_many :path_challenges
  has_many :user_pathways, dependent: :destroy
  has_many :challenges, through: :path_challenges
  has_one_attached :photo

  validates :user, presence: true
end
