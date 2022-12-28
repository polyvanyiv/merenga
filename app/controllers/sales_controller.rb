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
  def calcCost
    redirect_to sales_path
  end

  private
  def sale_params
    params.require(:sale).permit(:recipe_id, :amount, :orderPlaced, :orderDelivery, :clientTmp, :discount, :delivery, :processed)
  end

end
