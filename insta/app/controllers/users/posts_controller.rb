class Users::PostsController < Users::ApplicationController
  def index
    @pagy, @reels = pagy(Post.includes(:account).order(created_at: :desc), items: 5)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def create
  end

  def update
  end

  def destroy
  end
end
