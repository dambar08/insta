# == Schema Information
#
# Table name: settings
#
#  id         :bigint           not null, primary key
#  value      :text
#  var        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_settings_on_var  (var) UNIQUE
#
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  scope :application do
    field :app_name, default: "Insta", validates: { presence: true, length: { in: 2..20 } }
    field :host, default: "http://localhost:3000", readonly: true
    field :default_locale, default: "en", validates: { presence: true, inclusion: { in: ['zh-CN', 'en', 'jp'] } }, option_values: ['en', 'zh-CN'], help_text: "Bla bla ..."
    field :admin_emails, type: :array, default: ['a@mail.com']

    # lambda default value
    field :welcome_message, type: :string, default: -> { "welcome to #{app_name}" }, validates: { length: { maximum: 255 } }
    # Override array separator, default: /[\n,]/ split with \n or comma.
    field :tips, type: :array, separator: /[\n]+/
  end

  scope :limits do
    field :user_limits, type: :integer, default: 20
    field :exchange_rate, type: :float, default: 0.123
    field :captcha_enable, type: :boolean, default: true
  end

  scope :notifications do
    field :push_notification, type: :boolean, default: true
    field :email_notification, type: :boolean, default: true
  end

  scope :push_notifications do
  end

  scope :email_notifications do
  end

  field :readonly_item, type: :integer, default: 100, readonly: true

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
