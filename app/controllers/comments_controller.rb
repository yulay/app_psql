class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]

  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)
    # la linea de arriba tambien se puede hacer de la siguiente manera
    # @comment.user_id = current_user.id

      respond_to do |format|
        if @comment.save
          format.html { redirect_to article_path(@comment.article_id), notice: "Comment was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to article_path(@comment.article_id), notice: "Comment was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text, :article_id)
    end
end