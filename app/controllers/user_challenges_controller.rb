class UserChallengesController < ApplicationController
  before_action :set_user, only: :create
  before_action :set_user_challenge, only: %i[edit update show]

  def show
    @user_challenge = current_user.user_challenges.find(params[:id])
    @notes = @user_challenge.notes.reverse
  end

  def new
    @user_challenge = UserChallenge.new
  end

  def show

  end

  def create
    @user_challenge = current_user.user_challenges.build(user_challenge_params)
    @user_challenge.user = @user
    @user_challenge.completed = false
    if @user_challenge.save
      # We should add where to redirect
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

  def user_challenge_params
    params.require(:user_challenge).permit(:challenge_id, :notes, :feedback, :rating)
  end

  def set_user
    @user = current_user
  end

  def set_user_challenge
    @user_challenge = current_user.user_challenges.find(params[:id])
  end
end
