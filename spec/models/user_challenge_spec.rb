require 'rails_helper'

RSpec.describe UserChallenge, type: :model do
  challenge_id { Challenge.last.id }
  user_id { User.last.id }
end
