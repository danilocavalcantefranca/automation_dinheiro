Dado("que eu queira saber os motivos do ajuste") do
  
end

Quando("realizar uma consulta na api de ajuste") do
  @response = @page.(ReasonListingService).get_reason
end

Então("devo visuzalizar os motivos de ajuste disponiveis") do
  expect(@response.code).to eq(200)
  adhlg = Oracle.new
  reason_oracle = adhlg.find_reason_oracle
  reason_oracle.count.times{|i| expect(@response['adjustmentType'][i]['txtDescription'][0]).to include(reason_oracle[i])}
end