# == Schema Information
#
# Table name: account_settings
#
#  id         :bigint           not null, primary key
#  value      :text
#  var        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_account_settings_on_account_id  (account_id)
#  index_account_settings_on_var         (var) UNIQUE
#
class Accounts::Setting < RailsSettings::Base
  self.table_name = "account_settings"

  cache_prefix { "v1" }

  scope :notifications do
    field :push_notification, type: :boolean, default: Setting.push_notification
    field :email_notification, type: :boolean, default: true
  end

  scope :push_notifications do
  end

  scope :email_notifications do
  end

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
