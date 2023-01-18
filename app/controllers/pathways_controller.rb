class PathwaysController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_pathway, only: %i[show edit update destroy]
  before_action :mentor?, only: %i[new create edit update destroy]

  def index
    @pathways = params[:query].present? ?
      Pathway.where("title ILIKE ?", "%#{params[:query]}%")
      : Pathway.all
  end

  def show
    @challenges = @pathway.challenges
  end

  def new
    @pathway = Pathway.new
  end

  def create
   @pathway = Pathway.new(pathway_params)
   @pathway.user = current_user
   if @pathway.save
      redirect_to pathways_path
      tag_pathway(@pathway)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def tag_pathway(pathway)
   tags = params[:pathway][:tag_ids]
   tags.drop(1).each do |tag|
      Tagging.create!(tag: Tag.find(tag.to_i), pathway: pathway) 
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

  def mentor?
    unless current_user.mentor?
      redirect_to root_path
    end
  end
end
