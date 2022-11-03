class PathChallengesController < ApplicationController
  before_action :set_challenge, only: :create
  before_action :set_path_challenge, only: %i[edit update destroy]

  def new
    @path_challenge = PathChallenge.new
  end

  def create
    @path_challenge = PathChallenge.new(path_challenge_params)
    @path_challenge.challenge = @challenge
    if @path_challenge.save
      # We should add where to redirect
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @path_challenge.update(path_challenge_params)
  end

  def destroy
    @path_challenge.destroy
    # We should add where to redirect
    status: :see_other
  end


  private

  def path_challenge_params
    params.require(:path_challenge).permit(:pathway_id, :order)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def set_path_challenge
    @path_challenge = PathChallenge.find(params[:id])
  end
end
