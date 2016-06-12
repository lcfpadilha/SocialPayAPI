class AddCardToClients < ActiveRecord::Migration
  def change
    add_column :clients, :m, :integer
    add_column :clients, :y, :integer
    add_column :clients, :card, :integer
    add_column :clients, :cv, :integer
  end
end
