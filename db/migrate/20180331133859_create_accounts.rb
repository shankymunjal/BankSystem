class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user
      t.float :amount
      t.string :number

      t.timestamps
    end
  end
end
