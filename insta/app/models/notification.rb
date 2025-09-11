# frozen_string_literal: true

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
class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
  belongs_to :user

  scope :read, -> { where.not(read: false) }
  scope :unread, -> { where(read_at: nil) }

  with_options foreign_key: "notifiable_id", optional: true do
    belongs_to :follow, inverse_of: :notification
    belongs_to :follow_request, inverse_of: :notification
    belongs_to :favourite, inverse_of: :notification
  end

  before_create :mark_notified_at_time

  private

  def mark_notified_at_time
    self.mark_notified_at_time = mark_notified_at_time || Time.current
  end
end
