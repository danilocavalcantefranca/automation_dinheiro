#language:pt

@ajuste 
Funcionalidade: Post de criação de ajustes
@criacao @abestado
Cenário: Validação de perfil com acesso
  Dado que eu esteja com o perfil de acesso a criacao
  E envie o json com os dados
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E o dado deve ser gravado no banco de dados com status "NOVO"

@criacao @erro
Esquema do Cenário: Validação de perfil sem acesso
  Dado que eu esteja com o perfil sem acesso a criacao
  E envie o json com os dados
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 403
  E mensagem de violacao de "Acesso negado"
  Exemplos:
  |mensagem     |
  |Acesso negado|

@criacao @erro
Esquema do Cenário: Validar campos do json sem preenchimento
  Dado que eu esteja com o perfil de acesso a criacao
  E passe o campo "<campo>" no json sem preenchimento
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E <mensagem> de violacao
  Exemplos:
  |campo               |mensagem                                                          |
  |idBandeira          |'idBandeira não pode ser nulo ou menor do que 0.'                 |
  |idLojista           |'Lojista não encontrado'                                          |
  |motivoAjustes       |'Motivo do ajuste é obrigatório'                                  |
  |numeroPedido        |'Precisa ter o id do Pedido ou o Protocolo de Atendimento.'       |
  |protocoloAtendimento|'Precisa ter o id do Pedido ou o Protocolo de Atendimento.'       |
  |tipoAjuste          |'Tipo do ajuste é obrigatório e não pode ser diferente de 1 ou 2.'|
  |valorAjuste         |'Valor do Ajuste não pode estar vazio.'                           |

@criacao @sucesso
Esquema do Cenário: Validar tipos de transacao validos
  Dado que eu esteja com o perfil de acesso a criacao
  E crie um ajuste passando o tipo do pagamento com o id "<id_do_pagamento_valido>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E o dado deve ser gravado no banco de dados com status "NOVO"
  Exemplos:
  |id_do_pagamento_valido|
  |1                     |
  |2                     |

@criacao @erro
Esquema do Cenário: Validar tipos de transacao invalidos
  Dado que eu esteja com o perfil de acesso a criacao
  E crie um ajuste passando o tipo do pagamento com o id "<id_do_pagamento_invalido>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E <mensagem> de violacao
  Exemplos:
  |id_do_pagamento_invalido|mensagem                                                          |
  |3                       |'Tipo do ajuste é obrigatório e não pode ser diferente de 1 ou 2.'|
  |5                       |'Tipo do ajuste é obrigatório e não pode ser diferente de 1 ou 2.'|
  |10                      |'Tipo do ajuste é obrigatório e não pode ser diferente de 1 ou 2.'|

@criacao @sucesso
Esquema do Cenário: Validar ajustes vinculados a um pedido
  Dado que eu esteja com o perfil de acesso a criacao
  E que eu crie um ajuste passando um numero de pedido valido "<numero_de_pedido>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E o dado deve ser gravado no banco de dados com status "NOVO"
  Exemplos:
  |numero_de_pedido|
  |1021454587      |
  |45896555        |

@criacao @erro
Esquema do Cenário: Validar ajustes vinculados a um pedido invalido
  Dado que eu esteja com o perfil de acesso a criacao
  E crie um ajuste passando um numero de pedido inválido "<numero_de_pedido_invalido>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E <mensagem> de violacao
  Exemplos:
  |numero_de_pedido_invalido|mensagem                                            |
  |asd                      |'JSON parse error: Cannot deserialize value of type'|
  |!@$                      |'JSON parse error: Cannot deserialize value of type'|

@criacao @sucesso
Esquema do Cenário: Validar ajustes vinculados a um protocolo
  Dado que eu esteja com o perfil de acesso a criacao
  E crie um ajuste passando um protocolo valido "<numero_de_protocolo>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E o dado deve ser gravado no banco de dados com status "NOVO"
  Exemplos:
  |numero_de_protocolo|
  |123ETRF12          |
  |PROTOCOLO123       |

@criacao @erro
Esquema do Cenário: Validar motivos invalido
  Dado que eu esteja com o perfil de acesso a criacao
  E crie um ajuste passando um motivo invalido "<invalido>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E <mensagem> de violacao
  Exemplos:
  |invalido|mensagem                                                                |
  |50      |'Motivo não existe na base'                                             |
  |asd     |'JSON parse error: Cannot deserialize value of type `java.lang.Integer`'|

@criacao @sucesso
Esquema do Cenário: Validar motivos valido
  Dado que eu esteja com o perfil de acesso a criacao
  E crie um ajuste passando um motivo valido "<valido>"
  Quando realizar o post de criacao do ajuste
  Entao devo receber status 200
  E o dado deve ser gravado no banco de dados com status "NOVO"
  Exemplos:
  |valido|
  |5     |
  |10    |
  |15    |
  |20    |