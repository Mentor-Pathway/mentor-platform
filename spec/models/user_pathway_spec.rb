require 'rails_helper'

RSpec.describe UserPathway, type: :model do
  user_id { User.last.id }
end
