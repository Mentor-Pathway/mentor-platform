class Profile < ApplicationRecord
  # On initial creation, profile attributes are nil, on profile update, profile attributes are changed
  # from nil to "", both are valid
  validates :job, format: {with: /\A[a-zA-Z0-9 ]+\z/}, allow_blank: true
  validates :linkedin, format: {with: /.*linkedin.\S*\/\S*/}, allow_blank: true
  validates :github, format: {with: /.*github.\S*\/\S*/}, allow_blank: true
  validates :bio, length: {maximum: 1500, minimum: 40}, allow_blank: true
  belongs_to :user
  has_one_attached :photo
  has_many :taggings
  has_many :tags, through: :taggings 
end
