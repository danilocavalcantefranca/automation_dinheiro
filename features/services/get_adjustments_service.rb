class GetAdjustments
  
  include HTTParty
  

  base_uri HOSTS["mp-dinheiro"]
  headers 'Content-Type' => "application/json"

  def return_adjustments(path=PATHS["mp-dinheiro"]['adjustments'],jwt,parameters)
   self.class.get(path,:query => parameters, :headers => {"Authorization" => jwt.to_s})
  end

  def return_all_adjustments(path=PATHS["mp-dinheiro"]['adjustments'],jwt)
    self.class.get(path,:headers => {"Authorization" => jwt.to_s})
  end
end