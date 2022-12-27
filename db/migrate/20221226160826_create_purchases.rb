class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.decimal :amount
      t.decimal :pricePerUnit
      t.decimal :weightPerUnit
      t.string :store

      t.timestamps
    end
  end
end
