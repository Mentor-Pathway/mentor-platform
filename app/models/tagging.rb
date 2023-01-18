class Tagging < ApplicationRecord
  validates :pathway, uniqueness: { scope: :tag_id, message: "tag must be unique" }
  
  belongs_to :tag, optional: true
  belongs_to :pathway, optional: true
  belongs_to :challenge, optional: true
  belongs_to :profile, optional: true
end
