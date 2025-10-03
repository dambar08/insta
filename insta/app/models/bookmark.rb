# == Schema Information
#
# Table name: bookmarks
#
#  id                :bigint           not null, primary key
#  accountable_type  :string           not null
#  bookmarkable_type :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  accountable_id    :bigint           not null
#  bookmarkable_id   :bigint           not null
#
# Indexes
#
#  idx_on_accountable_id_accountable_type_bookmarkable_b1439e43fb  (accountable_id,accountable_type,bookmarkable_id,bookmarkable_type) UNIQUE
#  index_bookmarks_on_accountable                                  (accountable_type,accountable_id)
#  index_bookmarks_on_accountable_id_and_accountable_type          (accountable_id,accountable_type)
#  index_bookmarks_on_bookmarkable                                 (bookmarkable_type,bookmarkable_id)
#  index_bookmarks_on_bookmarkable_id_and_bookmarkable_type        (bookmarkable_id,bookmarkable_type)
#  index_bookmarks_on_created_at                                   (created_at)
#
class Bookmark < ApplicationRecord
  belongs_to :bookmarkable, polymorphic: true
  belongs_to :accountable, polymorphic: true

  validates :accountable_type, inclusion: { in: ['Account'] }
  validates :bookmarkable_id, uniqueness: { scope: [:accountable_id, :accountable_type, :bookmarkable_type] }
  validates :bookmarkable_type, inclusion: { in: ['Post'] }
  validate :pinnable_belongs_to_profile

  private

  def pinnable_belongs_to_profile
    errors.add(:bookmarkable_id, I18n.t("models.bookmark.mark_unpermitted")) if bookmarkable.user_id != account_id
  end
end
