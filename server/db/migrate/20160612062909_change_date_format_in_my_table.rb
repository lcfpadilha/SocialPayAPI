class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
    change_column :clients, :card, :string
  end
end
