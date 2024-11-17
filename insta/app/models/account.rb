# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Account < ApplicationRecord
  include Account::Avatar
  include Account::Counters

  USERNAME_RE   = /[a-z0-9_]+([.-]+[a-z0-9_]+)*/i
  MENTION_RE    = %r{(?<![=/[:word:]])@((#{USERNAME_RE})(?:@[[:word:]]+([.-]+[[:word:]]+)*)?)}
  URL_PREFIX_RE = %r{\Ahttp(s?)://[^/]+}
  USERNAME_ONLY_RE = /\A#{USERNAME_RE}\z/i
  USERNAME_LENGTH_LIMIT = 30
  DISPLAY_NAME_LENGTH_LIMIT = 30
  NOTE_LENGTH_LIMIT = 500



  validates :username, presence: true
  validates_with UniqueUsernameValidator, if: -> { will_save_change_to_username? }
  validates :display_name, length: { maximum: DISPLAY_NAME_LENGTH_LIMIT }, if: -> { will_save_change_to_display_name? }
  validates :note, note_length: { maximum: NOTE_LENGTH_LIMIT }, if: -> { will_save_change_to_note? }
  validates :fields, length: { maximum: DEFAULT_FIELDS_SIZE }, if: -> { will_save_change_to_fields? }

  scope :recent, -> { reorder(id: :desc) }
  scope :with_username, ->(value) { where arel_table[:username].lower.eq(value.to_s.downcase) }
end
