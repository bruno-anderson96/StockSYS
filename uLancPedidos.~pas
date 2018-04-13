unit uLancPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDados, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, ComCtrls,
  Mask, DBCtrls, uLancItens, ActnList, ActnMan, ActnColorMaps;

type
  TtelaLancPedidos = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gbCli: TGroupBox;
    GroupBox4: TGroupBox;
    btnIncItem: TBitBtn;
    btnExcItem: TBitBtn;
    TabSheet2: TTabSheet;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    editEendereco: TDBEdit;
    Label2: TLabel;
    editEcompl: TDBEdit;
    Label3: TLabel;
    editEnum: TDBEdit;
    Label4: TLabel;
    editEbairro: TDBEdit;
    Label5: TLabel;
    editEcidade: TDBEdit;
    Label6: TLabel;
    editEuf: TDBEdit;
    Label7: TLabel;
    editEcep: TDBEdit;
    Label8: TLabel;
    editEcliente: TDBEdit;
    BitBtn5: TBitBtn;
    Label9: TLabel;
    editId: TDBEdit;
    Label11: TLabel;
    Label13: TLabel;
    editIdCliente: TDBEdit;
    Label15: TLabel;
    editValProd: TDBEdit;
    Label16: TLabel;
    editDesc: TDBEdit;
    Label17: TLabel;
    editAsc: TDBEdit;
    Label18: TLabel;
    editOutrasDesp: TDBEdit;
    Label19: TLabel;
    editVtotal: TDBEdit;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    btnEncerrar: TBitBtn;
    DBGrid1: TDBGrid;
    Label20: TLabel;
    cbCliente: TDBLookupComboBox;
    editDtCad: TDBEdit;
    editDtEmissao: TDBEdit;
    ActionList1: TActionList;
    Incluir: TAction;
    Cancelar: TAction;
    Pesquisar: TAction;
    Imprimir: TAction;
    Encerrar: TAction;
    Confirmar: TAction;
    Excluir: TAction;
    cbTpPg: TComboBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    btnIncluir: TBitBtn;
    StatusBar1: TStatusBar;
    adicionarItem: TAction;
    radDoc: TRadioGroup;
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnIncItemClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EncerrarExecute(Sender: TObject);
    procedure IncluirExecute(Sender: TObject);
    procedure ConfirmarExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure editDescExit(Sender: TObject);
    procedure editAscExit(Sender: TObject);
    procedure editOutrasDespExit(Sender: TObject);
    procedure adicionarItemExecute(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);

  private
    procedure calculaPedido();
    { Private declarations }
  public
    { Public declarations }

  end;

var
  telaLancPedidos: TtelaLancPedidos;



implementation

uses DB,uConfigSat, uGerarNfe;

{$R *.dfm}

procedure TtelaLancPedidos.btnEncerrarClick(Sender: TObject);
begin
telaLancPedidos.Close;
telaDados.tblPedidos.Close;

telaDados.cdsTempItens.EmptyDataSet;

end;

procedure TtelaLancPedidos.btnIncItemClick(Sender: TObject);
begin
Application.CreateForm(TtelaLancItens, telaLancItens);
telaLancItens.Show;
telaLancItens.pegaTipo(0);
end;

procedure TtelaLancPedidos.btnIncluirClick(Sender: TObject);
var
id: Integer;
d,a,od : Double;
begin
d  := 0.00;
a  := 0.00;
od := 0.00;

telaDados.tblPedidos.Last;

{editNumPed.Enabled := true;}
editDtCad.Enabled := true;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := true; {
editHrEmissao.Enabled := true; }
editIdCliente.Enabled := true;
cbCliente.Enabled := true;
cbTpPg.Enabled := true;
{editValProd.Enabled := true;}
editDesc.Enabled := true;
editAsc.Enabled := true;
editOutrasDesp.Enabled := true;
{editVtotal.Enabled := true; }

editEcliente.Enabled := true;
editEendereco.Enabled := true;
editEnum.Enabled := true;
editEcompl.Enabled := true;
editEbairro.Enabled := true;
editEcidade.Enabled := true;
editEuf.Enabled := true;
editEcep.Enabled := true;


btnIncItem.Enabled := true;
btnExcItem.Enabled := true;


btnIncluir.Enabled := false;
btnConfirmar.Enabled := true;
btnCancelar.Enabled := true;

cbTpPg.ItemIndex := 0;

