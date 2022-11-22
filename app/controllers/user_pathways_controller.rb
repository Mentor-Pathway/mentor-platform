class UserPathwaysController < ApplicationController
  before_action :set_user
  before_action :set_user_pathway, only: %i[destroy approved]

  before_action :set_pathway, only: :create

  def new
    @user_pathway = UserPathway.new
  end

  def create
    @user_pathway = UserPathway.new(pathway: @pathway, user:@user)
    @user_pathway.completed = false
    if @user_pathway.save
      redirect_to signup_path(@user_pathway)
       # We should add where we will redirect user to after they create UserPathway instance. 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_pathway = UserPathway.find(params[:id])
    @user_pathway.destroy
    # We should add where we will redirect user to after they delete UserPathway instance.
    # status: :see_other
  end

  def approved
    @user_pathway.update(approved: true)
    redirect_to # We should add a route
  end

  private

  def user_pathway_params
    params.require(:user_pathway).permit(:pathway_id)
  end

  def set_user
    @user = current_user
  end

  def set_user_pathway
    @user_pathway = UserPathway.find(params[:id])
  end
end
