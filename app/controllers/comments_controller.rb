class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ update destroy ]
  before_action :set_user, only: %i[ create ]
  before_action :set_post, only: %i[ create ]

  # POST /comments or /comments.json
  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: "Comment was successfully created." }
      else
        format.html { redirect_to post_url(@post), alert: "Error! Comment was not created." }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @post = @comment.post
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: "Comment was successfully updated." }
      else
        format.html { redirect_to post_url(@post), alert: "Error! Comment was not updated." }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @post = @comment.post
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post), alert: "Comment was successfully destroyed." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
