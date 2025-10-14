# == Schema Information
#
# Table name: verification_requests
#
#  id         :bigint           not null, primary key
#  metadata   :jsonb
#  note       :text
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  admin_id   :bigint
#
# Indexes
#
#  index_verification_requests_on_account_id  (account_id)
#  index_verification_requests_on_admin_id    (admin_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (admin_id => admins.id)
#
require 'rails_helper'

RSpec.describe VerificationRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
