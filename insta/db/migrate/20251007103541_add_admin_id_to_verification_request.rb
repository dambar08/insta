class AddAdminIdToVerificationRequest < ActiveRecord::Migration[7.2]
  def change
    add_reference(:verification_requests, :admin, foreign_key: true, index: true)
  end
end
