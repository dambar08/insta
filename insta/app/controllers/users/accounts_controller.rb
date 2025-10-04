class Users::AccountsController < Users::ApplicationController
  def show
    @follower_count = current_account.followers_count
    @follow_count = current_account.follow_count
  end

  def blocked_accounts
  end

  def close_friends
  end

  def bookmarks
    @pagy, @bookmarks = pagy(current_account.bookmarks)
  end
end
