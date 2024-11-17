# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  caption    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
  has_many :comments, as: :commentable, inverse_of: :commentable, dependent: :nullify
end
