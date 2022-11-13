class ChallengesController < ApplicationController
  before_action :set_user, only: %i[new create edit]
  before_action :set_pathway, except: :destroy
  before_action :set_challenge, only: %i[show edit update destroy]

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = @user
    if @challenge.save
      @challenges = @pathway.challenges
      @path_challenge = PathChallenge.new(pathway: @pathway, challenge: @challenge)
      @path_challenge.order = @challenges.empty? ? 1 : @challenges.count + 1
      redirect_to pathway_challenge_path(@pathway, @challenge) # path can be modified after routes built
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @challenge.update(challenge_params)
    redirect_to pathway_challenge_path(@pathway, @challenge)
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_path(@user), status: :see_other # path can be modified after routes built
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :details, :notes, :feedback, :rating)
  end

  def set_user
    @user = current_user
  end

  def set_pathway
    @pathway = Pathway.find(params[:pathway_id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
