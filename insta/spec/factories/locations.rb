# == Schema Information
#
# Table name: locations
#
#  id               :bigint           not null, primary key
#  city             :string
#  country          :string
#  latitude         :decimal(9, 6)
#  locatorable_type :bigint
#  longitude        :decimal(9, 6)
#  name             :string
#  state            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  locatorable_id   :bigint
#
# Indexes
#
#  index_locations_on_locatorable_id_and_locatorable_type  (locatorable_id,locatorable_type)
#
FactoryBot.define do
  factory :location do
    
  end
end
