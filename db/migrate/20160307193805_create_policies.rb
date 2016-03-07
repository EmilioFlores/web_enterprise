class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
    	t.integer :client_id, index: true
    	t.integer :policy_type
    	t.integer :renewal_method
    	t.integer :payment_method
    	t.integer :comission_id, index: true
    	t.string :policy_number
    	t.datetime :issued_date
    	t.datetime :expiration_date
    	t.string :product_name
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
