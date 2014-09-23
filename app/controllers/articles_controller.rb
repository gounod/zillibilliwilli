# encoding: utf-8

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @discussion = Discussion.find(params[:discussion_id])
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @discussion = Discussion.find(params[:discussion_id])
    @article = Article.new(article_params)
    @article.discussion = @discussion
    if current_user.present?
      @article.user = current_user
    end
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
      @discussion = Discussion.find(params[:discussion_id])
    end

    def article_params
      params.require(:article).permit(:description)
    end
end
