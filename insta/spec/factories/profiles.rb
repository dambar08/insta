# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  gender     :string
#  locale     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :profile do
    
  end
end
