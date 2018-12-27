#language:pt

Funcionalidade: DELETE ajustes

@deletar @sucesso @usuario_correto
Cenário: Deletar ajustes de perfil com acesso
  Dado que eu esteja com o perfil de acesso a criacao
  Quando realizar o delete no endpoint com o usuario correto
  Entao devo receber status 200
  E dado excluido do banco de dados

@deletar @erro @usuario_correto
Cenário: Deletar ajustes de perfil sem acesso
  Dado que eu esteja com o perfil sem acesso a criacao
  Quando realizar o delete no endpoint com o usuario sem acesso
  Entao devo receber status 403
  E mensagem de violacao de "Acesso negado"

@deletar @sucesso @usuario_correto
Esquema do Cenário: Deletar ajuster com status definidos
  Dado que eu esteja com o perfil de acesso a criacao
  Quando realizar o delete no endpoint com status "<status>"
  Entao devo receber status 200
  E dado excluido do banco de dados
  Exemplos:
  |status    |
  |NOVO      |
  |REPROVADO |

@deletar @erro @usuario_correto
Esquema do Cenário: Não deletar ajuster com status definidos
  Dado que eu esteja com o perfil de acesso a criacao
  Quando realizar o delete no endpoint com status "<status>"
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |status                         |mensagem                                                                                             |
  |EM_APROVACAO                   |Erro ao excluir ajuste, é permitido somente excluir ajustes que estão com o status Novo ou Reprovado.|
  |APROVADO                       |Erro ao excluir ajuste, é permitido somente excluir ajustes que estão com o status Novo ou Reprovado.|
  |INTEGRADO_COM_O_ARRANJO        |Erro ao excluir ajuste, é permitido somente excluir ajustes que estão com o status Novo ou Reprovado.|
  |ERRO_DE_INTEGRAÇÂO_COM_ARRANJO |Erro ao excluir ajuste, é permitido somente excluir ajustes que estão com o status Novo ou Reprovado.|
  |RECUSADO_ARRANJO               |Erro ao excluir ajuste, é permitido somente excluir ajustes que estão com o status Novo ou Reprovado.|
