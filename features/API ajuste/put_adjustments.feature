#language:pt

Funcionalidade: PUT ajustes

@atualiza @usuario_correto @sucesso
Esquema do Cenário: Atualizar ajustes de perfil com acesso com status novo
  Dado que eu esteja com o perfil de acesso a criacao
  Quando realizar o put no endpoint alterando o "<campo>" com o "<valor>"
  Entao devo receber status 200
  E API retornando dados corretamente no "<campo>" alterado
  Exemplos:
  |campo               |valor |
  |dataLiberacao       |DATA  |
  |idBandeira          |3     |
  |motivoAjustes       |1     |
  |numeroPedido        |1234  |
  |protocoloAtendimento|VV12  |
  |tipoAjuste          |2     |
  |valorAjuste         |50    |

@atualiza @sucesso
Esquema do Cenário: Atualizar ajustes de perfil com acesso com status reprovado
  Dado que eu esteja com o perfil de acesso a criacao
  Quando o ajuste estiver no status 'REPROVADO'
  E realizar o put alterando o "<campo>" com o "<valor>"
  Entao devo receber status 200
  E API retornando dados corretamente com o "<campo>" alterado
  Exemplos:
  |campo               |valor |
  |dataLiberacao       |DATA  |
  |idBandeira          |3     |          
  |motivoAjustes       |1     |
  |numeroPedido        |1234  |
  |protocoloAtendimento|VV12  |
  |tipoAjuste          |2     |
  |valorAjuste         |50    |

@atualiza @usuario_correto @erro
Esquema do Cenário: Atualizar ajustes de perfil sem acesso com status novo
  Dado que eu esteja com o perfil sem acesso a criacao
  Quando realizar o put no endpoint alterando o "<campo>" com o "<valor>"
  Entao devo receber status 403
  E mensagem de violacao de "Acesso negado"
  Exemplos:
  |campo               |valor|
  |dataLiberacao       |DATA |
  |idBandeira          |3    |
  |motivoAjustes       |1    |
  |numeroPedido        |1234 |
  |protocoloAtendimento|VV12 |
  |tipoAjuste          |2    |
  |valorAjuste         |50   |

@atualiza @erro
Esquema do Cenário: Atualizar ajustes de perfil sem acesso com status reprovado
  Dado que eu esteja com o perfil de acesso a criacao
  Quando o ajuste estiver no status 'REPROVADO'
  E realizar o put alterando o "<campo>" com o "<valor>" com perfil sem acesso
  Entao devo receber status 403
  E mensagem de violacao de "Acesso negado"
  Exemplos:
  |campo               |valor |
  |dataLiberacao       |DATA  |
  |idBandeira          |3     |
  |motivoAjustes       |1     |
  |numeroPedido        |1234  |
  |protocoloAtendimento|VV12  |
  |tipoAjuste          |2     |
  |valorAjuste         |50    |

@usuario_correto @erro @atualiza
Cenário: Atualizar ajustes de perfil com acesso para campos não alteráveis
  Dado que eu esteja com o perfil de acesso a criacao
  Quando realizar o put no endpoint alterando o campo "idLojista" com o valor 4
  Entao devo receber status 200
  E mensagem de violacao "Não é permitido alterar o id do lojista."

@atualiza @usuario_correto @sucesso
Esquema do Cenário: Atualizar ajustes com status REPROVADO para mudar o campo para NOVO
  Dado que eu esteja com o perfil de acesso a criacao
  Quando o ajuste estiver no status 'REPROVADO'
  E realizar o put alterando o "<campo>" com o "<valor>"
  Entao devo receber status 200
  E status atualizado para "NOVO"
  Exemplos:
  |campo     |valor|
  |idBandeira|3    |

@atualiza @erro
Esquema do Cenário: Atualizar ajustes com status diferente de NOVO E REPROVADO
  Dado que eu esteja com o perfil de acesso a criacao
  Quando o ajuste estiver no status "<status>"
  E realizar o put alterando o "<campo>" com o "<valor>"
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |campo     |valor|status                        |mensagem                                                                                                  |
  |idBandeira|3    |EM_APROVACAO                  |Erro ao atualizar o ajuste, é permitido somente altearar ajustes que estão com o status Novo ou Reprovado.|
  |idBandeira|3    |APROVADO                      |Erro ao atualizar o ajuste, é permitido somente altearar ajustes que estão com o status Novo ou Reprovado.|
  |idBandeira|3    |INTEGRADO_COM_O_ARRANJO       |Erro ao atualizar o ajuste, é permitido somente altearar ajustes que estão com o status Novo ou Reprovado.|
  |idBandeira|3    |ERRO_DE_INTEGRAÇÂO_COM_ARRANJO|Erro ao atualizar o ajuste, é permitido somente altearar ajustes que estão com o status Novo ou Reprovado.|
