class AddAttributesToClients < ActiveRecord::Migration
  def change
  	add_column :clients, :client_prospect, :boolean, default: false
  	add_column :clients, :real_client, :boolean, default: false
  end
end
