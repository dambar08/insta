# == Schema Information
#
# Table name: canonical_email_blocks
#
#  id                   :bigint           not null, primary key
#  canonical_email_hash :string           default(""), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  reference_account_id :bigint
#
# Indexes
#
#  index_canonical_email_blocks_on_canonical_email_hash  (canonical_email_hash) UNIQUE
#  index_canonical_email_blocks_on_reference_account_id  (reference_account_id)
#
require 'rails_helper'

RSpec.describe CanonicalEmailBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
