# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  caption    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
