class PathChallengesController < ApplicationController
  before_action :set_pathway, only: %i[new create edit]
  before_action :set_challenge_ids, only: %i[check_uniqueness create]
  before_action :set_path_challenge, only: %i[edit update destroy]

  def new
    @path_challenge = PathChallenge.new
  end

  def check_uniqueness
    @challenge_ids.any? { |id| PathChallenge.find_by(pathway: @pathway, challenge_id: id) }
  end

  def create
    @path_challenge = PathChallenge.new
    @path_challenges = @pathway.challenges
    if check_uniqueness
      render :new, status: :unprocessable_entity
    else
      @challenge_ids = params.dig(:path_challenge, :challenge_id).reject(&:empty?)
      @challenge_ids.each do |id|
        @path_challenge.pathway = @pathway
        @path_challenge.challenge.id = id
        @path_challenge.order = @path_challenges.empty? ? 1 : @path_challenges.count + 1
        @path_challenge.save
        redirect_to pathway_path(@pathway)
      end
    end
  end

  def edit
  end

  def update
    @path_challenge.update(path_challenge_params)
    redirect_to pathway_path(@pathway)
  end

  def destroy
    @path_challenge.destroy
    # We should add where to redirect
    # status: :see_other
  end

  private

  def path_challenge_params
    params.require(:path_challenge).permit(ids: [])
  end

  def set_pathway
    @pathway = Pathway.find(params[:pathway_id])
  end

  def set_challenge_ids
    @challenge_ids = params.dig(:path_challenge, :challenge_id).reject(&:empty?)
  end

  def set_path_challenge
    @path_challenge = PathChallenge.find(params[:id])
  end
end
