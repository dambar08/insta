# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table(:notifications) do |t|
      t.belongs_to(:account)
      t.string(:action)
      t.jsonb(:json_data)
      t.bigint(:notifiable_id)
      t.string(:notifiable_type)
      t.datetime(:notified_at)
      t.datetime(:read_at)
      t.timestamps
    end

    add_index(:notifications, :created_at)
    add_index(:notifications, :notified_at)
    add_index(:notifications, [:notifiable_id, :notifiable_type, :action])
    add_index(:notifications, [:account_id, :notifiable_id, :notifiable_type, :action])
    add_index(:notifications, [:account_id, :notifiable_id, :notifiable_type])
  end
end
