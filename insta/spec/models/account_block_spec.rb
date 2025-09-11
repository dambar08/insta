# == Schema Information
#
# Table name: account_blocks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blocked_id :bigint
#  blocker_id :bigint
#
# Indexes
#
#  index_account_blocks_on_blocker_id_and_blocked_id  (blocker_id,blocked_id) UNIQUE
#
require 'rails_helper'

RSpec.describe AccountBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
