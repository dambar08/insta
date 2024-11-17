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
FactoryBot.define do
  factory :comment do
    
  end
end
