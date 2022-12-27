class PurchasesController < ApplicationController

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end


  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      redirect_to @purchase
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])

    if @purchase.update(purchase_params)
      redirect_to new_purchase_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def purchase_params
    params.require(:purchase).permit(:amount, :pricePerUnit, :weightPerUnit, :store, :article_id)
  end

end
