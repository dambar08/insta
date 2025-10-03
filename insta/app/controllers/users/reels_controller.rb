class Users::ReelsController < Users::ApplicationController
  def index
    post = Post.all.sample
    if post.present?
      redirect_to users_reel_path(post)
    end
  end

  def show
  end
end
