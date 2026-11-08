# frozen_string_literal: true

namespace :db do
  namespace :seed do
    desc "Load repeatable development data for the app feed"
    task demo_feed: :environment do
      load Rails.root.join("db/seeds/demo_feed.rb")
    end
  end
end
