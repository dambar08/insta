# == Schema Information
#
# Table name: active_storage_variant_records
#
#  id               :bigint           not null, primary key
#  variation_digest :string           not null
#  blob_id          :bigint           not null
#
# Indexes
#
#  index_active_storage_variant_records_uniqueness  (blob_id,variation_digest) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (blob_id => active_storage_blobs.id)
#
class ActiveStorageVariantRecord < ActiveStorage::VariantRecord
end
