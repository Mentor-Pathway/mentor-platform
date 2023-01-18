class Tagging < ApplicationRecord
  validates :pathway, uniqueness: { scope: :tag_id, message: "tag must be unique" }
  validates :profile, uniqueness: { scope: :tag_id, message: "tag must be unique" }
  validates :challenge, uniqueness: { scope: :tag_id, message: "tag must be unique" }

  belongs_to :tag
  belongs_to :pathway, optional: true
  belongs_to :challenge, optional: true
  belongs_to :profile, optional: true
end
