# == Schema Information
#
# Table name: account_stats
#
#  id              :bigint           not null, primary key
#  followers_count :bigint           default(0), not null
#  following_count :bigint           default(0), not null
#  last_post_at    :datetime
#  posts_count     :bigint           default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :bigint           not null
#
# Indexes
#
#  index_account_stats_on_account_id                   (account_id)
#  index_account_stats_on_last_post_at_and_account_id  (last_post_at DESC,account_id) WHERE (last_post_at IS NOT NULL)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class AccountStat < ApplicationRecord
  self.locking_column = nil
  self.ignored_columns += %w(lock_version)
  belongs_to :account, inverse_of: :account

  scope :by_recent_post, -> { order(arel_table[:last_post_at].desc.nulls_last) }
  scope :without_recent_activity, -> { where(last_post_at: [nil, ...1.month.ago]) }

  update_index('accounts', :account)

  def following_count
    [attributes['following_count'], 0].max
  end

  def followers_count
    [attributes['followers_count'], 0].max
  end

  def statuses_count
    [attributes['statuses_count'], 0].max
  end
end
