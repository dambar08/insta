# == Schema Information
#
# Table name: assets
#
#  id            :bigint           not null, primary key
#  position      :integer
#  viewable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  viewable_id   :bigint
#
# Indexes
#
#  index_assets_on_viewable  (viewable_type,viewable_id)
#
class Asset < ApplicationRecord
  VIEWABLE_TYPES = ["Post"].freeze

  belongs_to :viewable, polymorphic: true, touch: true
  has_one_attached :attachment

  delegate :key, :attached?, :variant, :variable?, :blob, :filename, to: :attachment

  validates :viewable_type, inclusion: { in: VIEWABLE_TYPES }

  default_scope { includes(attachment_attachment: :blob) }

  def url(style)
    return placeholder(style) unless attachment.attached?

    attachment.variant(resize_to_limit: dimensions_for_style(style))
  end

  def placeholder(style)
    "noimage/#{style}.png"
  end

  def dimensions_for_style(style)
    dimensions = self.class.styles.with_indifferent_access[style] || self.class.styles.with_indifferent_access[default_style]
    dimensions.split('x').map(&:to_i)
  end

  def square
    attachment.variant(resize_to_limit: [460, 625])
  end

  # Portrait (vertical)
  def portrait
    attachment.variant(resize_to_fill: [1080, 1350])
  end

  # Landscape (horizontal)
  def landscape
    attachment.variant(resize_to_fill: [1080, 566])
  end
end
