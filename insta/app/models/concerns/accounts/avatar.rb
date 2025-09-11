# frozen_string_literal: true

module Accounts
  module Avatar
    extend ActiveSupport::Concern

    IMAGE_MIME_TYPES = ["image/jpeg", "image/png", "image/gif", "image/webp"].freeze
    LIMIT = 2.megabytes

    AVATAR_DIMENSIONS = [400, 400].freeze
    AVATAR_GEOMETRY = [AVATAR_DIMENSIONS.first, AVATAR_DIMENSIONS.last].join("x")

    class_methods do
      def avatar_styles(file)
        styles = { original: { geometry: "#{AVATAR_GEOMETRY}#", file_geometry_parser: FastGeometryParser } }
        styles[:static] = { geometry: "#{AVATAR_GEOMETRY}#", format: "png", convert_options: "-coalesce", file_geometry_parser: FastGeometryParser } if file.content_type == "image/gif"
        styles
      end

      private :avatar_styles
    end

    included do
      # Avatar upload
      has_one_attached :avatar
      validates :avatar, content_type: IMAGE_MIME_TYPES, size: { less_than: LIMIT }, dimension: { width: { in: 0..400 }, height: { in: 0..400 } }
    end

    def avatar_original_url
      avatar.url(:original)
    end

    def avatar_static_url
      avatar_content_type == "image/gif" ? avatar.url(:static) : avatar_original_url
    end
  end
end
