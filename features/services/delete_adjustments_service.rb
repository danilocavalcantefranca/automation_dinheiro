class DeleteAdjustments
  
  include HTTParty
  

  base_uri HOSTS["mp-dinheiro"]
  headers 'Content-Type' => "application/json"

  def delete_adjustments(path=PATHS["mp-dinheiro"]['adjustments'],jwt,id_adjustments)
    self.class.delete("#{path}/#{id_adjustments}", :headers => {"Authorization" => jwt.to_s})   
  end

end