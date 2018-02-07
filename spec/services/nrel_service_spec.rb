require 'rails_helper'

describe NrelService do

  describe "stations" do
    it "finds stations by zip" do
      VCR.use_cassette("services/find_by_zip") do
        stations = NrelService.find_by_zip("80203")
        station = stations.first

        expect(stations.count).to eq(10)
        expect(station[:station_name]).to eq("UDR")
        expect(station[:street_address]).to eq("800 Acoma St")
        expect(station[:city]).to eq("Denver")
        expect(station[:state]).to eq("CO")
        expect(station[:zip]).to eq("80204")
        expect(station[:fuel_type_code]).to eq("ELEC")
        expect(station[:distance]).to eq(0.31422)
        expect(station[:access_days_time]).to eq("24 hours daily")
      end
    end
  end
end