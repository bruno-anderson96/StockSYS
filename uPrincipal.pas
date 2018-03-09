unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uConfig, uStatus, uCadClientes, uCadProdutos, uCadUnidade, uLancPedidos,
  ACBrBase, ACBrPosPrinter, Buttons, ExtCtrls, pngextra, pngimage;

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
    PNGButton5: TPNGButton;
    PNGButton4: TPNGButton;
    PNGButton3: TPNGButton;
    PNGButton2: TPNGButton;
    Image1: TImage;
    procedure Configuraes1Click(Sender: TObject);
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
    procedure PNGButton2Click(Sender: TObject);
    procedure PNGButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPrincipal: TtelaPrincipal;

implementation

uses uGerarNfe, uDados, uValidaXml, uEnviarNfe, uCancelaNfe, uInutilizaNfe,
  uEmiteDanfe, uEnviaEmail, uCadFornecedor, uLancCompras, uGerarNfeEntrada, XPMan;

{$R *.dfm}


procedure TtelaPrincipal.Configuraes1Click(Sender: TObject);
begin
Application.CreateForm(TtelaConfig, telaConfig);
telaConfig.Show;
telaDados.tblEmitente.Open;
end;

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

procedure TtelaPrincipal.PNGButton2Click(Sender: TObject);
begin
Application.CreateForm(TtelaCadClientes, telaCadClientes);
telaCadClientes.Show;
end;

procedure TtelaPrincipal.PNGButton3Click(Sender: TObject);
begin
Application.CreateForm(TtelaCadFor, telaCadFor);
telaCadFor.Show;
end;

end.
