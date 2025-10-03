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
class Issue < ApplicationRecord
  belongs_to :account, inverse_of: :issues, optional: true
  enum :status, {
    new_issue: 0,
    open: 1,
    in_progress: 2,
    blocked: 3,
    resolved: 4,
    closed: 5,
    reopened: 6,
  }

  validates :description, presence: true
end
