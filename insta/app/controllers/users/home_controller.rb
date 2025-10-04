class Users::HomeController < Users::ApplicationController
  def show
    @pagy, @reels = pagy(Post.includes(:account).order(created_at: :desc), items: 5)

    respond_to do |format|
      format.html # normal HTML load
      format.turbo_stream # for infinite scroll
    end
  end
end
