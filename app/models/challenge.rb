class Challenge < ApplicationRecord
    validates :title, presence: true, format: { with: /[a-zA-Z0-9_-]/}
    validates :details, presence: true
end
