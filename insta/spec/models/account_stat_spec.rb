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
require 'rails_helper'

RSpec.describe AccountStat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
