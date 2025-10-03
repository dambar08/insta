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
FactoryBot.define do
  factory :follow_request do
    
  end
end
