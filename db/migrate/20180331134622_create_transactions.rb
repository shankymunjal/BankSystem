class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :type
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
