# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  deleted_at             :datetime
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    # sequence(:email) { |n| "user#{n}@example.com" }
    # email { Faker::Internet.unique.email }
    # password { "password123" }
    # password_confirmation { "password123" }

    # confirmed_at { Time.current }
    # sign_in_count { 0 }
    # current_sign_in_at { nil }
    # current_sign_in_ip { nil }
    # last_sign_in_at { nil }
    # last_sign_in_ip { nil }
    # failed_attempts { 0 }
    # locked_at { nil }
    # deleted_at { nil }
    # dob { 20.years.ago.to_date }
    #
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }

    confirmed_at { Time.current }
    sign_in_count { 0 }
    dob { 20.years.ago.to_date }
  end
end
