class CreateRecipeDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_details do |t|
      t.references :article, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
