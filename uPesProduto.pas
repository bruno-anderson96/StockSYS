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
    procedure editBuscaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPesProduto: TtelaPesProduto;

implementation

uses uCadProdutos, uLancItens, DB;

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
    0: telaDados.qryProdutos.SQL.Add('EAN13 = :pDados');
    1: telaDados.qryProdutos.SQL.Add('ID = :pDados');
    2: telaDados.qryProdutos.SQL.Add('DESCRICAO like :pDados');
    3: telaDados.qryProdutos.SQL.Add('CODIGO_NCM like :pDados');
  end;

  case cbCategoria.ItemIndex of
    0: telaDados.qryProdutos.Params.ParamByName('pDados').AsString := editBusca.Text + '%';
    1: telaDados.qryProdutos.Params.ParamByName('pDados').asInteger := StrToInt(editBusca.Text);
    2: telaDados.qryProdutos.Params.ParamByName('pDados').asString := editBusca.Text + '%';
    3: telaDados.qryProdutos.Params.ParamByName('pDados').AsString := editBusca.Text;
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

  if Length(telaDados.tblProdutosEAN13.Value) >12  then begin
    telaDados.GeraBarrasEAN13(telaCadProdutos.editEan.Text, telaCadProdutos.Image1.Canvas);
   end;

    if telaDados.tblProdutosID_TRIB.AsString <> '' then begin
      telaDados.qryTributos.Close;
      telaDados.qryTributos.SQL.Clear;
      telaDados.qryTributos.SQL.Add('Select * from TRIBUTO where id = ');
      telaDados.qryTributos.SQL.Add(telaDados.tblProdutosID_TRIB.AsString);
      telaDados.qryTributos.Open;

      telaCadProdutos.cbTrib.ItemIndex := telaDados.qryTributos.FieldByName('ID').AsInteger ;

    end else begin
      telaCadProdutos.cbTrib.ItemIndex := -1;
    end;

   if telaDados.tblProdutosID_CSOSN.AsString <> '' then begin
    telaDados.qryCsosn.Close;
    telaDados.qryCsosn.SQL.Clear;
    telaDados.qryCsosn.SQL.Add('Select * from CSOSN where id = ');
    telaDados.qryCsosn.SQL.Add(telaDados.tblProdutosID_CSOSN.AsString);
    telaDados.qryCsosn.Open;
    telaCadProdutos.cbCsosn.ItemIndex := telaDados.qryCsosn.FieldByName('ID').Value ;
   end else begin
    telaCadProdutos.cbCsosn.ItemIndex := -1;
   end;

   if telaDados.tblProdutosID_CST.AsString <> '' then begin
    telaDados.qryCst.Close;
    telaDados.qryCst.SQL.Clear;
    telaDados.qryCst.SQL.Add('Select * from CST where id =');
    telaDados.qryCst.SQL.Add(telaDados.tblProdutosID_CST.AsString);
    telaDados.qryCst.Open;
    telaCadProdutos.cbCst.ItemIndex := telaDados.qryCst.FieldByName('ID').Value ;
   end else begin
    telaCadProdutos.cbCst.ItemIndex := -1;
   end;

   if telaDados.tblProdutosID_ORIGEM.AsString <> '' then begin
    telaDados.qryOrigem.Close;
    telaDados.qryOrigem.SQL.Clear;
    telaDados.qryOrigem.SQL.Add('Select * from ORIGEM where id =');
    telaDados.qryOrigem.SQL.Add(telaDados.tblProdutosID_ORIGEM.AsString);
    telaDados.qryOrigem.Open;
    telaCadProdutos.cbOrigem.ItemIndex := telaDados.qryOrigem.FieldByName('ID').AsInteger;
   end else begin
    telaCadProdutos.cbOrigem.ItemIndex := -1;
   end;
  telaCadProdutos.Excluir.Enabled := true;

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

procedure TtelaPesProduto.editBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then btnPesquisa.Click;
end;

end.
