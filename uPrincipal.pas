unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uStatus, uCadClientes, uCadProdutos, uCadUnidade, uLancPedidos,
  ACBrBase, ACBrPosPrinter, Buttons, ExtCtrls, pngextra, pngimage, StdCtrls, ComCtrls,
  ACBrSAT, TypInfo, ACBrSATClass, ACBrIntegrador, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, pcnConversao, ActnList, jpeg;

type
  TtelaPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Configuraes1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    LanamentodePedidos1: TMenuItem;
    NFe1: TMenuItem;
    Clientes1: TMenuItem;
    Produtos1: TMenuItem;
    StatusdeServio1: TMenuItem;
    CriareEnviarNFe1: TMenuItem;
    GErarNfe1: TMenuItem;
    ValidarXML1: TMenuItem;
    CancelamentoNFe1: TMenuItem;
    InutilizarNumerao1: TMenuItem;
    Consultas1: TMenuItem;
    ImprimirDanfe1: TMenuItem;
    EnviarDPEC1: TMenuItem;
    EnviarEmailNFe1: TMenuItem;
    Unidade1: TMenuItem;
    Fornecedores1: TMenuItem;
    LanamentodeCompras1: TMenuItem;
    GerarNFeEntrada1: TMenuItem;
    PNGButton1: TPNGButton;
    btnCompra: TPNGButton;
    btnVenda: TPNGButton;
    btnFor: TPNGButton;
    btnCli: TPNGButton;
    Image1: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    StatusBar1: TStatusBar;
    C1: TMenuItem;
    MFe1: TMenuItem;
    btnProd: TPNGButton;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Emitente1: TMenuItem;
    ActionList1: TActionList;
    CEP1: TMenuItem;
    imgLogo: TImage;
    Contador1: TMenuItem;
    Fiscal1: TMenuItem;
    GerarSped1: TMenuItem;
    POS1: TMenuItem;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Relatrios1: TMenuItem;
    Clientes2: TMenuItem;
    Fornecedores2: TMenuItem;
    Produtos2: TMenuItem;
    Inventrio1: TMenuItem;
    ransportadora1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure StatusdeServio1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure LanamentodePedidos1Click(Sender: TObject);
    procedure Unidade1Click(Sender: TObject);
    procedure GErarNfe1Click(Sender: TObject);
    procedure ValidarXML1Click(Sender: TObject);
    procedure CriareEnviarNFe1Click(Sender: TObject);
    procedure CancelamentoNFe1Click(Sender: TObject);
    procedure InutilizarNumerao1Click(Sender: TObject);
    procedure ImprimirDanfe1Click(Sender: TObject);
    procedure EnviarEmailNFe1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure LanamentodeCompras1Click(Sender: TObject);
    procedure GerarNFeEntrada1Click(Sender: TObject);
    procedure PNGButton1Click(Sender: TObject);
    procedure btnCliClick(Sender: TObject);
    procedure btnForClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SAT1Click(Sender: TObject);
    procedure btnCompraClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure MFe1Click(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnProdClick(Sender: TObject);
    procedure Emitente1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CEP1Click(Sender: TObject);
    procedure Contador1Click(Sender: TObject);
    procedure GerarSped1Click(Sender: TObject);
    procedure POS1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Inventrio1Click(Sender: TObject);
    procedure ransportadora1Click(Sender: TObject);


  private
    { Private declarations }

                             
  public
    { Public declarations }

  end;

var
  telaPrincipal: TtelaPrincipal;

implementation

uses uGerarNfe, uDados, uValidaXml, uEnviarNfe, uCancelaNfe, uInutilizaNfe,
  uEmiteDanfe, uEnviaEmail, uCadFornecedor, uLancCompras, uGerarNfeEntrada, XPMan, uConfig,
  uConfigSat, uConfigEmit, uCadCep, uContador, uSped, uCadPos, uInventario,
  uCadTransportadora;

{$R *.dfm}


procedure TtelaPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TtelaPrincipal.StatusdeServio1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaStatus, telaStatus);
  telaStatus.Show;
end;

procedure TtelaPrincipal.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadClientes, telaCadClientes);
  telaCadClientes.Show;
end;

procedure TtelaPrincipal.Produtos1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadProdutos, telaCadProdutos);
  telaCadProdutos.Show;
end;

