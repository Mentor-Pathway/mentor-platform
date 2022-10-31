class UserPathwaysController < ApplicationController
  before_action :set_user

  def new
    @user_pathway = UserPathway.new
  end

  def create
    @user_pathway.new(user_pathway_params)
    @user_pathway.user = @user
    @user_pathway.completed = false
    if @user_pathway.save
      #We should add where we will redirect user to after they create UserPathway instance.
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_pathway = UserPathway.find(params[:id])
    @user_pathway.destroy
    #We should add where we will redirect user to after they delete UserPathway instance.
    status: :see_other
  end

  private

  def user_pathway_params
    params.require(:user_pathway).permit(:pathway_id)
  end

  def set_user
    @user = current_user
  end
end