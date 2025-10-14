# == Schema Information
#
# Table name: verification_requests
#
#  id         :bigint           not null, primary key
#  metadata   :jsonb
#  note       :text
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  admin_id   :bigint
#
# Indexes
#
#  index_verification_requests_on_account_id  (account_id)
#  index_verification_requests_on_admin_id    (admin_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (admin_id => admins.id)
#
class VerificationRequest < ApplicationRecord
  belongs_to :account
  has_one_attached :document

  belongs_to :verifier, class_name: "Admin", optional: true
  enum :status, { pending: "pending", auto_rejected: "auto_rejected", auto_approved: "auto_approved", under_review: "under_review", approved: "approved", denied: "denied" }

  validates :account_id, uniqueness: { scope: :status, conditions: -> { where(status: ['pending', 'under_review']) }, message: "already has an open verification request" }, on: :create
  validates :verified, presence: true, if: -> { status.in?(['approved', 'denied', 'under_review']) }

  delegate :user, to: :account

  state_machine :status, initial: :pending do
    event :auto_reject do
      transition pending: :auto_rejected
    end

    event :auto_approve do
      transition pending: :auto_approved
    end

    event :review do
      transition pending: :under_review
    end

    event :approve do
      transition under_review: :approved
    end

    event :reject do
      transition [:pending, :under_review] => :rejected
    end
  end

  after_create :enqueue_checks

  def enqueue_checks
    Verification::AutomatedChecksJob.perform_later(id)
  end

  def approve_request(admin_user, note: nil)
    transaction do
      self.note = note
      auto_approve!
      account.update!(verified: true)
      Notifications::AccountVerified::SendJob.perform_later(id)
    end
  end

  def reject_request(admin_user, reason)
    transaction do
      self.reason = reason
      auto_reject!
    end
    # TODO: send notification?
  end
end
