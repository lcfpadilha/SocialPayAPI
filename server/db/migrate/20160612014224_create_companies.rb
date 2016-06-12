class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :access_token

      t.timestamps null: false
    end
  end
end
