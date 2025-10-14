class Users::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /users/comments or /users/comments.json
  def index
    @comments = Comment.all
  end

  # GET /users/comments/1 or /users/comments/1.json
  def show
  end

  # GET /users/comments/new
  def new
    @comment = Comment.new
  end

  # GET /users/comments/1/edit
  def edit
  end

  # POST /users/comments or /users/comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [:users, @comment], notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/comments/1 or /users/comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [:users, @comment], notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/comments/1 or /users/comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to users_comments_path, status: :see_other, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.fetch(:comment, {})
  end
end
