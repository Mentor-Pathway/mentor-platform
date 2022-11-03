class PathwaysController < ApplicationController
  before_action :set_pathway, only: %i[show edit update destroy]

  def index
    @pathways = Pathway.all
  end

  def show
    @challenges = @pathway.challenges
  end

  def new
    @pathway = Pathway.new
  end

  def create
    @pathway = Pathway.new(pathway_params)
    if @pathway.save
      redirect_to pathways_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @pathway.update(pathway_params)
    redirect_to pathway_path(@pathway)
  end

  def destroy
    @pathway.destroy
    redirect_to pathways_path
  end

  private

  def pathway_params
    params.require(:pathway).permit(:title, :details, :difficulty)
  end

  def set_pathway
    @pathway = Pathway.find(params[:id])
  end
end
