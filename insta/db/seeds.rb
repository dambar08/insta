# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "u@mail.com", password: "password", confirmed_at: Time.current)
users = []
100.times do
  username = Faker::Name.unique.name.split(" ").join("_").downcase
  email = "#{username}@fake.com"
  confirmed_at = Time.zone.now
  users << { account: { username: username }, email: email, password: username, password_confirmation: username, confirmed_at: confirmed_at }
end

Parallel.map(users, in_threads: 8) do |user|
  user[:account]
  rest = user.reject { |k, _| k == :account }
  User.create!(rest)
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

Parallel.map((0..1000), in_threads: 8) do |_user|
  User.create!(email: Faker::Internet.unique.email, password: "password", confirmed_at: Time.current)
end

Parallel.map((0..1000), in_threads: 4) do |_|
  MIN_FOLLOWING_COUNT = 0
  MAX_FOLLOWING_COUNT = 100
  follows = []
  following_count = rand(MIN_FOLLOWING_COUNT..MAX_FOLLOWING_COUNT)
  Account.all.sample(following_count).pluck(:id).lazy.each do |id|
    follows << { follower_id: Account.all.sample.id, follower_type: "Account", followable_id: id, followable_type: "Account" }
  end
  Follow.insert_all(follows) if follows.any?
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
  Follow.insert_all(follows) if follows.any?

f = Down.download("http://picsum.photos/1000/1000")
u = User.first
post = u.account.posts.build
asset = post.assets.build
asset.attachment.attach(io: f, filename: "#{SecureRandom.hex(120)}-#{f.path.split("/")[-1]}")
asset.save!
f.close!

Follow.counter_culture_fix_counts verbose: true
