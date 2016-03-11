class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.integer :event_id, index: true
    	t.string :notification_type
    	t.boolean :read, default: false
    	t.text :description
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
