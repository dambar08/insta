# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_10_04_022555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_blocks", force: :cascade do |t|
    t.bigint "blocker_id"
    t.bigint "blocked_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocker_id", "blocked_id"], name: "index_account_blocks_on_blocker_id_and_blocked_id", unique: true
  end

  create_table "account_pins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_settings", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_settings_on_account_id"
    t.index ["var"], name: "index_account_settings_on_var", unique: true
  end

  create_table "account_stats", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "posts_count", default: 0, null: false
    t.bigint "following_count", default: 0, null: false
    t.bigint "followers_count", default: 0, null: false
    t.datetime "last_post_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_stats_on_account_id"
    t.index ["last_post_at", "account_id"], name: "index_account_stats_on_last_post_at_and_account_id", order: { last_post_at: :desc }, where: "(last_post_at IS NOT NULL)"
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "followers_count", default: 0
    t.bigint "followings_count", default: 0
    t.bigint "blocked_by_count", default: 0, null: false
    t.bigint "blocking_others_count", default: 0, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "admins_roles", id: false, force: :cascade do |t|
    t.bigint "admin_id"
    t.bigint "role_id"
    t.index ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id"
    t.index ["admin_id"], name: "index_admins_roles_on_admin_id"
    t.index ["role_id"], name: "index_admins_roles_on_role_id"
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "assets", force: :cascade do |t|
    t.string "viewable_type"
    t.bigint "viewable_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["viewable_type", "viewable_id"], name: "index_assets_on_viewable"
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.string "bookmarkable_type", null: false
    t.bigint "bookmarkable_id", null: false
    t.string "accountable_type", null: false
    t.bigint "accountable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountable_id", "accountable_type", "bookmarkable_id", "bookmarkable_type"], name: "idx_on_accountable_id_accountable_type_bookmarkable_b1439e43fb", unique: true
    t.index ["accountable_id", "accountable_type"], name: "index_bookmarks_on_accountable_id_and_accountable_type"
    t.index ["accountable_type", "accountable_id"], name: "index_bookmarks_on_accountable"
    t.index ["bookmarkable_id", "bookmarkable_type"], name: "index_bookmarks_on_bookmarkable_id_and_bookmarkable_type"
    t.index ["bookmarkable_type", "bookmarkable_id"], name: "index_bookmarks_on_bookmarkable"
    t.index ["created_at"], name: "index_bookmarks_on_created_at"
  end

  create_table "canonical_email_blocks", force: :cascade do |t|
    t.string "canonical_email_hash", default: "", null: false
    t.bigint "reference_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canonical_email_hash"], name: "index_canonical_email_blocks_on_canonical_email_hash", unique: true
    t.index ["reference_account_id"], name: "index_canonical_email_blocks_on_reference_account_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body_plain"
    t.bigint "commentable_id"
    t.string "commentable_type"
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["deleted_at"], name: "index_comments_on_deleted_at"
  end

  create_table "field_test_memberships", force: :cascade do |t|
    t.string "participant_type"
    t.string "participant_id"
    t.string "experiment"
    t.string "variant"
    t.datetime "created_at"
    t.boolean "converted", default: false
    t.index ["experiment", "created_at"], name: "index_field_test_memberships_on_experiment_and_created_at"
    t.index ["participant_type", "participant_id", "experiment"], name: "index_field_test_memberships_on_participant", unique: true
  end

  create_table "follow_requests", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "target_account_id"
    t.boolean "notify", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "target_account_id"], name: "index_follow_requests_on_account_id_and_target_account_id", unique: true
    t.index ["account_id"], name: "index_follow_requests_on_account_id"
    t.index ["target_account_id"], name: "index_follow_requests_on_target_account_id"
  end

  create_table "follows", force: :cascade do |t|
    t.boolean "blocked", default: false, null: false
    t.string "follower_type", null: false
    t.bigint "follower_id", null: false
    t.bigint "followable_id", null: false
    t.string "followable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_follows_on_created_at"
    t.index ["followable_id", "followable_type", "follower_id", "follower_type"], name: "index_follows_on_followable_and_follower", unique: true
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_type", "follower_id"], name: "fk_follows"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "issues", force: :cascade do |t|
    t.text "description"
    t.integer "status", default: 0, null: false
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_issues_on_account_id"
    t.index ["status"], name: "index_issues_on_status"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "locatorable_id"
    t.bigint "locatorable_type"
    t.string "name"
    t.decimal "latitude", precision: 9, scale: 6
    t.decimal "longitude", precision: 9, scale: 6
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatorable_id", "locatorable_type"], name: "index_locations_on_locatorable_id_and_locatorable_type"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "account_id"
    t.string "action"
    t.jsonb "json_data"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "notified_at"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "notifiable_id", "notifiable_type", "action"], name: "idx_on_account_id_notifiable_id_notifiable_type_act_868a1a32fb"
    t.index ["account_id", "notifiable_id", "notifiable_type"], name: "idx_on_account_id_notifiable_id_notifiable_type_89a5e23bd7"
    t.index ["account_id"], name: "index_notifications_on_account_id"
    t.index ["created_at"], name: "index_notifications_on_created_at"
    t.index ["notifiable_id", "notifiable_type", "action"], name: "idx_on_notifiable_id_notifiable_type_action_cd1255fd91"
    t.index ["notified_at"], name: "index_notifications_on_notified_at"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.string "scopes"
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "caption", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", null: false
    t.boolean "allow_comment", default: true, null: false
    t.index ["account_id"], name: "index_posts_on_account_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "type"
    t.string "temporary_url"
    t.string "original_url"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "rpush_apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "environment"
    t.text "certificate"
    t.string "password"
    t.integer "connections", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", null: false
    t.string "auth_key"
    t.string "client_id"
    t.string "client_secret"
    t.string "access_token"
    t.datetime "access_token_expiration"
    t.text "apn_key"
    t.string "apn_key_id"
    t.string "team_id"
    t.string "bundle_id"
    t.boolean "feedback_enabled", default: true
  end

  create_table "rpush_feedback", force: :cascade do |t|
    t.string "device_token"
    t.datetime "failed_at", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "app_id"
    t.index ["device_token"], name: "index_rpush_feedback_on_device_token"
  end

  create_table "rpush_notifications", force: :cascade do |t|
    t.integer "badge"
    t.string "device_token"
    t.string "sound"
    t.text "alert"
    t.text "data"
    t.integer "expiry", default: 86400
    t.boolean "delivered", default: false, null: false
    t.datetime "delivered_at", precision: nil
    t.boolean "failed", default: false, null: false
    t.datetime "failed_at", precision: nil
    t.integer "error_code"
    t.text "error_description"
    t.datetime "deliver_after", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "alert_is_json", default: false, null: false
    t.string "type", null: false
    t.string "collapse_key"
    t.boolean "delay_while_idle", default: false, null: false
    t.text "registration_ids"
    t.integer "app_id", null: false
    t.integer "retries", default: 0
    t.string "uri"
    t.datetime "fail_after", precision: nil
    t.boolean "processing", default: false, null: false
    t.integer "priority"
    t.text "url_args"
    t.string "category"
    t.boolean "content_available", default: false, null: false
    t.text "notification"
    t.boolean "mutable_content", default: false, null: false
    t.string "external_device_id"
    t.string "thread_id"
    t.boolean "dry_run", default: false, null: false
    t.boolean "sound_is_json", default: false
    t.index ["delivered", "failed", "processing", "deliver_after", "created_at"], name: "index_rpush_notifications_multi", where: "((NOT delivered) AND (NOT failed))"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "versions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "item_type", null: false
    t.string "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "account_stats", "accounts"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "follow_requests", "accounts", column: "target_account_id"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_grants", "users", column: "resource_owner_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
  add_foreign_key "posts", "accounts"
end
