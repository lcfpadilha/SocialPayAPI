class AddTokenToClients < ActiveRecord::Migration
  def change
    add_column :clients, :token, :string
  end
end
