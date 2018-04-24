unit uPesProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, uDados;

type
  TtelaPesProduto = class(TForm)
    Panel1: TPanel;
    btnPesquisa: TSpeedButton;
    editBusca: TEdit;
    cbCategoria: TComboBox;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadProdClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPesProduto: TtelaPesProduto;

implementation

uses uCadProdutos, uLancItens;

{$R *.dfm}

procedure TtelaPesProduto.btnPesquisaClick(Sender: TObject);
begin
 if editBusca.Text = '' then
  begin
    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('select * from Produtos');
    telaDados.qryProdutos.Open;
  end else
  begin
    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Select * from Produtos Where');

  case cbCategoria.ItemIndex of
    0: telaDados.qryProdutos.SQL.Add('ID = :pDados');
    1: telaDados.qryProdutos.SQL.Add('DESCRICAO like :pDados');
    2: telaDados.qryProdutos.SQL.Add('CODIGO_NCM like :pDados');
  end;

  case cbCategoria.ItemIndex of
    0: telaDados.qryProdutos.Params.ParamByName('pDados').asInteger := StrToInt(editBusca.Text);
    1: telaDados.qryProdutos.Params.ParamByName('pDados').asString := editBusca.Text + '%';
    2: telaDados.qryProdutos.Params.ParamByName('pDados').AsString := editBusca.Text;
  end;


  telaDados.qryProdutos.Open;
  end;
end;

procedure TtelaPesProduto.FormShow(Sender: TObject);
begin
cbCategoria.ItemIndex := 1;
end;

procedure TtelaPesProduto.DBGrid1DblClick(Sender: TObject);
var num : integer;
begin

    
 num := DBGrid1.Columns.Items[0].Field.AsInteger;


  telaDados.tblProdutos.Locate('ID', num , []);

  telaDados.GeraBarrasEAN13(telaCadProdutos.editEan.Text, telaCadProdutos.Image1.Canvas);



  telaPesProduto.Close;

end;

procedure TtelaPesProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  telaCadProdutos.Show;
end;

procedure TtelaPesProduto.btnCadProdClick(Sender: TObject);
begin
Application.CreateForm(TtelaCadProdutos, telaCadProdutos);
telaCadProdutos.Show;
end;

end.
