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
FactoryBot.define do
  factory :asset do
  end
end
