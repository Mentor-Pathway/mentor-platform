class Tag < ApplicationRecord
   has_many :taggings
   has_many :pathways, through: :taggings 

end
