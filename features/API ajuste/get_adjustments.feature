#language:pt

Funcionalidade: GET de ajustes
@not_done
Cenário: Validar perfis com acesso a visualização de dados
  Dado que eu esteja com o perfil de acesso a criacao
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados corretamente

@not_done
Cenário: Validar perfis sem acesso a visualização de dados
Dado que eu esteja com o perfil sem acesso a criacao
Quando realizar o get no endpoint
Entao devo receber status 403
E mensagem de violacao "Acesso negado"

@not_done
Cenário: Validar retorno dos dados consultando por um lojista
Dado que eu esteja com o perfil de acesso a criacao
E consulte pelo lojista 3
Entao devo receber status 200
E API retornando dados referente ao lojista 3

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por um lojista invalido
Dado que eu esteja com o perfil de acesso a criacao
E esteja consultando por um lojista "<lojista_invalido>"
Entao devo receber status 400
E "<mensagem>" de violacao
Exemplos:
|lojista_invalido|mensagem                                                                            |
|asd             |Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'|
|!               |Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'|

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por uma data
Dado que eu esteja consultando por uma data "<data_valida>"
Quando realizar o get no endpoint
Entao devo receber status 200
E API retornando dados de acordo com a data informada
Exemplos:
|data_valida|
|           |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por uma data invalida
  Dado que eu esteja consultando por uma data "<data_invalida>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |data_invalida|mensagem|
  |             |        |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por status
  Dado que eu esteja consultando por um status "<status_valido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados de acordo com o status informado
  Exemplos:
  |status_valido|
  |             |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por status invalido
  Dado que eu esteja consultando por um status "<status_invalido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |status_invalido|
  |               |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por tipo
  Dado que eu esteja consultando por um tipo "<tipo_valido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados de acordo com o tipo informado
  Exemplos:
  |tipo_valido|
  |           |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por tipo invalido
  Dado que eu esteja consultando por um tipo "<tipo_invalido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |tipo_invalido|mensagem|
  |             |        |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por motivo
  Dado que eu esteja consultando por um tipo "<motivo_valido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados de acordo com o motivo informado
  Exemplos:
  |motivo_valido|
  |             |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por motivo invalido
  Dado que eu esteja consultando por um tipo "<motivo_invalido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |motivo_invalido|mensagem|
  |               |        |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por pedido
  Dado que eu esteja consultando por um tipo "<pedido_valido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados de acordo com o pedido
  Exemplos:
  |pedido_valido|
  |             |
@not_done
Esquema do Cenário: Validar retorno dos dados consultando por pedido invalido
  Dado que eu esteja consultando por um tipo "<pedido_invalido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |pedido_invalido|mensagem|
  |               |        |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por protocolo
  Dado que eu esteja consultando por um tipo "<protocolo_valido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados de acordo com o protocolo
  Exemplos:
  |protocolo_valido|
  |                |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por protocolo invalido
  Dado que eu esteja consultando por um tipo "<protocolo_invalido>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |protocolo_invalido|mensagem|
  |                  |        |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por bandeira
  Dado que eu esteja consultando por um tipo "<bandeira_valida>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E API retornando dados de acordo com a bandeira
  Exemplos:
  |bandeira_valida|
  |               |

@not_done
Esquema do Cenário: Validar retorno dos dados consultando por bandeira invalido
  Dado que eu esteja consultando por um tipo "<bandeira_invalida>"
  Quando realizar o get no endpoint
  Entao devo receber status 200
  E "<mensagem>" de violacao
  Exemplos:
  |bandeira_invalida|mensagem|
  |                 |        |
