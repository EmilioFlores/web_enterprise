class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.integer :user_id, index: true
    	t.string :street
    	t.string :exterior_number
    	t.string :interior_number
    	t.string :county
    	t.string :state
    	t.string :city
    	t.string :delegation
    	t.string :zip_code
    	t.string :country
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
