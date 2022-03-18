class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin_user!, only: [ :new, :create, :edit, :update ]

  def index
    @articles = Article.order(:created_at)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save!
      redirect_to root_path
    else
      render action: new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    if @article.save!
      redirect_to root_path
    else
      @error = @article.errors
      render action: "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private def article_params
    params.require(:article).permit(:title, :content)
  end
end
