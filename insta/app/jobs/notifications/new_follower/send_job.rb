class Notifications::NewFollower::SendJob < ApplicationJob
  queue_as :medium_priority

  def perform(data)
    Notifications::NewFollower::Send.call(data)
  end
end
