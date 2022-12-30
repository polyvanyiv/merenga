class SalePackagesController < ApplicationController

  def create
    @sale = Sale.find(params[:sale_id])
    @sale_package = @sale.sale_packages.create(sale_package_params)
    redirect_to sale_path(@sale)
  end

  private
  def sale_package_params
    params.require(:sale_package).permit(:sale_id, :article_id, :amount)
  end
end
