class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :recipe, null: false, foreign_key: true
      t.date :orderPlaced
      t.date :orderDelivery
      t.date :y
      t.string :clientTmp
      t.decimal :amount
      t.decimal :cost
      t.decimal :price
      t.decimal :discount
      t.decimal :delivery
      t.decimal :sum
      t.decimal :profit
      t.boolean :processed

      t.timestamps
    end
  end
end
