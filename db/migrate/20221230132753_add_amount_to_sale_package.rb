class AddAmountToSalePackage < ActiveRecord::Migration[7.0]
  def change
    add_column :sale_packages, :amount, :decimal
  end
end
