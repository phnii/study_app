class ArticlesController < ApplicationController
  def index
    @articles = Article.order(:created_at)
  end

  def new
    @article = Article.new
  end
end
