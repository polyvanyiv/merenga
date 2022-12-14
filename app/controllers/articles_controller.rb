class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @lastPrice = Purchase.where("article_id = ?", @article.id).order("created_at DESC").first
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  #
  # def getLastPrice
  #   @article = Article.find(params[:id])
  #   @lastPrice = Purchase.find_by_article_id(@article.id).order("created_at DESC").limit(1)
  # end

  private
  def article_params
    params.require(:article).permit(:name, :category, :unit)
  end

end
