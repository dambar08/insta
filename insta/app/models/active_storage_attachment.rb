# == Schema Information
#
# Table name: active_storage_attachments
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  record_type :string           not null
#  created_at  :datetime         not null
#  blob_id     :bigint           not null
#  record_id   :bigint           not null
#
# Indexes
#
#  index_active_storage_attachments_on_blob_id  (blob_id)
#  index_active_storage_attachments_uniqueness  (record_type,record_id,name,blob_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (blob_id => active_storage_blobs.id)
#
class ActiveStorageAttachment < ActiveStorage::Attachment
end
