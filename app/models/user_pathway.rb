class UserPathway < ApplicationRecord
  belongs_to :user
  belongs_to :pathway
  has_many :user_challenges, dependent: :destroy
  
  after_create :creat_user_challenges

  private
  
  def creat_user_challenges
    self.pathway.challenges.each do |challenge|
      UserChallenge.create!(
        user_pathway: self,
        challenge: challenge
      )
    end
  end
end 
