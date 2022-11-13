class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipedetail = RecipeDetail.where("recipe_id = ?", @recipe.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipedetail = RecipeDetail.where("recipe_id = ?", @recipe.id)
  end

  def update
    @recipe = Recipe.find(params[:id])

    @newrecipedetail = RecipeDetail.new(recipedetails_params)

    # if @newrecipedetail.save
    #   redirect_to @recipe
    # else
    #   render :edit, status: :unprocessable_entity
    # end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :output)
  end

  private
  def recipedetails_params
    params.permit(:article_id, :recipe_id, :amount)
  end
end
