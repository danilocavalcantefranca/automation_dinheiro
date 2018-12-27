#language: pt

@motivo_ajuste
Funcionalidade: Listar motivos do ajuste

Cenário: Realizar a listagem dos motivos do ajuste
  Dado que eu queira saber os motivos do ajuste
  Quando realizar uma consulta na api de ajuste
  Então devo visuzalizar os motivos de ajuste disponiveis