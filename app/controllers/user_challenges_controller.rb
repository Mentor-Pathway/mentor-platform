class UserChallengesController < ApplicationController
  before_action :verify_user, only: :show
  before_action :set_user, only: :create
  before_action :set_user_challenge, only: %i[edit update show verify_user]

  def show
    # byebug
    @notes = @user_challenge.notes.reverse
    @comments = @user_challenge.comments.reverse
  end

  def new
    @user_challenge = UserChallenge.new
  end

  def create
    @user_challenge = current_user.user_challenges.build(user_challenge_params)
    @user_challenge.user = @user
    @user_challenge.completed = false
    if @user_challenge.save
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @user_challenge.update(user_challenge_params)
  end

  private

  def verify_user
    mentee = User.find(params[:profile_id])
    mentor = Pathway.find(UserPathway.find(params[:user_pathway_id]).id).user
    redirect_to root_path if current_user != mentor && current_user != mentee
  end

  def user_challenge_params
    params.require(:user_challenge).permit(:challenge_id, :notes, :comments, :feedback, :rating)
  end

  def set_user
    @user = current_user
  end

  def set_user_challenge
    @user_challenge = UserChallenge.find(params[:id])
  end
end
