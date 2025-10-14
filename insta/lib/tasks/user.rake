# frozen_string_literal: true

namespace :users do
  desc("Populate the database with random followers")
  task populate_random_followers: :environment do
    Parallel.map((0..1000), in_threads: 4) do |user|
      MIN_FOLLOWING_COUNT = 0
      MAX_FOLLOWING_COUNT = 100
      follows = []
      user = User.all.sample
      following_count = rand(MIN_FOLLOWING_COUNT..MAX_FOLLOWING_COUNT)
      User.all.sample(following_count).pluck(:id).lazy.each do |id|
        follows << { follower_id: user.id, following_id: id }
      end
      Follow.insert_all(follows) if follows.any?
    end
  end
end
