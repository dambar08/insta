# frozen_string_literal: true

# == Schema Information
#
# Table name: account_pins
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AccountPin < ApplicationRecord
  PINNABLE_TYPES = ["Account"].freeze
  belongs_to :pinnable, polymorphic: true
  belongs_to :account

  validates :pinnable_id, uniqueness: { scope: [:account_id] }
  validates :pinnable_type, inclusion: { in: PINNABLE_TYPES }
  validate :pinnable_belongs_to_account

  private

  def only_five_pins_per_account
    errors.add(:base, I18n.t("models.account_pin.only_five")) if account.account_pins.size > 4
  end

  def pinnable_belongs_to_account
    errors.add(:pinnable_id, I18n.t("models.account_pin.pin_unpermitted")) if pinnable.user_id != account_id
  end
end
