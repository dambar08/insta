# frozen_string_literal: true

module Notifications
  class << self
    def user_data(user)
      {
        id: user.id,
        class: { name: "User" },
        firstname: user.firstname,
        lastname: user.lastname,
        username: user.username,
        profile_image_90: user.profile_image_90,
        comments_count: user.comments_count,
        created_at: user.created_at,
      }
    end
  end
end
