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
require "rails_helper"

RSpec.describe(Account, type: :model) do
  describe "associations" do
    it { is_expected.to(belong_to(:user)) }
    it { is_expected.to(have_many(:blocked_blocks)) }
    it { is_expected.to(have_many(:blocker_blocks)) }
    it { is_expected.to(have_many(:account_pins)) }}
  end

  describe "scopes" do

  end
end
