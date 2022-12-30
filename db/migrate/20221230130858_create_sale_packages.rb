class CreateSalePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_packages do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
