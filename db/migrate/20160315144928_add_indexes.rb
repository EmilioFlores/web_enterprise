class AddIndexes < ActiveRecord::Migration
  def change
  	add_column :policies, :company_id, :integer, index: true
  end
end
