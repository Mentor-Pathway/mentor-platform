class ProfilesController < ApplicationController
  before_action :verify_user, only: :show
  before_action :set_user, except: :show
  before_action :set_profile, only: %i[show edit update authenticate_profile_owner]
  before_action :authenticate_profile_owner, only: %i[edit update]

  def show
    @pathways = UserPathway.where(user: current_user)
  end

  def new
    @profile = Profile.new
  end

  def create
    # This should be modified if params will return more than one inputs.
    @profile = Profile.new(profile_params)
    @profile.user = @user
    if @profile.save
      redirect_to profile_path(@profile) # We can modify this after we decide where we'll redirect a user to after creating profile.
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    # This should be modified if params will return more than one inputs.
    params.require(:profile).permit(:job, :bio, :linkedin, :github)
  end

  def verify_user
    mentee = current_user != User.find(params[:id])
    mentor = current_user.role != "mentor"
    redirect_to root_path if mentee && mentor
  end

  def set_user
    @user = current_user
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def authenticate_profile_owner
    unless current_user == @profile.user
      head(:unauthorized)
    end
  end
end
