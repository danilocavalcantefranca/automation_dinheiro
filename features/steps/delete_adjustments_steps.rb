Quando("realizar o delete no endpoint com o usuario correto") do
  parameters = @return_get["conteudo"]["content"][0]["id"]
  jwt = @jwt["conteudo"]
  @adjustments = @page.(DeleteAdjustments).delete_adjustments(jwt,parameters)
end

Quando("realizar o delete no endpoint com o usuario sem acesso") do
  steps %{Dado que eu esteja com o perfil sem acesso a criacao} 
  parameters = @return_get["conteudo"]["content"][0]["id"]
  jwt = @jwt["conteudo"]
  @adjustments = @page.(DeleteAdjustments).delete_adjustments(jwt,parameters)
end

Quando("realizar o delete no endpoint com status {string}") do |status|
  jwt = @jwt["conteudo"]
  parameters = {"status" => status }
  @return_get = @page.(GetAdjustments).return_adjustments(jwt,parameters)
  parameters = @return_get["conteudo"]["content"][0]["id"]
  @adjustments = @page.(DeleteAdjustments).delete_adjustments(jwt,parameters)
end

Entao("dado excluido do banco de dados") do
  jwt = @jwt["conteudo"]
  id_adjustement = @return_get["conteudo"]["content"][0]["id"]
  parameters = {"id": id_adjustement}
  @return_get = @page.(GetAdjustments).return_adjustments(jwt,parameters)
  expect(@return_get.parsed_response["conteudo"]["totalElements"]).to eq(0)
end