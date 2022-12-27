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
  def edit
    @recipedetail = RecipeDetail.find(params[:id])
  end

  def update
    @recipedetail = RecipeDetail.find(params[:id])
    if @recipedetail.update(recipedetails_params)
    # if @recipedetail.update_attribute(:article_id, params[:article_id])
    # if @recipedetail.update_attribute(:amount, params[:amount])
      #todo: this updates using the value from the DTO, not from the form. Need to take value from the form! change - recipes\edit.view
      redirect_back(fallback_location: recipes_path)
    else
      render :edit, status: :unprocessable_entity
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
    # params.delete(:_method)
    # params.delete(:authenticity_token)
  end


end
