class Tag < ApplicationRecord
   has_many :taggings
   has_many :pathways, through: :taggings 
   has_many :challenges, through: :taggings 
   has_many :profiles, through: :taggings 
end
