module Helpers

  def create_json_adjustments
    template = YAML.load_file("features/templates/post_adjustments.yml")
    template["dataLiberacao"] = DateTime.strptime("#{Time.now + 86400}", '%Y-%m-%d')
    template["idBandeira"] = 3
    template["idLojista"] = 3
    template["motivoAjustes"] = 10
    template["numeroPedido"] = Faker::Number.number
    template["protocoloAtendimento"] = Faker::Number.number
    template["tipoAjuste"] = 1
    template["valorAjuste"] = 10
    template
  end

  def create_json_adjustments_updated
    template = YAML.load_file("features/templates/put_adjustments.yml")
    template
  end

  def post_return_jwt(payload, http, path)
    http.class.post(path, body: payload.to_json)
  end

  def change_fields(template,field)
    if field == "numeroPedido" || field == "protocoloAtendimento"    
      template["numeroPedido"] = ""
      template["protocoloAtendimento"] = ""
    end
    template[field] = ""
  end

  def transform_template_put(return_get)
    template = YAML.load_file("features/templates/put_adjustments.yml")
    template["dataCriacao"] = return_get["content"][0]["dataCriacao"]
    template["dataLiberacao"] = return_get["content"][0]["dataLiberacao"]
    template["id"] = return_get["content"][0]["id"]
    template["idBandeira"] = return_get["content"][0]["idBandeira"]
    template["idLojista"] = return_get["content"][0]["idLojista"]
    template["motivoAjustes"] = return_get["content"][0]["motivoAjustes"]
    template["motivoAjusteDescricao"] = return_get["content"][0]["motivoAjusteDescricao"]
    template
  end

end