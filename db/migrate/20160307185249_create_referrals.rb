class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
    	t.integer :referrer_id, index: true
    	t.integer :referee_id, index: true
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
