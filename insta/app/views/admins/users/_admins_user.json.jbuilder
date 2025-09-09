# frozen_string_literal: true

json.extract!(admins_user, :id, :created_at, :updated_at)
json.url(admins_user_url(admins_user, format: :json))
