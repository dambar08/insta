# == Schema Information
#
# Table name: issues
#
#  id          :bigint           not null, primary key
#  description :text
#  status      :integer          default("new_issue"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint
#
# Indexes
#
#  index_issues_on_account_id  (account_id)
#  index_issues_on_status      (status)
#
require 'rails_helper'

RSpec.describe Issue, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:account).optional }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe "enum status" do
    it "has the correct statuses" do
      expect(described_class.statuses.keys).to contain_exactly(
        "new_issue", "open", "in_progress", "blocked", "resolved", "closed", "reopened"
      )
    end
  end

  describe "status transitions" do
    let(:issue) { create(:issue) }

    it "defaults to new" do
      expect(issue.status).to eq("new_issue")
    end

    it "can transition to in_progress" do
      issue.in_progress!
      expect(issue.status).to eq("in_progress")
    end

    it "can transition to resolved" do
      issue.resolved!
      expect(issue.status).to eq("resolved")
    end

    it "can transition to closed" do
      issue.closed!
      expect(issue.status).to eq("closed")
    end
  end
end
