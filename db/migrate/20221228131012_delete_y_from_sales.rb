class DeleteYFromSales < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales, :y, :date
  end
end
