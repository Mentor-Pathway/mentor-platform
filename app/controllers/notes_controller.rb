class NotesController < ApplicationController
  before_action :set_note, only: %i[edit update destroy]

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def note_params
    params.require(:notes).permit(:note)
  end

  def set_note
    @note = Note.find(params[:id])
  end
end
