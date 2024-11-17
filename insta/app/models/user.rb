# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  deleted_at             :datetime
#  dob                    :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  followers_count        :bigint           default(0)
#  followings_count       :bigint           default(0)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # has_paper_trail versions: { class_name: "UserVersion" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable
  has_many :access_grants, class_name: "Doorkeeper::AccessGrant", foreign_key: :resource_owner_id, dependent: :delete_all # or :destroy if you need callbacks
  has_many :access_tokens, class_name: "Doorkeeper::AccessToken", foreign_key: :resource_owner_id, dependent: :delete_all # or :destroy if you need callbacks
  has_many :followers, dependent: :destroy, class_name: "Follow", foreign_key: "following_id"
  has_many :followings, dependent: :destroy, class_name: "Follow", foreign_key: "follower_id"
  has_one :profile, dependent: :destroy

  # has_many :folowings, through: :follows
  def age
    return unless dob

    @age ||= ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end

  def follow!(user)
    Follow.create!(follower_id: id, following_id: user.id)
  end

  def unfollow!(user)
    Follow.where(follower_id: id, following_id: user.id).delete_all
  end
end
