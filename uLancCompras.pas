unit uLancCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDados, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  Mask, ComCtrls, ActnList;

type
  TtelaLancCompras = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    editId: TDBEdit;
    editDtCad: TDBEdit;
    editDtEmissao: TDBEdit;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    editIdFornecedor: TDBEdit;
    cbFornecedor: TDBLookupComboBox;
    radTpPg: TRadioGroup;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    editValProd: TDBEdit;
    editDesc: TDBEdit;
    editAsc: TDBEdit;
    editOutrasDesp: TDBEdit;
    editVtotal: TDBEdit;
    btnIncItem: TBitBtn;
    btnExcItem: TBitBtn;
    btnFinPed: TBitBtn;
    btnRetPed: TBitBtn;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    btnEncerrar: TBitBtn;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    editEendereco: TDBEdit;
    editEcompl: TDBEdit;
    editEnum: TDBEdit;
    editEbairro: TDBEdit;
    editEcidade: TDBEdit;
    editEuf: TDBEdit;
    editEcep: TDBEdit;
    editEemitente: TDBEdit;
    BitBtn5: TBitBtn;
    ActionList1: TActionList;
    Incluir: TAction;
    Cancelar: TAction;
    Pesquisar: TAction;
    Imprimir: TAction;
    Encerrar: TAction;
    Confirmar: TAction;
    Excluir: TAction;
    procedure IncluirExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure EncerrarExecute(Sender: TObject);
    procedure ConfirmarExecute(Sender: TObject);
    procedure btnIncItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaLancCompras: TtelaLancCompras;

implementation

uses uLancItens;

{$R *.dfm}

procedure TtelaLancCompras.IncluirExecute(Sender: TObject);
var
id: Integer;
d,a,od : Double;
begin
d  := 0.00;
a  := 0.00;
od := 0.00;

telaDados.tblCompras.Open;
telaDados.tblCompras.Last;

{editNumPed.Enabled := true;}
editDtCad.Enabled := true;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := true; {
editHrEmissao.Enabled := true; }
editIdFornecedor.Enabled := true;
cbFornecedor.Enabled := true;
radTpPg.Enabled := true;
{editValProd.Enabled := true;}
editDesc.Enabled := true;
editAsc.Enabled := true;
editOutrasDesp.Enabled := true;
{editVtotal.Enabled := true; }

editEemitente.Enabled := true;
editEendereco.Enabled := true;
editEnum.Enabled := true;
editEcompl.Enabled := true;
editEbairro.Enabled := true;
editEcidade.Enabled := true;
editEuf.Enabled := true;
editEcep.Enabled := true;


btnIncItem.Enabled := true;
btnExcItem.Enabled := true;
btnRetPed.Enabled := true;
btnFinPed.Enabled := true;

btnIncluir.Enabled := false;
btnConfirmar.Enabled := true;
btnCancelar.Enabled := true;

Incluir.Enabled := false;
Confirmar.Enabled := true;
Cancelar.Enabled := true; 

radTpPg.ItemIndex := 0;

editDesc.Text := FloatToStr(d);
editAsc.Text  := FloatToStr(a);
editOutrasDesp.Text := FloatToStr(od);  


        id := telaDados.tblComprasID.asInteger + 1;

        telaDados.tblCompras.Insert;
        telaDados.tblComprasID.Value := id;
        editDtCad.Text := DateToStr(date()) + ' ' +  TimeToStr(time());
        telaLancCompras.Refresh;

        editId.Text := IntToStr(id);


end;

procedure TtelaLancCompras.CancelarExecute(Sender: TObject);
begin
telaDados.tblCompras.Cancel;

{editNumPed.Enabled := false;}
editDtCad.Enabled := false;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := false; {
editHrEmissao.Enabled := true; }
editIdFornecedor.Enabled := false;
cbFornecedor.Enabled := false;
radTpPg.Enabled := false;
{editValProd.Enabled := true;}
editDesc.Enabled := false;
editAsc.Enabled := false;
editOutrasDesp.Enabled := false;
{editVtotal.Enabled := true; }

editEemitente.Enabled := false;
editEendereco.Enabled := false;
editEnum.Enabled := false;
editEcompl.Enabled := false;
editEbairro.Enabled := false;
editEcidade.Enabled := false;
editEuf.Enabled := false;
editEcep.Enabled := false;


btnIncItem.Enabled := false;
btnExcItem.Enabled := false;
btnRetPed.Enabled := false;
btnFinPed.Enabled := false;

btnIncluir.Enabled := true;
btnConfirmar.Enabled := false;
btnCancelar.Enabled := false;

Incluir.Enabled := true;
Confirmar.Enabled := false;
Cancelar.Enabled := false;

telaDados.cdsCTempItens.EmptyDataSet; 


end;

procedure TtelaLancCompras.EncerrarExecute(Sender: TObject);
begin
telaLancCompras.Close;
telaDados.tblCompras.Close;

telaDados.cdsCTempItens.EmptyDataSet;
end;

