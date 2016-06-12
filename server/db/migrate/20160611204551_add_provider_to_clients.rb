class AddProviderToClients < ActiveRecord::Migration
  def change
    add_column :clients, :provider, :string
  end
end
