class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.integer :client_id, index: true
    	t.string :first_name
    	t.string :last_name
    	t.integer :relationship, default: 0
    	t.datetime :event_date
    	t.text :notes
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