procedure TtelaLancCompras.ConfirmarExecute(Sender: TObject);
var estoque : integer;
begin

if editDtCad.Text = '' then
 begin
  ShowMessage('Preencha a data de cadastro');
  editDtCad.SetFocus;
  Abort;
 end;
if editDtEmissao.Text = '' then
  begin
    ShowMessage('Preencha a data de emissão');
    editDtEmissao.SetFocus;
    Abort;
  end;
if cbFOrnecedor.Text = '' then
  begin
    ShowMessage('Selecione o Fornecedor');
    cbFornecedor.SetFocus;
    Abort;
  end;
if editValProd.Text = '' then
  begin
   ShowMessage('Selecione ao menos um produto');
   Abort;
  end;

  telaDados.tblCompras.Open;
  telaDados.tblCompras.Edit;
  telaDados.tblComprasFORNECEDOR.value := telaDados.tblComprasnFor.Value;
  telaDados.tblCompras.Post;

  {editNumPed.Enabled := false;}
  editDtCad.Enabled := false;{
  editHrCad.Enabled := false; }
  editDtEmissao.Enabled := false; {
  editHrEmissao.Enabled := false; }
  editIdFornecedor.Enabled := false;
  cbFornecedor.Enabled := false;
  radTpPg.Enabled := false;
  editValProd.Enabled := false;
  editDesc.Enabled := false;
  editAsc.Enabled := false;
  editOutrasDesp.Enabled := false;
  editVtotal.Enabled := false;

  editEemitente.Enabled := false;
  editEendereco.Enabled := false;
  editEnum.Enabled := false;
  editEcompl.Enabled := false;
  editEbairro.Enabled := false;
  editEcidade.Enabled := false;
  editEuf.Enabled := false;
  editEcep.Enabled := false;

  btnIncItem.Enabled := false;
  btnExcItem.Enabled := false;
  btnRetPed.Enabled := false;
  btnFinPed.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;

  Incluir.Enabled := true;
  Confirmar.Enabled := false;
  Cancelar.Enabled := false;

  telaDados.cdsCTempItens.First;
  while not (telaDados.cdsCTempItens.Eof) do
  begin

    telaDados.tblCompraItens.Append;

    telaDados.tblCompraItens.FieldByName('DESCRICAO').Value :=
      telaDados.cdsCTempItens.FieldByName('DESCRICAO').Value;

    telaDados.tblCompraItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.cdsCTempItens.FieldByName('ID_PRODUTO').Value;

    telaDados.tblCompraItens.FieldByName('ID_COMPRA').Value :=
      telaDados.cdsCTempItens.FieldByName('ID_COMPRA').Value;

    telaDados.tblCompraItens.FieldByName('VALOR').Value :=
      telaDados.cdsCTempItens.FieldByName('VALOR').Value;

    telaDados.tblCompraItens.FieldByName('QUANTIDADE').Value :=
      telaDados.cdsCTempItens.FieldByName('QUANTIDADE').Value;

    telaDados.tblProdutos.Open;
    telaDados.tblProdutos.Edit;

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS where ID = ');
    telaDados.qryProdutos.SQL.Add(telaDados.cdsCTempItens.FieldByName('ID_PRODUTO').AsString);
    estoque := telaDados.tblProdutosESTOQUE.AsInteger + telaDados.cdsCTempItens.FieldByName('QUANTIDADE').AsInteger;
    telaDados.qryProdutos.Open; 

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Update PRODUTOS set ESTOQUE = :pDados Where ID = ');
    telaDados.qryProdutos.SQL.Add(telaDados.cdsCTempItens.FieldByName('ID_PRODUTO').AsString);
    telaDados.qryProdutos.Params.ParamByName('pDados').AsInteger := estoque;
    telaDados.qryProdutos.Open;

    telaDados.tblProdutos.FieldByName('ESTOQUE').Value := telaDados.tblProdutos.FieldByName('ESTOQUE').Value +
      telaDados.cdsCTempItens.FieldByName('QUANTIDADE').Value;

    telaDados.tblProdutos.Close;

    telaDados.tblCompraItens.FieldByName('DESCONTO').Value :=
      telaDados.cdsCTempItens.FieldByName('DESCONTO').Value;

    telaDados.tblCompraItens.FieldByName('ACRESCIMO').Value :=
      telaDados.cdsCTempItens.FieldByName('ACRESCIMO').Value;

    telaDados.tblCompraItens.FieldByName('VALOR_TOTAL').Value :=
      telaDados.cdsCTempItens.FieldByName('VALOR_TOTAL').Value;

      telaDados.tblCompraItens.Post;
      telaDados.cdsCTempItens.Delete;

  end;

  telaDados.tblCompraItens.ApplyUpdates;
  telaDados.tblProdutos.Close;

end;

procedure TtelaLancCompras.btnIncItemClick(Sender: TObject);
begin
Application.CreateForm(TtelaLancItens, telaLancItens);
telaLancItens.Show;
telaLancItens.pegaTipo(1);
telaLancItens.Hide;
telaLancItens.Show;
end;

end.
