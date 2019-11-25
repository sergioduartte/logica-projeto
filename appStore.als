module appStore

sig Usuario {
  conta: one Conta
}

sig Conta {
  aplicativosConta: set Aplicativo
}

sig Aplicativo {}

fact {
  -- Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

assert usuarioConta {
  -- Todo usuario so pode ter uma conta.
  all u:Usuario | one u.conta
  -- Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

check usuarioConta for 10

pred show[] {}
run show for 5
