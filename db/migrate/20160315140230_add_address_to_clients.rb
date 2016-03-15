class AddAddressToClients < ActiveRecord::Migration
  def change
  	add_column :addresses, :client_id, :integer, index: true
  	change_column :clients, :marital_status, :integer, default: 0
  end
end
