class ArticlesController < ApplicationController

  def index
    logger.debug "[ArticlesController] index method...."
    @articles = Article.all
  end

  def create
    logger.debug "[ArticlesController] create method...."
    @article = Article.new(article_params)

    if @article.save
      logger.debug "[ArticlesController] save is successful."
      redirect_to @article
    else
      logger.debug "[ArticlesController] save is not successful."
      render 'new'
    end

  end

  def show
    logger.debug "[ArticlesController] show method...."
    @article = Article.find(params[:id])
  end

  def new
    logger.debug "[ArticlesController] new method...."
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])    
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path    
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end
