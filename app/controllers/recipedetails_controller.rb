class RecipedetailsController < ApplicationController
  def index
    @recipedetails = RecipeDetail.all
  end

  def new
    @recipedetail = RecipeDetail.new
  end

  def create
    @recipedetail = RecipeDetail.new(recipedetails_params)
    if @recipedetail.save
      redirect_back(fallback_location: recipes_path)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipedetails = RecipeDetail.all
  end

  def destroy
    @recipedetail = RecipeDetail.find(params[:id])
    @recipedetail.destroy
    #
    # @recipedetail = RecipeDetail.where("article_id = ? and recipe_id = ?", params[:aid], params[:rid])
    # RecipeDetail.destroy(@recipedetail.id)

    redirect_back(fallback_location: recipes_path)
  end


  private
  def recipedetails_params
    params.permit(:article_id, :recipe_id, :amount)
  end


end
