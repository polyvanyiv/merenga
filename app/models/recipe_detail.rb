class RecipeDetail < ApplicationRecord
  belongs_to :article
  belongs_to :recipe
end