editDesc.Text := FloatToStr(d);
editAsc.Text  := FloatToStr(a);
editOutrasDesp.Text := FloatToStr(od);


         
                  {

        if editId.Text = ''  then begin
          id := 0;
        end else begin
          id := StrToInt(editId.Text) +1;
        end;

        }
        id := telaDados.tblPedidosID.asInteger + 1;

        telaDados.tblPedidos.Insert;
        telaDados.tblPedidosID.Value := id;
        telaLancPedidos.Refresh;
                                            {
        telaDados.tblPedidosID.Value := id;
        telaDados.tblPedidos.Refresh;
        telaDados.tblPedidos.ApplyUpdates; } 
      

        editId.Text := IntToStr(id);

end;

procedure TtelaLancPedidos.btnConfirmarClick(Sender: TObject);
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
if cbCliente.Text = '' then
  begin
    ShowMessage('Selecione o cliente');
    cbCliente.SetFocus;
    Abort;
  end;
if editValProd.Text = '' then
  begin
   ShowMessage('Selecione ao menos um produto');
   Abort;
  end;


  telaDados.tblPedidos.Open;
  telaDados.tblPedidos.Edit;
  telaDados.tblPedidosCLIENTE.value := telaDados.tblPedidosnCli.Value;
  telaDados.tblPedidos.Post;

  {editNumPed.Enabled := false;}
  editDtCad.Enabled := false;{
  editHrCad.Enabled := false; }
  editDtEmissao.Enabled := false; {
  editHrEmissao.Enabled := false; }
  editIdCliente.Enabled := false;
  cbCliente.Enabled := false;
  cbTpPg.Enabled := false;
  editValProd.Enabled := false;
  editDesc.Enabled := false;
  editAsc.Enabled := false;
  editOutrasDesp.Enabled := false;
  editVtotal.Enabled := false;

  editEcliente.Enabled := false;
  editEendereco.Enabled := false;
  editEnum.Enabled := false;
  editEcompl.Enabled := false;
  editEbairro.Enabled := false;
  editEcidade.Enabled := false;
  editEuf.Enabled := false;
  editEcep.Enabled := false;

  btnIncItem.Enabled := false;
  btnExcItem.Enabled := false;


  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;

  telaDados.cdsTempItens.First;
  while not (telaDados.cdsTempItens.Eof) do
  begin

    telaDados.tblPedidosItens.Append;

    telaDados.tblPedidosItens.FieldByName('DESCRICAO').Value :=
      telaDados.cdsTempItens.FieldByName('DESC').Value;

    telaDados.tblPedidosItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.cdsTempItens.FieldByName('IDPROD').Value;

    telaDados.tblPedidosItens.FieldByName('ID_PEDIDO').Value :=
      telaDados.cdsTempItens.FieldByName('IDPED').Value;

    telaDados.tblPedidosItens.FieldByName('VALOR').Value :=
      telaDados.cdsTempItens.FieldByName('VALOR').Value;

    telaDados.tblPedidosItens.FieldByName('QUANTIDADE').Value :=
      telaDados.cdsTempItens.FieldByName('QUANT').Value;

    telaDados.tblPedidosItens.FieldByName('DESCONTO').Value :=
      telaDados.cdsTempItens.FieldByName('DESCONTO').Value;

    telaDados.tblPedidosItens.FieldByName('ACRESCIMO').Value :=
      telaDados.cdsTempItens.FieldByName('ACRESCIMO').Value;

    telaDados.tblPedidosItens.FieldByName('VALOR_TOTAL').Value :=
      telaDados.cdsTempItens.FieldByName('VRT').Value;

      telaDados.tblPedidosItens.Post;
      telaDados.cdsTempItens.Delete;

  end;

  telaDados.tblPedidosItens.ApplyUpdates;





end;

procedure TtelaLancPedidos.FormShow(Sender: TObject);
begin
telaDados.FormataCampos;
telaDados.tblPedidos.Open;
telaDados.tblPedidosItens.Open;
end;

procedure TtelaLancPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
telaDados.tblPedidos.Cancel;
telaDados.tblPedidos.Close;
telaDados.tblPedidosItens.Close;
end;

procedure TtelaLancPedidos.calculaPedido();
var dsc, acr, outrasDesp, vProd : double;
begin
  if editDesc.Text = '' then editDesc.Text := '0';
    dsc := StrToFloat(editDesc.Text);

  if editAsc.Text = '' then editAsc.Text := '0';
    acr := StrToFloat(editAsc.Text);

  if editOutrasDesp.Text = '' then editOutrasDesp.Text := '0';
    outrasDesp := StrToFloat(editOutrasDesp.Text);

  vProd := StrToFloat(editValProd.Text);


  telaDados.tblPedidosVALOR_TOTAL.Value := vProd - dsc + acr + outrasDesp;

  telaLancPedidos.Refresh;

  telaDados.FormataCampos;
