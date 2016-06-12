class AddCheckTokenToInstituition < ActiveRecord::Migration
  def change
    add_column :instituitions, :check_token, :boolean
  end
end
