Quando("o ajuste estiver no status {string}") do |status|
  jwt = @jwt["conteudo"]
  parameters = {"status": status}
  @adjustments = @page.(GetAdjustments).return_adjustments(jwt, parameters)
end

Quando("realizar o put no endpoint alterando o {string} com o {string}") do |field, value|
  jwt = @jwt["conteudo"]
  @return_get = @page.(PutAdjustments).update_fields(field, value, @adjustments["conteudo"])
  @adjustments = @page.(PutAdjustments).put_adjustments(jwt, @return_get)
end

Quando("realizar o put alterando o {string} com o {string}") do |field, value|
  jwt = @jwt["conteudo"]
  @return_get = @page.(PutAdjustments).update_fields(field, value, @adjustments["conteudo"])
  @return_get = transform_template_put(@return_get)
  @adjustments = @page.(PutAdjustments).put_adjustments(jwt, @return_get)
end

Quando("realizar o put alterando o {string} com o {string} com perfil sem acesso") do |field, value|
  @return_get = @page.(PutAdjustments).update_fields(field, value, @adjustments["conteudo"])
  @return_get = transform_template_put(@return_get)
  steps %{Dado que eu esteja com o perfil sem acesso a criacao}
  jwt = @jwt["conteudo"]
  @adjustments = @page.(PutAdjustments).put_adjustments(jwt, @return_get)
end


Quando("realizar o put com perfil sem acesso no endpoint alterando o {string} com o {string}") do |field, value|
  steps %{Dado que eu esteja com o perfil sem acesso a criacao}
  jwt = @jwt["conteudo"]
  @adjustments = @page.(PutAdjustments).update_fields(field, value, @adjustments["conteudo"])
  @adjustments = @page.(PutAdjustments).put_adjustments(jwt, @adjustments)
end

Quando("ajuste no status de perfil sem acesso {string}") do |status|
  @adjustments = json_change_value_key("status", status, @adjustments["conteudo"])
  @adjustments = @page.(PutAdjustments).put_adjustments(@invalid_token, @adjustments)
end

Quando("realizar o put no endpoint alterando o campo {string} com o valor {int}") do |field, value|
  jwt = @jwt["conteudo"]
  @return_get = @page.(PutAdjustments).update_fields(field, value, @adjustments["conteudo"])
  @adjustments = @page.(PutAdjustments).put_adjustments(jwt, @return_get)
end


Entao("verificar se o {string} foi atualizado") do |campo|
  parameters = {"idLojista": @adjustments["conteudo"]["idLojista"], "id":@adjustments["conteudo"]["id"]}
  @adjustments = @page.(GetAdjustments).return_adjustments(@token, parameters)
  expect(@adjustments["conteudo"]["content"][0][campo]).to eq(@adjustments["conteudo"][campo])
end

Entao("API retornando dados corretamente com o {string} alterado") do |field|
  expect(@return_get[field].to_s).to eq(@adjustments["conteudo"][field].to_s)
end

Entao("API retornando dados corretamente no {string} alterado") do |field|
  if field == "dataLiberacao"
    @adjustments["conteudo"][field] = DateTime.strptime("#{@adjustments["conteudo"][field]}", '%Y-%m-%d')
  end
  expect(@return_get[field].to_s).to eq(@adjustments["conteudo"][field].to_s)
end

Entao("status atualizado para {string}") do |status|
  expect(@adjustments["conteudo"]["status"]).to eq (status)
end
