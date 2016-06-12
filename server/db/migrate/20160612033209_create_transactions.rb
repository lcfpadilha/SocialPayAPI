class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :value
      t.string :info
      t.integer :status

      t.timestamps null: false
    end
  end
end
