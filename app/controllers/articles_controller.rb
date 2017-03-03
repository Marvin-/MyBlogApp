class ArticlesController < ApplicationController
  include ArticlesHelper
  before_filter :require_login, except: [:show, :index]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
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
