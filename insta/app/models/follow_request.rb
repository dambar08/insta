# == Schema Information
#
# Table name: follow_requests
#
#  id                :bigint           not null, primary key
#  notify            :boolean          default(FALSE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  account_id        :bigint
#  target_account_id :bigint
#
# Indexes
#
#  index_follow_requests_on_account_id                        (account_id)
#  index_follow_requests_on_account_id_and_target_account_id  (account_id,target_account_id) UNIQUE
#  index_follow_requests_on_target_account_id                 (target_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (target_account_id => accounts.id)
#
class FollowRequest < ApplicationRecord
  LIMIT = ENV.fetch('MAX_FOLLOWS_THRESHOLD', 7_500).to_i
  RATIO = ENV.fetch('MAX_FOLLOWS_RATIO', 1.1).to_f

  belongs_to :account
  belongs_to :target_account, class_name: 'Account'
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :account_id, uniqueness: { scope: :target_account_id }

  vaidates_with FollowLimitValidator, on: :create, unless: :bypass_follow_limit
  attribute :bypass_follow_limit, :boolean, default: false

  def validate(follow)
    return if follow.account.nil? || !follow.account.local?

    follow.errors.add(:base, I18n.t('users.follow_limit_reached', limit: self.class.limit_for_account(follow.account))) if limit_reached?(follow.account)
  end

  class << self
    def limit_for_account(account)
      if account.following_count < LIMIT
        LIMIT
      else
        [(account.followers_count * RATIO).round, LIMIT].max
      end
    end
  end

  private

  def limit_reached?(account)
    account.following_count >= self.class.limit_for_account(account)
  end
end
