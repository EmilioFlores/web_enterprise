class CreateOffsprings < ActiveRecord::Migration
  def change
    create_table :offsprings do |t|
    	t.integer :client_id, index: true
    	t.string :first_name
    	t.string :second_name
    	t.string :last_name
    	t.string :second_last_name
    	t.datetime :birth_date
    	t.integer :gender
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
