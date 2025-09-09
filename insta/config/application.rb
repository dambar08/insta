# frozen_string_literal: true

require_relative "boot"

require "rails/all"
# require "view_component"
# require "primer/view_components"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Rails.load if Rails.env.local?

module Insta
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(7.1)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "UTC"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
