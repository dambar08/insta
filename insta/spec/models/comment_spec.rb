# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body_plain       :text
#  caption          :text
#  commentable_type :string
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#  index_comments_on_deleted_at                           (deleted_at)
#
require "rails_helper"

RSpec.describe(Comment, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
