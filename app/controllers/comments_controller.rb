class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_user_challenge, only: %i[new create edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.user_challenge = @user_challenge
    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_challenge_path(@user_challenge) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_challenge_path(@comment.user_challenge)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to user_challenge_path(@comment.user_challenge), status: :see_other }
      format.turbo_stream
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end

  def set_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end

  def set_user_challenge
    @user_challenge = UserChallenge.find_by(id: params[:user_challenge_id])
  end
end
