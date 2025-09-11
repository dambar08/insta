# frozen_string_literal: true

class AccountPin < ApplicationRecord
  PINNABLE_TYPES = ["Account"].freeze
  belongs_to :pinnable, polymorphic: true
  belongs_to :account

  validates :pinnable_id, uniqueness: { scope: [:account_id] }
  validates :pinnable_type, inclusion: { in: PINNABLE_TYPES }
  validate :only_five_pins_per_account, on: :create
  validate :pinnable_belongs_to_account

  private

  def only_five_pins_per_account
    errors.add(:base, I18n.t("models.account_pin.only_five")) if account.account_pins.size > 4
  end

  def pinnable_belongs_to_account
    errors.add(:pinnable_id, I18n.t("models.account_pin.pin_unpermitted")) if pinnable.user_id != account_id
  end
end
