# App Store (Alloy e NuSMV)

Em uma loja online de aplicativos para celular, o usuário pode ter uma conta, e vários aplicativos associados. Um aplicativo associado ao usuário já foi instalado pelo menos uma vez em um dispositivo do usuário (o usuário pode ter mais de um dispositivo).

O aplicativo associado, neste caso, pode ter o status de instalado ou não. Um aplicativo pode ter várias versões, e apenas uma destas versões está instalada em um determinado momento. O usuário pode atualizar a versão caso a instalada não seja a mais recente. Usuários podem instalar, atualizar ou remover aplicativos de seus dispositivos, no entanto não podem apagar a associação com um aplicativo. Todas as operações de instalação de aplicativos é dependente do espaço disponível no celular.

Aplicativos podem ser pagos ou gratuitos - caso sejam pagos, o usuário precisa usar seus créditos na conta - se não houver crédito suficiente, ele precisa fazer a recarga.

## Especificação
- Um **Usuário** pode ter uma conta
- Um **Usuário** pode instalar, atualizar ou remover aplicativos de seus dispositivos, no entanto não podem apagar a associação com um aplicativo

- Um ou mais **Aplicativos** podem ser associados a um usuário
  - Um **Aplicativo** que foi associado a um usuario foi instalado pelo menos uma vez em um **Dispositivo**
  - Um **Aplicativo** possui o status de instalado ou não
  - Um **Aplicativo** pode ter várias versões, e apenas uma delas está instalada em um determinado momento
  - Um **Aplicativo** pode ser atualizado caso a versão instalada não seja a mais recente
  - Um **Aplicativo** só pode ser instalado caso exista espaço disponível no dispositivo
  - Um **Aplicativo** pode ser pago ou gratuito
    - Caso um **Aplicativo** seja pago, o **Usuário** precisa usar seus créditos na conta
    - Caso um **Usuário** não tenha créditos na **Conta**, ele precisa fazer uma recarga

- Um ou mais **Dispositivos** podem ser associados a uma conta

## Links úteis
* http://disi.unitn.it/~agiordani/fm/L5/main.pdf
