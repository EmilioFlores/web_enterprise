class CreateComissions < ActiveRecord::Migration
  def change
    create_table :comissions do |t|
    	t.float :first_year
    	t.float :second_year
    	t.float :third_year
    	t.float :fourth_year
    	t.float :fifth_year
    	t.float :post_fifth_year
    	t.float :base_prime
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
