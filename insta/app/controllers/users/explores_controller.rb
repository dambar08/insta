class Users::ExploresController < Users::ApplicationController
  def index
    @pagy, @posts = pagy(Post.all)
  end

  def trending
    @pagy, @posts = pagy(Post.all)
  end
end
