class NrelService

  def self.find_by_zip(zip_code)
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_key']}&location=#{zip_code}&fuel_type=ELEC,LPG&limit=10&radius=6.0")

    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

end