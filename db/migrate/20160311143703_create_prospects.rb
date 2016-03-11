class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
    	t.integer :client_id, index: true
    	t.integer :company_id, index: true
    	t.string :product_type
    	t.integer :payment_method
    	t.datetime :end_date
      t.timestamps null: false
    end
  end
end
