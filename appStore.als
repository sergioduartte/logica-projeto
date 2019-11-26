module appStore

sig AppStore {
    usuarios: set Usuario,
    aplicativos: set Aplicativo
}

sig Usuario {
  conta: lone Conta
}

sig Conta {
  dispositivos: some Dispositivo,
  aplicativosConta: set Aplicativo
}

sig Dispositivo {
  versoesDeAplicativosInstalados: set Versao
}

abstract sig Aplicativo {
  versoes: some Versao
}
sig AplicativoPago extends Aplicativo {}
sig AplicativoGratuito extends Aplicativo {}

sig Versao {}



fact appStore {
  --Garantir que so exista uma AppStore.
  one AppStore

  --Todo usuario que tem uma conta precisa pertencer a AppStore.
  Conta.~conta in AppStore.usuarios

  --Se o usuario esta na AppStore, implica dizer que ele tem uma conta.
  all u:Usuario | (u in AppStore.usuarios) => (one u.conta)
}

fact usuarioConta {
  --Toda conta so pode pertencer a um usuario.
  all c:Conta | one c.~conta
}

fact contaDispositivo {
  --Todo dispositivo tem que pertencer a exatamente uma conta.
  all d:Dispositivo | one d.~dispositivos
}

fact aplicativoVersao {
  --Cada versao so pode pertencer a um aplicativo.
  all v:Versao | one v.~versoes
}

fact contaDispositivoVersoes {
  --O conjunto dos aplicativos instalados nos dispositivos esta contido no
  --conjunto dos aplicativos da conta, isso por causa que alguns aplicativos
  --contidos na conta ja podem ter sido desinstalados.
  all c:Conta | c.dispositivos.versoesDeAplicativosInstalados.~versoes in c.aplicativosConta
}



assert usuarioConta {
  --Todo usuario so pode ter uma conta.
  all u:Usuario | lone u.conta

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
run show for 2
