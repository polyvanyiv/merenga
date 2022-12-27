class AddArticleToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchases, :article, null: false, foreign_key: true
  end
end
