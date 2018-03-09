program StockSYS;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {telaPrincipal},
  uConfig in 'uConfig.pas' {telaConfig},
  uStatus in 'uStatus.pas' {telaStatus},
  uDados in 'uDados.pas' {telaDados},
  uGerarNfe in '..\..\Videos\NF-e com acbr\Projeto\uGerarNfe.pas' {telaGerarNfe},
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
  uLoading in 'uLoading.pas' {telaLoading};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TtelaPrincipal, telaPrincipal);
  Application.CreateForm(TtelaDados, telaDados);
  Application.CreateForm(TtelaEnviaEmail, telaEnviaEmail);
  Application.Run;
end.
