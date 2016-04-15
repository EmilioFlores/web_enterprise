class FlipComissionPolicyRelation < ActiveRecord::Migration
  def change
  	remove_column :policies, :comission_id, :integer
  	add_column :comissions, :policy_id, :integer
  end
end
