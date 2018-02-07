class SearchController < ApplicationController
  def index
    # make responsive
    # zip_code = 80203

    @stations = Station.search_by_zip(80203)
  end
end