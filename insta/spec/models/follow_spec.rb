# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id              :bigint           not null, primary key
#  blocked         :boolean          default(FALSE), not null
#  followable_type :string           not null
#  follower_type   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  followable_id   :bigint           not null
#  follower_id     :bigint           not null
#
# Indexes
#
#  fk_followables                            (followable_id,followable_type)
#  fk_follows                                (follower_type,follower_id)
#  index_follows_on_created_at               (created_at)
#  index_follows_on_followable_and_follower  (followable_id,followable_type,follower_id,follower_type) UNIQUE
#
require "rails_helper"

RSpec.describe(Follow, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
