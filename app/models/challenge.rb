class Challenge < ApplicationRecord
  validates :title, presence: true, format: {with: /[a-zA-Z0-9_-]/}, length: {maximum: 50, minimum: 8}
  validates :details, presence: true, length: {maximum: 1500, minimum: 50}

  belongs_to :user
  has_many :path_challenges
  has_many :pathways, through: :path_challenges
  has_many :user_challenges, dependent: :destroy
  has_one_attached :photo
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings 

  validates :user, presence: true
end
