class PagesController < ApplicationController
  def index
    if current_user
      redirect_to(posts_url)
    end
  end

  def about
  end

  def tos
  end

  def cookies
  end

  def privacy
  end

  def accessibility
  end
end
