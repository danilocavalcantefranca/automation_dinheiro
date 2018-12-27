#language: pt

Funcionalidade: Realizar ajuste massivo

Esquema do Cenário: Verificar campos da planilha
  Dado que eu esteja com o perfil "<perfil_de_acesso>"
  Quando realizar a importacao da planilha
  Então devo verificar que ela possui os campos corretos
Exemplos:
  |perfil_de_acesso | 
  |gestão SCM       |

Esquema do Cenário: Realizar importação da planilha para o ajuste massivo
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha
  Então devo visualizar o status code 201
  E que os ajustes foram criados com status "NOVO"
Exemplos:
  |perfil_de_acesso | 
  |gestão SCM       |

Esquema do Cenário: Realizar importação da planilha para o ajuste massivo de vários lojistas
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha
  Então devo ter realizado as validacoes
  E a planilha deve possuir ajuste de diversos lojistas
Exemplos:
  |perfil_de_acesso | 
  |gestão SCM       |

Esquema do Cenário: Realizar importação da planilha com formato valido
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha com formato "csv"
  Então devo ter realizado as validacoes
Exemplos:
  |perfil_de_acesso | 
  |gestão SCM       |

Esquema do Cenário: Realizar importação da planilha com formato invalido
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha com formato "xlsx"
  Então devo visualizar o status code 400
  E nao deve ter criado os ajustes da planilha
Exemplos:
  |perfil_de_acesso | 
  |gestão SCM       |

Esquema do Cenário: Realizar importação da planilha com dados inválidos
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha com dados inválido
  Então devo visualizar os erros
  E deve mostrar qual linha ocorreu o erro
Exemplos:
  |perfil_de_acesso | 
  |gestão SCM       |

Esquema do Cenário: Validação de perfil sem acesso
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha
  Entao devo receber status code 200
  E "<mensagem>" de violacao
  Exemplos:
  |perfil_de_acesso|mensagem|
  |                |        |

Esquema do Cenário: Realizar importação da planilha com campos nulos
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha com campo "<campo>" nulo
  Então devo visualizar os erros
  E deve mostrar qual linha ocorreu o erro
Exemplos:
  |perfil_de_acesso |campo            |
  |gestão SCM       |idLojista        |
  |gestão SCM       |idCompraBandeira |
  |gestão SCM       |data             |
  |gestão SCM       |tipoAjuste       |
  |gestão SCM       |valorAjuste      |
  |gestão SCM       |motivoAjuste     |
  |gestão SCM       |idPedido         |
  |gestão SCM       |protocolo        |

Esquema do Cenário: Realizar importação da planilha com campos vazios
  Dado que eu esteja com o perfil "perfil_de_acesso"
  Quando realizar a importacao da planilha com campo "<campo>" vazio
  Então devo visualizar os erros
  E deve mostrar qual linha ocorreu o erro
Exemplos:
  |perfil_de_acesso |campo            |
  |gestão SCM       |idLojista        |
  |gestão SCM       |idCompraBandeira |
  |gestão SCM       |data             |
  |gestão SCM       |tipoAjuste       |
  |gestão SCM       |valorAjuste      |
  |gestão SCM       |motivoAjuste     |
  |gestão SCM       |idPedido         |
  |gestão SCM       |protocolo        |