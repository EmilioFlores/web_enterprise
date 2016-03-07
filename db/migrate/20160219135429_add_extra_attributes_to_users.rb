class AddExtraAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
    add_column :users, :last_name, :string
    add_column :users, :second_last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :user_type, :integer, default: 0
    add_column :users, :deleted_at, :datetime
    add_column :users, :resp_civil_policy_company, :string
    add_column :users, :resp_civil_policy_number, :string
    add_column :users, :resp_civil_policy_end_date, :datetime
    add_column :users, :secondary_email, :string
    add_column :users, :legal_entity, :string
    add_column :users, :business_name, :string
    add_column :users, :user_rfc, :string
    add_column :users, :email_invoice, :string
    add_index :users, :deleted_at
  end
end
