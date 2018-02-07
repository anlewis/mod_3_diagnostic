class SearchController < ApplicationController
  def index
    zip_code = params[:q]

    @stations = Station.search_by_zip(zip_code)
  end
end