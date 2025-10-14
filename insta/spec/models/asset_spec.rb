# == Schema Information
#
# Table name: assets
#
#  id            :bigint           not null, primary key
#  position      :integer
#  viewable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  viewable_id   :bigint
#
# Indexes
#
#  index_assets_on_viewable  (viewable_type,viewable_id)
#
require 'rails_helper'

RSpec.describe Asset, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
