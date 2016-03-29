class CreateCompanyUsers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
    	t.integer :user_id, index: true
    	t.integer :company_id, index: true
    	t.string :agent_number
    	t.string :user_name
		  t.string :password_hash
    	t.string :password_salt
    	t.string :protal_url
    	t.boolean :has_promotoria, default: false
    	t.string :number_promotoria
    	t.string :name_promotoria_contact
    	t.string :phone_promotoria_contact
    	t.string :email_promotoria_contact
    	t.boolean :has_company, default: false
    	t.string :number_company
    	t.string :name_company_contact
    	t.string :phone_company_contact
    	t.string :email_company_contact
      t.datetime :deleted_at, index: true
      t.timestamps null: false
    end
  end
end
