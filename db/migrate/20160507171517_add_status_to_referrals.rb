class AddStatusToReferrals < ActiveRecord::Migration
  def change
    add_column :referrals, :status, :integer, default: 0
  end
end
