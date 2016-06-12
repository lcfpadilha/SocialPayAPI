class CreateInstituitions < ActiveRecord::Migration
  def change
    create_table :instituitions do |t|
      t.string :name
      t.string :description
      t.string :access_token
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
