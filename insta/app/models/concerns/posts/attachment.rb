# frozen_string_literal: true

module Posts
  module Attachment
    extend ActiveSupport::Concern

    IMAGE_MIME_TYPES = ["image/jpeg", "image/png", "image/gif", "image/webp"].freeze
    LIMIT = 5.megabytes

    included do
      has_many_attached :attachments
      validates :attachments, content_type: IMAGE_MIME_TYPES, size: { less_than: LIMIT }, dimension: { width: { in: 0..400 }, height: { in: 0..400 } }
    end

    def avatar_original_url
      avatar.url(:original)
    end

    def avatar_static_url
      avatar_content_type == "image/gif" ? avatar.url(:static) : avatar_original_url
    end
  end
end
