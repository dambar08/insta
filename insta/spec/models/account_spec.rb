# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  firstname  :string
#  lastname   :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_accounts_on_username  (username) UNIQUE
#
require "rails_helper"

RSpec.describe(Account, type: :model) do
  pending "add some examples to (or delete) #{__FILE__}"
end
