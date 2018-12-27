Dado("consulte pelo lojista {int}") do |id_shopkeeper|
  jwt = @jwt["conteudo"]
  parameters = {"idLojista": id_shopkeeper}
  @adjustments = @page.(GetAdjustments).return_adjustments(jwt,parameters)
end

Dado("esteja consultando por um lojista {string}") do |shopkeeper|
  jwt = @jwt["conteudo"]
  parameters = {"idLojista": shopkeeper}
  @adjustments = @page.(GetAdjustments).return_adjustments(jwt,parameters)
end

Quando("realizar o get no endpoint") do
  jwt = @jwt["conteudo"]
  @adjustments = @page.(GetAdjustments).return_all_adjustments(jwt)
end

Entao("API retornando dados corretamente") do
  expect(@adjustments["conteudo"]["totalElements"]).to be > 0
end

Entao("API retornando dados referente ao lojista {int}") do |id_shopkeeper|
  expect(@adjustments["conteudo"]["content"][0]["idLojista"]).to eq(id_shopkeeper)
end