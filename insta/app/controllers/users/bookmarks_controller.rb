class Users::BookmarksController < Users::ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /users/bookmarks or /users/bookmarks.json
  def index
    @pagy, @bookmarks = pagy(current_account.bookmarks)
  end

  # GET /users/bookmarks/1 or /users/bookmarks/1.json
  def show
  end

  # GET /users/bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /users/bookmarks/1/edit
  def edit
  end

  # POST /users/bookmarks or /users/bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to [:users, @bookmark], notice: "Bookmark was successfully created." }
        format.json { render :show, status: :created, location: @bookmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/bookmarks/1 or /users/bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to [:users, @bookmark], notice: "Bookmark was successfully updated." }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/bookmarks/1 or /users/bookmarks/1.json
  def destroy
    @bookmark.destroy!

    respond_to do |format|
      format.html { redirect_to users_bookmarks_path, status: :see_other, notice: "Bookmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.fetch(:bookmark, {})
  end
end