end;

procedure TtelaLancPedidos.EncerrarExecute(Sender: TObject);
begin
telaLancPedidos.Close;
telaDados.tblPedidos.Close;

telaDados.cdsTempItens.EmptyDataSet;
end;

procedure TtelaLancPedidos.ConfirmarExecute(Sender: TObject);
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
if cbCliente.Text = '' then
  begin
    ShowMessage('Selecione o cliente');
    cbCliente.SetFocus;
    Abort;
  end;
if editValProd.Text = '' then
  begin
   ShowMessage('Selecione ao menos um produto');
   Abort;
  end;

  telaDados.tblPedidos.Open;
  telaDados.tblPedidos.Edit;
  telaDados.tblPedidosCLIENTE.value := telaDados.tblPedidosnCli.Value;
  telaDados.tblPedidos.Post;

  {editNumPed.Enabled := false;}
  editDtCad.Enabled := false;{
  editHrCad.Enabled := false; }
  editDtEmissao.Enabled := false; {
  editHrEmissao.Enabled := false; }
  editIdCliente.Enabled := false;
  cbCliente.Enabled := false;
  cbTpPg.Enabled := false;
  editValProd.Enabled := false;
  editDesc.Enabled := false;
  editAsc.Enabled := false;
  editOutrasDesp.Enabled := false;
  editVtotal.Enabled := false;

  editEcliente.Enabled := false;
  editEendereco.Enabled := false;
  editEnum.Enabled := false;
  editEcompl.Enabled := false;
  editEbairro.Enabled := false;
  editEcidade.Enabled := false;
  editEuf.Enabled := false;
  editEcep.Enabled := false;

  btnIncItem.Enabled := false;
  btnExcItem.Enabled := false;


  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;

  Incluir.Enabled := true;
  Confirmar.Enabled := false;
  Cancelar.Enabled := false;


  telaDados.cdsTempItens.First;
  while not (telaDados.cdsTempItens.Eof) do
  begin

    telaDados.tblPedidosItens.Append;

    telaDados.tblPedidosItens.FieldByName('DESCRICAO').Value :=
      telaDados.cdsTempItens.FieldByName('DESC').Value;

    telaDados.tblPedidosItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.cdsTempItens.FieldByName('IDPROD').Value;

    telaDados.tblPedidosItens.FieldByName('ID_PEDIDO').Value :=
      telaDados.cdsTempItens.FieldByName('IDPED').Value;

    telaDados.tblPedidosItens.FieldByName('VALOR').Value :=
      telaDados.cdsTempItens.FieldByName('VALOR').Value;

    telaDados.tblPedidosItens.FieldByName('QUANTIDADE').Value :=
      telaDados.cdsTempItens.FieldByName('QUANT').Value;

    telaDados.tblProdutos.Open;
    telaDados.tblProdutos.Edit;

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS where ID = ');
    telaDados.qryProdutos.SQL.Add(telaDados.cdsTempItens.FieldByName('IDPROD').AsString);
    estoque := telaDados.tblProdutosESTOQUE.AsInteger - telaDados.cdsTempItens.FieldByName('QUANT').AsInteger;
    telaDados.qryProdutos.Open; 

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Update PRODUTOS set ESTOQUE = :pDados Where ID = ');
    telaDados.qryProdutos.SQL.Add(telaDados.cdsTempItens.FieldByName('IDPROD').AsString);
    telaDados.qryProdutos.Params.ParamByName('pDados').AsInteger := estoque;
    telaDados.qryProdutos.Open;

    telaDados.tblProdutos.FieldByName('ESTOQUE').Value := telaDados.tblProdutos.FieldByName('ESTOQUE').Value -
      telaDados.cdsTempItens.FieldByName('QUANT').Value;

    telaDados.tblProdutos.Close;

    telaDados.tblPedidosItens.FieldByName('DESCONTO').Value :=
      telaDados.cdsTempItens.FieldByName('DESCONTO').Value;

    telaDados.tblPedidosItens.FieldByName('ACRESCIMO').Value :=
      telaDados.cdsTempItens.FieldByName('ACRESCIMO').Value;

    telaDados.tblPedidosItens.FieldByName('VALOR_TOTAL').Value :=
      telaDados.cdsTempItens.FieldByName('VRT').Value;

      telaDados.tblPedidosItens.Post;
      telaDados.cdsTempItens.Delete;

  end;

  if radDoc.ItemIndex = 0 then begin

  telaConfigSat.num := StrToInt(editId.Text);
  telaConfigSat.gerarVenda;

  end else begin

  telaGerarNfe.numN := StrToInt(editId.Text);
  telaGerarNfe.btnGeraNfe.Click;

  end;

  telaDados.tblPedidosItens.ApplyUpdates;
  telaDados.tblProdutos.Close;
  label10.Caption := 'Tecle F2 para Abrir Cupom'; 

