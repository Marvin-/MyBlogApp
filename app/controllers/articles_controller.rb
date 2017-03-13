class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [:show, :index]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :articles_by_month, only: [:index]

  def index
    @articles = Article.all
    @month = params[:month]
    if @month
      # params.require(:month)   
      @month_articles = Article.by_month[@month]
      render 'by_month'
    end
  end

  def new
    @article = Article.new
  end

  def create 
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Article '#{@article.title}' created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article.increment(:view_count)
    @article.save
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def edit
  end

  def update
    @article.update(article_params)
    
    flash.notice = "Article '#{@article.title}' updated."
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Article '#{@article.title}' deleted."
    redirect_to articles_path
  end
end
