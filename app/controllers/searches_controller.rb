class SearchesController < ApplicationController

  def new
    @search =Search.new
    @categoriess = Search.uniq.pluck(:categorie)
  end

  def create
@search = Search.create(search_params)
redirect_ti @search
  end

  def show
    @search =Search.find(params[:id])
  end

private

  def search_params
    params.require(:search).permit(:categorie, :typedoc)
  end
end