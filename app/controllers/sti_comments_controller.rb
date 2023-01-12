class StiCommentsController < ApplicationController
  before_action :set_sti_comment, only: %i[ show edit update destroy ]

  # GET /sti_comments or /sti_comments.json
  def index
    @sti_comments = StiComment.all
  end

  # GET /sti_comments/1 or /sti_comments/1.json
  def show
  end

  # GET /sti_comments/new
  def new
    @sti_comment = StiComment.new
  end

  # GET /sti_comments/1/edit
  def edit
  end

  # POST /sti_comments or /sti_comments.json
  def create
    @sti_comment = StiComment.new(sti_comment_params)

    respond_to do |format|
      if @sti_comment.save
        format.html { redirect_to sti_comment_url(@sti_comment), notice: "Sti comment was successfully created." }
        format.json { render :show, status: :created, location: @sti_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sti_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sti_comments/1 or /sti_comments/1.json
  def update
    respond_to do |format|
      if @sti_comment.update(sti_comment_params)
        format.html { redirect_to sti_comment_url(@sti_comment), notice: "Sti comment was successfully updated." }
        format.json { render :show, status: :ok, location: @sti_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sti_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sti_comments/1 or /sti_comments/1.json
  def destroy
    @sti_comment.destroy

    respond_to do |format|
      format.html { redirect_to sti_comments_url, notice: "Sti comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sti_comment
      @sti_comment = StiComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sti_comment_params
      params.require(:sti_comment).permit(:text, :user_id, :post_id, :type)
    end
end
