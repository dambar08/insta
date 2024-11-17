# == Schema Information
#
# Table name: resources
#
#  id            :bigint           not null, primary key
#  deleted_at    :datetime
#  original_url  :string
#  temporary_url :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
FactoryBot.define do
  factory :resource do
    
  end
end
