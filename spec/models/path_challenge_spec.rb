require 'rails_helper'

RSpec.describe PathChallenge, type: :model do
  pathway_id { Pathway.last.id }
  challenge_id { Challenge.last.id }
end
