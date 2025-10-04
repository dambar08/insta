# frozen_string_literal: true

require_relative "boot"

# require "rails/all"
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
# require 'action_mailbox/engine'
require 'action_text/engine'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Rails.load if Rails.env.local?

# require_relative '../models/concerns/followable'
# require_relative '../models/concerns/follower'

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
    config.autoload_paths << Rails.root.join("lib")
    config.eager_load_paths << Rails.root.join("lib")

    # initializer "followable.active_record" do |_app|
    # ActiveSupport.on_load :active_record do
    #   include ::Followable
    # end
    # end

    # initializer "follower.active_record" do |_app|
    # ActiveSupport.on_load :active_record do
    #   include ::Follower
    # end
    # end
  end
end
