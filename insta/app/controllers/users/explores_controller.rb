class Users::ExploresController < Users::ApplicationController
  def show
    @pagy, @posts = pagy(Post.includes(assets: { attachment_attachment: :blob }).order(created_at: :desc).all)
  end

  def trending
    @pagy, @posts = pagy(Post.all)
  end
end
