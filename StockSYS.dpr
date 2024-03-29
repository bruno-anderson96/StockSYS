program StockSYS;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {telaPrincipal},
  uConfig in 'uConfig.pas' {telaConfig},
  uStatus in 'uStatus.pas' {telaStatus},
  uDados in 'uDados.pas' {telaDados},
  uGerarNfe in 'uGerarNfe.pas' {telaGerarNfe},
  uCadProdutos in 'uCadProdutos.pas' {telaCadProdutos},
  uCadClientes in 'uCadClientes.pas' {telaCadClientes},
  uLancItens in 'uLancItens.pas' {telaLancItens},
  uCadUnidade in 'uCadUnidade.pas' {telaCadUnidade},
  uLancPedidos in 'uLancPedidos.pas' {telaLancPedidos},
  uPesNCM in 'uPesNCM.pas' {telaPesNCM},
  uPesCliente in 'uPesCliente.pas' {telaPesCliente},
  uPesProduto in 'uPesProduto.pas' {telaPesProduto},
  uLogin in 'uLogin.pas' {telaLogin},
  uValidaXml in 'uValidaXml.pas' {telaValidaXml},
  uEnviarNfe in 'uEnviarNfe.pas' {telaEnviarNfe},
  uCancelaNfe in 'uCancelaNfe.pas' {telaCancelaNFe},
  uInutilizaNfe in 'uInutilizaNfe.pas' {telaInutilizaNfe},
  uEmiteDanfe in 'uEmiteDanfe.pas' {telaEmiteDanfe},
  uEnviaEmail in 'uEnviaEmail.pas' {telaEnviaEmail},
  uPesItens in 'uPesItens.pas' {telaPesItens},
  uCadFornecedor in 'uCadFornecedor.pas' {telaCadFor},
  uLancCompras in 'uLancCompras.pas' {telaLancCompras},
  uPesFornecedor in 'uPesFornecedor.pas' {telaPesFor},
  uGerarNfeEntrada in 'uGerarNfeEntrada.pas' {telaGerarNfeEntrada},
  uLoading in 'uLoading.pas' {telaLoading},
  uConfigSat in 'uConfigSat.pas' {telaConfigSat},
  configuraserial in 'configuraserial.pas',
  uConfigEmit in 'uConfigEmit.pas' {telaConfigEmit},
  uCadEmit in 'uCadEmit.pas' {telaCadEmit},
  uCadCep in 'uCadCep.pas' {telaCadCep},
  uSped in 'uSped.pas' {telaSped},
  uContador in 'uContador.pas' {telaContador},
  uCadPos in 'uCadPos.pas' {telaCadPos},
  uPreviewCfe in 'uPreviewCfe.pas' {telaPreviewCfe},
  uInventario in 'uInventario.pas' {telaInventario},
  urInventario in 'urInventario.pas' {rInventario},
  uCadTransportadora in 'uCadTransportadora.pas' {telaCadTransportadora},
  uPesTransportadora in 'uPesTransportadora.pas' {telaPesTransportadora};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'StockSYS';
  Application.CreateForm(TtelaLogin, telaLogin);
  Application.CreateForm(TtelaDados, telaDados);
  Application.CreateForm(TtelaConfig, telaConfig);
  Application.CreateForm(TtelaPrincipal, telaPrincipal);
  Application.CreateForm(TtelaEnviaEmail, telaEnviaEmail);
  Application.CreateForm(TtelaConfigSat, telaConfigSat);
  Application.CreateForm(TtelaGerarNfe, telaGerarNfe);
  Application.CreateForm(TtelaConfigEmit, telaConfigEmit);
  Application.Run;

end.
