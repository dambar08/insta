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
class Comment < ApplicationRecord
  include PgSearch::Model
  acts_as_paranoid

  COMMENTABLE_TYPES = %w[Post].freeze
  belongs_to :commentable

  validates :commentable_id, presence: true, if: :commentable_type
  validates :commentable_type, inclusion: { in: COMMENTABLE_TYPES }, if: :commentable_id
end
