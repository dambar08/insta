# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                    :bigint           not null, primary key
#  blocked_by_count      :bigint           default(0), not null
#  blocking_others_count :bigint           default(0), not null
#  firstname             :string
#  followers_count       :bigint           default(0)
#  followings_count      :bigint           default(0)
#  last_post_at          :datetime
#  lastname              :string
#  posts_count           :integer          default(0), not null
#  username              :string
#  verified              :boolean          default(FALSE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  user_id               :bigint
#
# Indexes
#
#  index_accounts_on_last_post_at_and_id  (last_post_at DESC,id) WHERE (last_post_at IS NOT NULL)
#  index_accounts_on_user_id              (user_id)
#  index_accounts_on_username             (username) UNIQUE
#  index_accounts_on_verified             (verified)
#
FactoryBot.define do
  factory :account do
    # firstname { "John" }
    # lastname  { "Doe" }
    # username { Faker::Internet.unique.username(specifier: 5..10) }
    # blocked_by_count { 0 }
    # blocking_others_count { 0 }
    # followers_count { 0 }
    # followings_count { 0 }

    # association :user
    firstname { Faker::Name.first_name }
    lastname  { Faker::Name.last_name }
    sequence(:username) { |n| "user#{n}" } # unique usernames
    blocked_by_count { 0 }
    blocking_others_count { 0 }
    followers_count { 0 }
    followings_count { 0 }

    user factory: [:user]
  end
end
