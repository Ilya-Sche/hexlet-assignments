class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    puts params.inspect
    @article = Article.find(params[:id])
  end
end
