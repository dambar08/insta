# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  caption    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :post do
    
  end
end
