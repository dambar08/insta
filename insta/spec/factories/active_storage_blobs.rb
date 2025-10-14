# == Schema Information
#
# Table name: active_storage_blobs
#
#  id           :bigint           not null, primary key
#  byte_size    :bigint           not null
#  checksum     :string
#  content_type :string
#  filename     :string           not null
#  key          :string           not null
#  metadata     :text
#  service_name :string           not null
#  created_at   :datetime         not null
#
# Indexes
#
#  index_active_storage_blobs_on_key  (key) UNIQUE
#
FactoryBot.define do
  factory :active_storage_blob do
  end
end