procedure TtelaPrincipal.LanamentodePedidos1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaLancPedidos, telaLancPedidos);
  telaLancPedidos.Show;
end;

procedure TtelaPrincipal.Unidade1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadUnidade, telaCadUnidade);
  telaCadUnidade.Show;
end;

procedure TtelaPrincipal.GErarNfe1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaGerarNfe, telaGerarNfe);
  telaGerarNfe.Show;
end;

procedure TtelaPrincipal.ValidarXML1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaValidaXml, telaValidaXml);
  telaValidaXml.Show;
end;

procedure TtelaPrincipal.CriareEnviarNFe1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaEnviarNfe, telaEnviarNfe);
  telaEnviarNfe.Show;
end;

procedure TtelaPrincipal.CancelamentoNFe1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCancelaNFe, telaCancelaNFe);
  telaCancelaNFe.Show;
end;

procedure TtelaPrincipal.InutilizarNumerao1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaInutilizaNFe, telaInutilizaNFe);
  telaInutilizaNFe.Show;
end;

procedure TtelaPrincipal.ImprimirDanfe1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaEmiteDanfe, telaEmiteDanfe);
  telaEmiteDanfe.Show;
end;

procedure TtelaPrincipal.EnviarEmailNFe1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaEnviaEmail, telaEnviaEmail);
  telaEnviaEmail.Show;
end;

procedure TtelaPrincipal.Fornecedores1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadFor, telaCadFor);
  telaCadFor.Show;
end;

procedure TtelaPrincipal.LanamentodeCompras1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaLancCompras, telaLancCompras);
  telaLancCompras.Show;
end;

procedure TtelaPrincipal.GerarNFeEntrada1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaGerarNfeEntrada, telaGerarNfeEntrada);
  telaGerarNfeEntrada.Show;
end;

procedure TtelaPrincipal.PNGButton1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TtelaPrincipal.btnCliClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadClientes, telaCadClientes);
  telaCadClientes.Show;
end;

procedure TtelaPrincipal.btnForClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadFor, telaCadFor);
  telaCadFor.Show;
end;

procedure TtelaPrincipal.FormShow(Sender: TObject);
begin
  PNGButton1.Left := telaPrincipal.Width - 83 ;

  StatusBar1.Panels[0].Text := telaConfigEmit.edtRazSoc.Text;
  StatusBar1.Panels[2].Text := DateToStr(Date);
  StatusBar1.Panels[3].Text := TimeToStr(Time);

  if telaDados.sLogoMarca <> '' then begin
    imgLogo.Picture.LoadFromFile(telaDados.sLogoMarca);
  end;

  telaDados.tblClientes.Open;
  telaDados.tblProdutos.Open;
  telaDados.tblPedidos.Open;
  telaDados.tblPedidosItens.Open;
  telaDados.tblUnidade.Open;
  telaDados.tblTributos.Open;
  telaDados.tblEmitente.Open;
  telaDados.tblNCM.Open;
  telaDados.tblConta.Open;
  telaDados.tblCompras.Open;
  telaDados.tblCompraItens.Open;
  telaDados.tblFornecedores.Open;
  telaDados.tblCsosn.Open;
  telaDados.tblCst.Open;
  telaDados.tblEstados.Open;
  telaDados.tblCidades.Open;
  telaDados.tblRuas.Open;
  telaDados.tblBairros.Open;
  telaDados.tblEstoque.Open;
  telaDados.tblPagamento.Open;
  telaDados.tblContador.Open;
  telaDados.tblOrigem.Open;
  telaDados.tblIbpt.Open;
  telaDados.tblPos.Open;

end;

procedure TtelaPrincipal.SAT1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaConfigSat, telaConfigSat);
  telaConfigSat.Show;
end;

procedure TtelaPrincipal.btnCompraClick(Sender: TObject);
begin
  Application.CreateForm(TtelaLancCompras, telaLancCompras);
  telaLancCompras.Show;
end;

procedure TtelaPrincipal.C1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaConfig, telaConfig);
  telaConfig.Show;
  telaDados.tblEmitente.Open;
end;

procedure TtelaPrincipal.MFe1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaConfigSat, telaConfigSat);
  telaConfigSat.Show;
end;

procedure TtelaPrincipal.btnVendaClick(Sender: TObject);
begin
  Application.CreateForm(TtelaLancPedidos, telaLancPedidos);
  telaLancPedidos.Show;
