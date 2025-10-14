# == Schema Information
#
# Table name: versions
#
#  id         :uuid             not null, primary key
#  event      :string           not null
#  item_type  :string           not null
#  object     :text
#  whodunnit  :string
#  created_at :datetime
#  item_id    :string           not null
#
# Indexes
#
#  index_versions_on_item_type_and_item_id  (item_type,item_id)
#
require 'rails_helper'

RSpec.describe Version, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
