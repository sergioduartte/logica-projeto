module appStore

sig AppStore {
    usuarios: set Usuario,
    aplicativos: set Aplicativo
}

sig Usuario {
  conta: one Conta
}

sig Conta {
  dispositivos: some Dispositivo,
  aplicativosConta: set Aplicativo
}

sig Dispositivo {
  aplicativosInstalados: set Aplicativo
}

sig Aplicativo {}

fact {
  --Garantir que so exista uma AppStore.
  one AppStore
}

fact {
  --Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

fact {
  --Todo dispositivo so pode pertencer a uma conta ao mesmo tempo.
  all d:Dispositivo | one d.~dispositivos
}

fact {
  --O conjunto dos aplicativos de uma conta é igual ao conjunto dos aplicativos
  --dos dispositivos da mesma conta.
  all c:Conta | c.aplicativosConta = c.dispositivos.aplicativosInstalados
}

assert usuarioConta {
  --Todo usuario so pode ter uma conta.
  all u:Usuario | one u.conta

  --Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

assert contaDispositivo {
  --Toda conta tem que ter pelo menos um dispositivo.
  all c:Conta | some c.dispositivos

  --Todo dispositivo so pode pertencer a uma conta.
  all d:Dispositivo | one d.~dispositivos
}

check usuarioConta for 10
check contaDispositivo for 10

pred show[] {}
run show for 10
