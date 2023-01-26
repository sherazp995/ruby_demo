class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ update destroy ]
  before_action :set_user, only: %i[ create ]
  before_action :set_comment, only: %i[ create ]

  # POST /replies or /replies.json
  def create
    @reply = @comment.replies.new(reply_params)

    respond_to do |format|
      if @reply.save
        format.html { redirect_to post_path(@comment.post), notice: "Reply was successfully created." }
      else
        format.html { redirect_to post_path(@comment.post), alert: "Error! Reply was successfully created." }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to post_path(@reply.comment.post), notice: "Reply was successfully updated." }
      else
        format.html { redirect_to post_path(@reply.comment.post), alert: "Error! Reply was successfully updated." }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @comment = @reply.comment
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@comment.post), alert: "Reply was successfully destroyed." }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def reply_params
    params.require(:reply).permit(:text, :user_id, :comment_id)
  end
end
