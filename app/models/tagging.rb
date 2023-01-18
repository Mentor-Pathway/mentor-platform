class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :pathway, optional: true
  belongs_to :challenge, optional: true
  belongs_to :profile, optional: true
end
