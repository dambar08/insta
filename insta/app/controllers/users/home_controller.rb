class Users::HomeController < Users::ApplicationController
  def show
    @pagy, @posts = pagy(Post.includes(:account).order(created_at: :desc), items: 5)
  end
end