end;

procedure TtelaLancPedidos.IncluirExecute(Sender: TObject);
var
id: Integer;
d,a,od : Double;
begin
label10.Caption := 'Tecle F7 Para incluir um item';

d  := 0.00;
a  := 0.00;
od := 0.00;
telaDados.tblPedidos.Open;
telaDados.tblPedidos.Last;
{editNumPed.Enabled := true;}
editDtCad.Enabled := true;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := true; {
editHrEmissao.Enabled := true; }
editIdCliente.Enabled := true;
cbCliente.Enabled := true;
cbTpPg.Enabled := true;
{editValProd.Enabled := true;}
editDesc.Enabled := true;
editAsc.Enabled := true;
editOutrasDesp.Enabled := true;
{editVtotal.Enabled := true; }

editEcliente.Enabled := true;
editEendereco.Enabled := true;
editEnum.Enabled := true;
editEcompl.Enabled := true;
editEbairro.Enabled := true;
editEcidade.Enabled := true;
editEuf.Enabled := true;
editEcep.Enabled := true;


btnIncItem.Enabled := true;
btnExcItem.Enabled := true;


btnIncluir.Enabled := false;
btnConfirmar.Enabled := true;
btnCancelar.Enabled := true;

Incluir.Enabled := false;
Confirmar.Enabled := true;
Cancelar.Enabled := true;
adicionarItem.Enabled := true;

cbTpPg.ItemIndex := 0;

editDesc.Text := FloatToStr(d);
editAsc.Text  := FloatToStr(a);
editOutrasDesp.Text := FloatToStr(od);  
         
                  {

        if editId.Text = ''  then begin
          id := 0;
        end else begin
          id := StrToInt(editId.Text) +1;
        end;

        }
        id := telaDados.tblPedidosID.asInteger + 1;

        telaDados.tblPedidos.Insert;
        telaDados.tblPedidosID.Value := id;
        editDtCad.Text     := DateToStr(date()) + ' ' +  TimeToStr(time());
        editDtEmissao.Text := DateToStr(date()) + ' ' +  TimeToStr(time());
        telaLancPedidos.Refresh;
                                            {
        telaDados.tblPedidosID.Value := id;
        telaDados.tblPedidos.Refresh;
        telaDados.tblPedidos.ApplyUpdates; } 
      

        editId.Text := IntToStr(id);
        cbCliente.SetFocus;

end;

procedure TtelaLancPedidos.CancelarExecute(Sender: TObject);
begin
telaDados.tblPedidos.Cancel;

{editNumPed.Enabled := false;}
editDtCad.Enabled := false;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := false; {
editHrEmissao.Enabled := true; }
editIdCliente.Enabled := false;
cbCliente.Enabled := false;
cbTpPg.Enabled := false;
{editValProd.Enabled := true;}
editDesc.Enabled := false;
editAsc.Enabled := false;
editOutrasDesp.Enabled := false;
{editVtotal.Enabled := true; }

editEcliente.Enabled := false;
editEendereco.Enabled := false;
editEnum.Enabled := false;
editEcompl.Enabled := false;
editEbairro.Enabled := false;
editEcidade.Enabled := false;
editEuf.Enabled := false;
editEcep.Enabled := false;

btnIncItem.Enabled := false;
btnExcItem.Enabled := false;

btnIncluir.Enabled := true;
btnConfirmar.Enabled := false;
btnCancelar.Enabled := false;

Incluir.Enabled := true;
Confirmar.Enabled := false;
Cancelar.Enabled := false;

telaDados.cdsTempItens.EmptyDataSet;
label10.Caption := 'Tecle F2 para Abrir Cupom';  


end;

procedure TtelaLancPedidos.editDescExit(Sender: TObject);
begin
calculaPedido();
end;

procedure TtelaLancPedidos.editAscExit(Sender: TObject);
begin
calculaPedido();
end;

procedure TtelaLancPedidos.editOutrasDespExit(Sender: TObject);
begin
calculaPedido();
end;

procedure TtelaLancPedidos.adicionarItemExecute(Sender: TObject);
begin
Application.CreateForm(TtelaLancItens, telaLancItens);
telaLancItens.Show;
telaLancItens.pegaTipo(0);
end;

procedure TtelaLancPedidos.btnPesquisarClick(Sender: TObject);
begin
Application.CreateForm(TtelaGerarNfe, telaGerarNfe);
telaGerarNfe.Show;
end;

end.
