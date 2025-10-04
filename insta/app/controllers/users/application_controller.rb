class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_account

  def current_account
    current_user&.account
  end
end
