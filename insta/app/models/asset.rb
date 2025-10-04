class Asset < ApplicationRecord
  VIEWABLE_TYPES = ["Viewable"].freeze
  belongs_to :viewable, polymorphic: true
  has_one_attached :attachment

  validates :viewable_id, uniqueness: { scope: [:viewable_id] }
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
end
