class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index
  load_and_authorize_resource

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show; end

  # GET /articles/new
  def new
    # @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  def create
    # @article = Article.new(article_params)
    @article.user_id = current_user.id

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  # def set_article
  #   @article = Article.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:title, :content, :category, :user_id)
  end
end
