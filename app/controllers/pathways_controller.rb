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
      add_tags_on_pathway_create(@pathway)
      redirect_to pathways_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
   @pathway.update(pathway_params)
   edit_pathway_tags(@pathway)
   redirect_to pathway_path(@pathway)
  end

  def destroy
    @pathway.destroy
    redirect_to pathways_path
  end

  private
  
  def add_tags_on_pathway_create(pathway)
   tags = params[:pathway][:tag_ids]
   tags.drop(1).each do |tag|
      Tagging.create!(tag: Tag.find(tag.to_i), pathway: pathway) 
   end
  end

  def edit_pathway_tags(pathway)
   tag_ids = params[:pathway][:tag_ids]
   tags = []
   tag_ids.drop(1).each do |tag|
      tags << Tag.find(tag.to_i)
   end
   add_tags_on_pathway_edit(tags, pathway)
   delete_tags_on_pathway_edit(tags, pathway)
  end

  def add_tags_on_pathway_edit(tags, pathway)
   tag_to_add = tags - pathway.tags
   tag_to_add.each {|tag| Tagging.create!(tag: tag, pathway: pathway)}
  end

  def delete_tags_on_pathway_edit(tags, pathway)
   tag_to_delete = pathway.tags - tags
   tag_to_delete.each do|tag| 
      Tagging.find_by(tag: tag, pathway: pathway).destroy!
   end  
  end

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
