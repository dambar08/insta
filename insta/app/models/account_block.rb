# frozen_string_literal: true

# == Schema Information
#
# Table name: account_blocks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blocked_id :bigint
#  blocker_id :bigint
#
# Indexes
#
#  index_account_blocks_on_blocker_id_and_blocked_id  (blocker_id,blocked_id) UNIQUE
#
class AccountBlock < ApplicationRecord
  belongs_to :blocker, class_name: "Account", inverse_of: :blocker_blocks
  belongs_to :blocked, class_name: "Account", inverse_of: :blocked_blocks

  validates :blocked_id, uniqueness: { scope: [:blocker_id] }
  validate :blocker_cannot_be_same_as_blocked

  counter_culture :blocker, column_name: "blocking_others_count"
  counter_culture :blocked, column_name: "blocked_by_count"

  BLOCKED_IDS_CACHE_KEY = "blocked_ids_for_blocker/"

  class << self
    def blocking?(blocker_id, blocked_id)
      exists?(blocker_id: blocker_id, blocked_id: blocked_id)
    end
  end

  private

  def blocker_cannot_be_same_as_blocked
    errors.add(:blocker_id, I18n.t("models.user_block.cant_be_the_same")) if blocker_id == blocked_id
  end
end
