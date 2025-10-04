# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  allow_comment :boolean          default(TRUE), not null
#  caption       :string           default(""), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "rails_helper"

RSpec.describe(Post, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
