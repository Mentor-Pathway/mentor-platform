class ChallengesController < ApplicationController
  before_action :set_user, only: %i[new create edit]
  before_action :set_challenge, only: %i[show edit update destroy]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    Challenge.new
  end

  def create
    @challenge = Challenge.create(challenge_params)
    @challenge.user = set_user
    if @challenge.save
      redirect_to challenge_path(@user, @challenge) #path can be modified after routes built
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @challenge.update(challenge_params)
  end

  def destroy
    @challenge.destroy
    redirect_to challenges_path(@user), status: :see_other #path can be modified after routes built
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :details)
  end

  def set_user
    @user = current_user
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end
