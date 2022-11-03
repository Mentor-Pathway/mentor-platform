class Pathway < ApplicationRecord
    validates :title, presence: true, format: { with: /[a-zA-Z0-9_-]/}, length: { maximum: 50 }
    validates :details, presence: true, length: { maximum: 1500 }
    validates :difficulty, presence: true, length: { minimum: 3 }

    has_many :path_challenges
    has_many :challenges, through: :path_challenges
end
