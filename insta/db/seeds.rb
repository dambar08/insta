# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = []
100.times do
  username = Faker::Name.unique.name.split(" ").join("_").downcase
  email = "#{username}@fake.com"
  confirmed_at = Time.zone.now
  users << { account: { username: username }, email: email, password: username, password_confirmation: username, confirmed_at: confirmed_at }
end

Parallel.map(users, in_threads: 8) do |user|
  account = user[:account]
  rest = user.reject { |k, _| k == :account }
  user = User.create!(rest)
  user.account.create(account)
end

users = []
100.times do
  username = Faker::Name.unique.name.split(" ").join("_").downcase
  email = "#{username}@fake.com"
  confirmed_at = Time.zone.now
  users << { account_attributes: { username: username }, email: email, password: username, password_confirmation: username, confirmed_at: confirmed_at }
end

Parallel.map(users, in_threads: 8) do |user|
  User.create!(user)
end

Parallel.map((0..1000), in_threads: 4) do |user|
  MIN_FOLLOWING_COUNT = 0
  MAX_FOLLOWING_COUNT = 100
  follows = []
  user = User.all.sample
  following_count = rand(MIN_FOLLOWING_COUNT..MAX_FOLLOWING_COUNT)
  User.all.sample(following_count).pluck(:id).lazy.each do |id|
    follows << { follower_id: user.id, following_id: id }
  end
  Follow.insert_all(follows) if follows.size.positive?
end

1000.times do
  MIN_FOLLOWING_COUNT = 0
  MAX_FOLLOWING_COUNT = 100
  follows = []
  user = User.all.sample
  following_count = rand(MIN_FOLLOWING_COUNT..MAX_FOLLOWING_COUNT)
  User.all.sample(following_count).pluck(:id).lazy.each do |id|
    follows << { follower_id: user.id, following_id: id }
  end
  Follow.insert_all(follows) if follows.size.positive?
end
