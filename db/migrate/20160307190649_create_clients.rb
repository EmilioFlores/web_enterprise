class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.integer :user_id, index: true
    	t.integer :marital_status
    	t.string :first_name
    	t.string :second_name
    	t.string :last_name
    	t.string :second_last_name
    	t.datetime :birth_date
    	t.integer :gender
    	t.string :email
    	t.string :phone_number
    	t.string :cellphone_number
    	t.boolean :has_kids, default: false
    	t.boolean :is_vip, default: false
    	t.datetime :client_since
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
