module appStore

sig Usuario {
  conta: one Conta
}

sig Conta {
  dispositivos: some Dispositivo,
  aplicativosConta: set Aplicativo
}

sig Dispositivo {}

sig Aplicativo {}

fact {
  --Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

fact {
  --Todo dispositivo so pode pertencer a uma conta ao mesmo tempo.
  all d:Dispositivo | one d.~dispositivos
}

assert usuarioConta {
  --Todo usuario so pode ter uma conta.
  all u:Usuario | one u.conta

  --Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

assert contaDispositivo {
  -- Toda conta tem que ter pelo menos um dispositivo.
  all c:Conta | some c.dispositivos

  -- Todo dispositivo so pode pertencer a uma conta.
  all d:Dispositivo | one d.~dispositivos
}

check usuarioConta for 10
check contaDispositivo for 10

pred show[] {}
run show for 5
