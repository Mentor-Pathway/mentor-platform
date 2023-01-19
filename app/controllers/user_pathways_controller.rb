class UserPathwaysController < ApplicationController
  before_action :verify_user, only: :show
  before_action :set_user
  before_action :set_pathway, only: :create
  before_action :set_user_pathway, only: %i[show destroy approved]

  def new
    @user_pathway = UserPathway.new
  end

  def show
  end

  def create
    @user_pathway = UserPathway.new(pathway: @pathway, user: @user)
    @user_pathway.completed = false
    if @user_pathway.save
      redirect_to signup_path(@user_pathway)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user_pathway = UserPathway.find(params[:id])
    @user_pathway.destroy
  end

  private

  def user_pathway_params
    params.require(:user_pathway).permit(:pathway_id)
  end

  def verify_user
    mentee = User.find(params[:profile_id])
    mentor = Pathway.find(UserPathway.find(params[:id]).id).user
    redirect_to root_path if current_user != mentor && current_user != mentee
  end

  def set_user
    @user = current_user
  end

  def set_pathway
    @pathway = Pathway.find(params[:pathway_id])
  end

  def set_user_pathway
    @user_pathway = UserPathway.find(params[:id])
  end
end
