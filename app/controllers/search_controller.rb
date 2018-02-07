class SearchController < ApplicationController
  def index
    # make responsive
    # zip_code = 80203
    # fuel_types = "ELEC,LPG"

    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&location=80203&fuel_type=ELEC,LPG&limit=10")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end