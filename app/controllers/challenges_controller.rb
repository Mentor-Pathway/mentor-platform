class ChallengesController < ApplicationController
  before_action :set_user, only: %i[new create edit]
  before_action :set_pathway, except: :destroy
  before_action :set_challenge, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user = @user
    if @challenge.save
      add_tags_on_challenge_create(@challenge)
      @challenges = @pathway.challenges
      @path_challenge = PathChallenge.new(pathway: @pathway, challenge: @challenge)
      @path_challenge.order = @challenges.empty? ? 1 : @challenges.count + 1
      redirect_to pathway_challenge_path(@pathway, @challenge) # path can be modified after routes built
    else
      render :new, status: :unprocessable_entity
    end
  end

  def add_tags_on_challenge_create(challenge)
   tags = params[:challenge][:tag_ids]
   tags.drop(1).each do |tag|
      Tagging.create!(tag: Tag.find(tag.to_i), challenge: challenge) 
   end
  end

  def edit
  end

  def update
    @challenge.update(challenge_params)
    edit_challenge_tags(@challenge)
    redirect_to pathway_challenge_path(@pathway, @challenge)
  end

  def edit_challenge_tags(challenge)
   tag_ids = params[:challenge][:tag_ids]
   tags = []
   tag_ids.drop(1).each do |tag|
      tags << Tag.find(tag.to_i)
   end
   add_tags_on_challenge_edit(tags, challenge)
   delete_tags_on_challenge_edit(tags, challenge)
  end
  
  def add_tags_on_challenge_edit(tags, challenge)
   tag_to_add = tags - challenge.tags
   tag_to_add.each {|tag| Tagging.create!(tag: tag, challenge: challenge)}
  end

  def delete_tags_on_challenge_edit(tags, challenge)
   tag_to_delete = challenge.tags - tags
   tag_to_delete.each do|tag| 
      Tagging.find_by(tag: tag, challenge: challenge).destroy!
   end  
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
