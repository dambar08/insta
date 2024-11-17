# frozen_string_literal: true

namespace :db do
  desc "Reset counter cache of followers and followings count in user."
  task update_follows: :environment do
    print "Starting: Reset counter cache of followers and followings count in user."
    User.pluck(:id).lazy.each do |id|
      User.reset_counters(id, :followers)
    end
    print "Ending: Reset counter cache of followers and followings count in user."
  end

  desc "Reset counter cache of followers count in user."
  task update_followers: :environment do
    User.pluck(:id).lazy.each do |id|
      User.reset_counters(id, :followers)
    end
  end

  desc "Reset counter cache of followings count in user."
  task update_followings: :environment do
    User.pluck(:id).lazy.each do |id|
      User.reset_counters(id, :followings)
    end
  end
end
