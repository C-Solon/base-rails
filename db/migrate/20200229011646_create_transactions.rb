class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :portfolio_id
      t.string :transaction_type
      t.date :date_of_opening
      t.date :date_unwinded
      t.integer :quoted_entity_id
      t.float :quantity

      t.timestamps
    end
  end
end
