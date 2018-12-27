class PutAdjustments

  include HTTParty


  base_uri HOSTS["mp-dinheiro"]
  headers 'Content-Type' => "application/json"

  def put_adjustments(path=PATHS["mp-dinheiro"]['adjustments'],jwt,template)
    self.class.put(path, body: template.to_json, :headers => {"Authorization" => jwt.to_s})
  end

  def update_fields(field, value, template)
    if value == "DATA"
      value = DateTime.strptime("#{Time.now + 86400}", '%Y-%m-%d')
    end
  template[field] = value
  template
  end

  def update_fields_return_get(field, value, template)
    json = create_json_adjustments_updated()
    if value == "DATA"
      value = DateTime.strptime("#{Time.now + 86400}", '%Y-%m-%d')
    end
    json["id"] = template["conteudo"]["content"][0]["id"]
    json[field] = value
    json
  end

end