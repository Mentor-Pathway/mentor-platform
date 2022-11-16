class ProfilesController < ApplicationController
  before_action :set_user, except: :show
  before_action :set_profile, only: %i[show edit update]

  def show
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
    @profile.update(profile_params)
  end

  private

  def profile_params
    # This should be modified if params will return more than one inputs.
    params.require(:profile).permit(:job)
  end

  def set_user
    @user = current_user
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