end;

procedure TtelaPrincipal.btnProdClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadProdutos, telaCadProdutos);
  telaCadProdutos.Show;
end;

procedure TtelaPrincipal.Emitente1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaConfigEmit, telaConfigEmit);
  telaConfigEmit.Show;
  telaDados.tblEmitente.Open;
end;

procedure TtelaPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TtelaPrincipal.CEP1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadCep, telaCadCep);
  telaCadCep.Show;
end;

procedure TtelaPrincipal.Contador1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaContador, telaContador);
  telaContador.Show;
end;

procedure TtelaPrincipal.GerarSped1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaSped, telaSped);
  telaSped.Show;
end;

procedure TtelaPrincipal.POS1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadPos, telaCadPos);
  telaCadPos.Show;
end;

procedure TtelaPrincipal.FormCreate(Sender: TObject);
begin

  telaDados.dbClientes.Close;
  telaDados.dbProdutos.Close;
  telaDados.dbPedidos.Close;
  telaDados.dbPedidosItens.Close;
  telaDados.dbUnidade.Close;
  telaDados.dbTributos.Close;
  telaDados.dbEmitente.Close;
  telaDados.dbNCM.Close;
  telaDados.dbConta.Close;
  telaDados.dbCompras.Close;
  telaDados.dbCompraItens.Close;
  telaDados.dbFornecedores.Close;
  telaDados.dbLogin.Close;
  telaDados.dbCsosn.Close;
  telaDados.dbCst.Close;
  telaDados.dbEstados.Close;
  telaDados.dbCidades.Close;
  telaDados.dbRuas.Close;
  telaDados.dbBairros.Close;
  telaDados.dbEstoque.Close;
  telaDados.dbPagamentos.Close;
  telaDados.dbContador.Close;
  telaDados.dbOrigem.Close;
  telaDados.dbIbpt.Close;
  telaDados.dbPos.Close; 

  telaDados.dbClientes.DatabaseName    := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbProdutos.DatabaseName    := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbPedidos.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbPedidosItens.DatabaseName:= telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbUnidade.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbTributos.DatabaseName    := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbEmitente.DatabaseName    := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbNCM.DatabaseName         := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbConta.DatabaseName       := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbCompras.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbCompraItens.DatabaseName := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbFornecedores.DatabaseName:= telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbLogin.DatabaseName       := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbCsosn.DatabaseName       := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbCst.DatabaseName         := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbEstados.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbCidades.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbRuas.DatabaseName        := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbBairros.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbEstoque.DatabaseName     := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbPagamentos.DatabaseName  := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbContador.DatabaseName    := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbOrigem.DatabaseName      := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbIbpt.DatabaseName       := telaDados.sServidor + ':' + telaDados.sPathServer;
  telaDados.dbPos.DatabaseName         := telaDados.sServidor + ':' + telaDados.sPathServer;


  telaDados.dbClientes.Open;
  telaDados.dbProdutos.Open;
  telaDados.dbPedidos.Open;
  telaDados.dbPedidosItens.Open;
  telaDados.dbUnidade.Open;
  telaDados.dbTributos.Open;
  telaDados.dbEmitente.Open;
  telaDados.dbNCM.Open;
  telaDados.dbConta.Open;
  telaDados.dbCompras.Open;
  telaDados.dbCompraItens.Open;
  telaDados.dbFornecedores.Open;
  telaDados.dbLogin.Open;
  telaDados.dbCsosn.Open;
  telaDados.dbCst.Open;
  telaDados.dbEstados.Open;
  telaDados.dbCidades.Open;
  telaDados.dbRuas.Open;
  telaDados.dbBairros.Open;
  telaDados.dbEstoque.Open;
  telaDados.dbPagamentos.Open;
  telaDados.dbContador.Open;
  telaDados.dbOrigem.Open;
  telaDados.dbIbpt.Open;
  telaDados.dbPos.Open;


end;

procedure TtelaPrincipal.SpeedButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TtelaPrincipal.Inventrio1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaInventario, telaInventario);
  telaInventario.Show;
end;

procedure TtelaPrincipal.ransportadora1Click(Sender: TObject);
begin
  Application.CreateForm(TtelaCadTransportadora, telaCadTransportadora);
  telaCadTransportadora.Show;
end;

end.
