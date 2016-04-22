class AddsFieldsToReferrals < ActiveRecord::Migration
  def change
  	add_column :referrals, :first_name, :string
  	add_column :referrals, :second_name, :string
  	add_column :referrals, :last_name, :string
  	add_column :referrals, :second_last_name, :string
  	add_column :referrals, :email, :string
  end
end
