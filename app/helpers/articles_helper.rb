module ArticlesHelper
  
  def article_params
    params.require(:article).permit(:title, :body, :tag_list, :image)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def articles_by_month
    @article_months = Article.order("created_at DESC").by_month
  end
end
