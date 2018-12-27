class ReasonListingService
  
  include HTTParty

  base_uri HOSTS["cr"]

  def get_reason(path=PATHS["cr"]['get_reason'])
    self.class.get(path)
  end

end