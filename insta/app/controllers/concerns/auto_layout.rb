module AutoLayout
  extend ActiveSupport::Concern

  included do
    before_action :set_auto_layout
    helper_method :with_layout
  end

  private

  def set_auto_layout
    console
    folder = controller_path # e.g., "articles"
    layout_path = "#{folder}/_layout"
    if lookup_context.template_exists?(layout_path, [], true)
      self.class.layout layout_path
    end
  end

  def with_layout
  end
end
