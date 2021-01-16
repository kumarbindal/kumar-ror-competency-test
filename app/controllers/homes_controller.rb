class HomesController < ApplicationController
  # GET /
  def index
    @articles = Article.all.group_by(&:category)
  end
end
