class Tag < ApplicationRecord
   has_many :taggings, dependent: :destroy
   has_many :pathways, through: :taggings 
   has_many :challenges, through: :taggings 
   has_many :profiles, through: :taggings 
   validates :name, uniqueness: true
end
