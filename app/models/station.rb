class Station < ActionController::Base

  def self.search_by_zip(zip_code)
    NrelService.find_by_zip(zip_code)
  end
  
end