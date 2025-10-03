# == Schema Information
#
# Table name: issues
#
#  id          :bigint           not null, primary key
#  description :text
#  status      :integer          default("new"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint
#
# Indexes
#
#  index_issues_on_account_id  (account_id)
#  index_issues_on_status      (status)
#
FactoryBot.define do
  factory :issue do
    # description { "This is a valid issue" }
    # status { "new_issue" }
    # association :account
    description { Faker::Lorem.sentence }
    status { "new_issue" }
  end
end
