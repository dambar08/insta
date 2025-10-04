# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action          :string
#  json_data       :jsonb
#  notifiable_type :string
#  notified_at     :datetime
#  read_at         :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :bigint
#  notifiable_id   :bigint
#
# Indexes
#
#  idx_on_account_id_notifiable_id_notifiable_type_89a5e23bd7      (account_id,notifiable_id,notifiable_type)
#  idx_on_account_id_notifiable_id_notifiable_type_act_868a1a32fb  (account_id,notifiable_id,notifiable_type,action)
#  idx_on_notifiable_id_notifiable_type_action_cd1255fd91          (notifiable_id,notifiable_type,action)
#  index_notifications_on_account_id                               (account_id)
#  index_notifications_on_created_at                               (created_at)
#  index_notifications_on_notified_at                              (notified_at)
#
require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:account) { create(:account) }
  let(:follow) { create(:follow) }

  describe "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:notifiable) }
    it { is_expected.to belong_to(:follow).optional }
    it { is_expected.to belong_to(:follow_request).optional }
    it { is_expected.to belong_to(:favourite).optional }
  end

  # describe "scopes" do
  #   let!(:read_notification) { create(:notification, account: account, read: true) }
  #   let!(:unread_notification) { create(:notification, account: account, read: false, read_at: nil) }

  #   it "returns read notifications" do
  #     expect(described_class.read).to include(read_notification)
  #     expect(described_class.read).not_to include(unread_notification)
  #   end

  #   it "returns unread notifications" do
  #     expect(described_class.unread).to include(unread_notification)
  #     expect(described_class.unread).not_to include(read_notification)
  #   end
  # end

  # describe "callbacks" do
  #   it "sets marked_at before create" do
  #     notification = described_class.create!(account: account, notifiable: follow)
  #     expect(notification.marked_at).not_to be_nil
  #   end
  # end
end
