class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to @sale
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      calcCost @sale
      redirect_to sales_path
    else
      redirect_to sales_path
    end
  end


  def edit
    @sale = Sale.find(params[:id])
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    redirect_to sales_path, status: :see_other
  end
  def calcCost (sale)
    # @recipe = Recipe.find(sale.recipe_id)
    # sale.update_attribute("clientTmp", @recipe.name)
    cost = 0.0
    RecipeDetail.where(recipe_id: sale.recipe_id).find_each do |rd|
      article = Article.find(rd.article_id)
      latestPurchase = Purchase.where("article_id = ?", rd.article_id).order("created_at DESC").first
      latestCostPerUnit = latestPurchase.pricePerUnit / latestPurchase.weightPerUnit
      amountInRecipe = rd.amount
      tmpCost = latestCostPerUnit * amountInRecipe
      cost = cost + tmpCost
    end
    sale.update_attribute("clientTmp", sale.clientTmp + cost.to_s + ", ")
    sale.update_attribute("profit", sale.profit+1)
  end

  private
  def sale_params
    params.require(:sale).permit(:recipe_id, :amount, :orderPlaced, :orderDelivery, :clientTmp, :discount, :delivery, :processed)
  end

end
