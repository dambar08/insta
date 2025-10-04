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
class Post < ApplicationRecord
  belongs_to :account, inverse_of: :post
  has_many :assets, as: :viewable, dependent: :destroy
  has_many :comments, as: :commentable, inverse_of: :commentable, dependent: :nullify

  def allow_comments?
    !!allow_comment
  end
end
