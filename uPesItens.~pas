unit uPesItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TtelaPesItens = class(TForm)
    Panel1: TPanel;
    btnPesquisa: TSpeedButton;
    editBusca: TEdit;
    cbCategoria: TComboBox;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    btnCadProd: TSpeedButton;
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnCadProdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPesItens: TtelaPesItens;

implementation

uses uDados, uLancItens, uCadProdutos, uPesProduto, uLancPedidos,
  uLancCompras;

{$R *.dfm}

procedure TtelaPesItens.btnPesquisaClick(Sender: TObject);
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

procedure TtelaPesItens.DBGrid1DblClick(Sender: TObject);
var cod : integer;
begin

      cod := DBGrid1.Columns.Items[0].Field.AsInteger;

      telaDados.qryProdutos.Close;
      telaDados.qryProdutos.SQL.Clear;
      telaDados.qryProdutos.SQL.Add('Select * from produtos where id = ');
      telaDados.qryProdutos.SQL.Add(IntToStr(cod));
      telaDados.qryProdutos.Open;

      telaLancItens.Refresh;
          if tipo = 0 then begin
            telaLancPedidos.edtItem.Text := telaDados.qryProdutos.FieldByName('EAN13').AsString;
            telaLancPedidos.edtItem.SetFocus;
          end else begin
            telaLancCompras.edtItem.Text := telaDados.qryProdutos.FieldByName('ID').AsString;
            telaLancCompras.edtItem.SetFocus;
          end;
      telaPesItens.Close;

end;



procedure TtelaPesItens.btnCadProdClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadProdutos, telaCadProdutos);
  telaCadProdutos.Show;
end;

procedure TtelaPesItens.FormShow(Sender: TObject);
begin
cbCategoria.ItemIndex := 1;
end;

procedure TtelaPesItens.editBuscaKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then btnPesquisa.Click;
end;

procedure TtelaPesItens.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var cod : integer;
begin

   if key =#13 then begin

      cod := DBGrid1.Columns.Items[0].Field.AsInteger;

      telaDados.qryProdutos.Close;
      telaDados.qryProdutos.SQL.Clear;
      telaDados.qryProdutos.SQL.Add('Select * from produtos where id = ');
      telaDados.qryProdutos.SQL.Add(IntToStr(cod));
      telaDados.qryProdutos.Open;

      telaLancItens.Refresh;
          if tipo = 0 then begin
            telaLancPedidos.edtItem.Text := telaDados.qryProdutos.FieldByName('EAN13').AsString;
            telaLancPedidos.edtItem.SetFocus;
            telaLancPedidos.IncluirItem;
          end else begin
            telaLancCompras.edtItem.Text := telaDados.qryProdutos.FieldByName('EAN13').AsString;
            telaLancCompras.edtItem.SetFocus;
          end;
      telaPesItens.Close;
   end;
end;

end.
