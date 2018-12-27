class PostAdjustments
  
  include HTTParty
  

  base_uri HOSTS["mp-dinheiro"]
  headers 'Content-Type' => "application/json"

  def post_adjustments(path=PATHS["mp-dinheiro"]['adjustments'],jwt,template)
    self.class.post(path, body: template.to_json, :headers => {"Authorization" => jwt.to_s})    
  end

end
