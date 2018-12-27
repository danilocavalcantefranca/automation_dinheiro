Dado("que eu esteja com o perfil de acesso a criacao") do
  YAML.load_file("features/templates/teste.yml")
  @template_jwt
  @jwt = @page.(PostReturnJwt).return_jwt(@template_jwt)
end

Dado("que eu esteja com o perfil sem acesso a criacao") do
  @template_jwt_error
  @jwt = @page.(PostReturnJwt).return_jwt(@template_jwt_error)
end

Dado("envie o json com os dados") do
  @template = create_json_adjustments
end

Dado("passe o campo {string} no json sem preenchimento") do |field|
  @template = create_json_adjustments
  change_fields(@template,field)
end

Dado("crie um ajuste passando o tipo do pagamento com o id {string}") do |id_payment|
  @template = create_json_adjustments
  @template["tipoAjuste"] = id_payment
end

Dado("que eu crie um ajuste passando um numero de pedido valido {string}") do |order_id|
  @template = create_json_adjustments
  @template["numeroPedido"] = order_id
  @template["protocoloAtendimento"] = "" 
end

Dado("crie um ajuste passando um numero de pedido inválido {string}") do |order_id|
  @template = create_json_adjustments
  @template["numeroPedido"] = order_id
end

Dado("crie um ajuste passando um protocolo valido {string}") do |number_protocol|
  @template = create_json_adjustments
  @template["protocoloAtendimento"] = number_protocol
end

Dado("crie um ajuste passando um protocolo invalido {string}") do |number_protocol|
  @template = create_json_adjustments
  @template["protocoloAtendimento"] = number_protocol
end

Dado("crie um ajuste passando um motivo invalido {string}") do |motive_invalid|
  @template = create_json_adjustments
  @template["motivoAjustes"] = motive_invalid
end

Dado("crie um ajuste passando um motivo valido {string}") do |motive_valid|
  @template = create_json_adjustments
  @template["motivoAjustes"] = motive_valid
end

Quando("realizar o post de criacao do ajuste") do
  jwt = @jwt["conteudo"]
  @adjustments = @page.(PostAdjustments).post_adjustments(jwt,@template)
end

Entao("devo receber status {int}") do |statuscode|
  expect(@adjustments.code).to eq(statuscode)
end

Entao("o dado deve ser gravado no banco de dados com status {string}") do |status|
  jwt = @jwt["conteudo"]
  parameters = {"id": @adjustments["conteudo"]["id"]}
  @return_get =  @page.(GetAdjustments).return_adjustments(jwt,parameters)  
  fields = ["id","idBandeira","dataCriacao","dataLiberacao","numeroPedido","protocoloAtendimento","motivoAjustes"]
  fields.each do |value| 
    expect(@return_get["conteudo"]["content"][0][value]).to eq(@adjustments["conteudo"][value])
  end
  expect(@return_get["conteudo"]["content"][0]["status"]).to eq(status)
end

Entao("{string} de violacao") do |error_message|
  expect(@adjustments["motivos"][0]).to include(error_message)
end

Entao("mensagem de violacao de {string}") do |error_message|
    expect(@adjustments["motivos"][0]).to include(error_message)
end