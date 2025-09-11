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
FactoryBot.define do
  factory :account_block do
    
  end
end
