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
    Dinheiro: TLabel;
    Troco: TLabel;
    edtTrc: TEdit;
    Label12: TLabel;
    edtCar: TEdit;
    edtDin: TEdit;
    Label14: TLabel;
    PanelCalc: TPanel;
    Label22: TLabel;
    encPanel: TAction;
    excluirItem: TAction;
    Label23: TLabel;
    GroupBox6: TGroupBox;
    edtItem: TEdit;
    Label24: TLabel;
    GroupBox7: TGroupBox;
    Label21: TLabel;
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
    procedure edtDinExit(Sender: TObject);
    procedure edtCarExit(Sender: TObject);
    procedure edtTrcDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure encPanelExecute(Sender: TObject);
    procedure excluirItemExecute(Sender: TObject);
    procedure edtItemKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);  

  private

    procedure calculaTroco();
    { Private declarations }
  public
    procedure calculaPedido();
    { Public declarations }

  end;

var
  telaLancPedidos: TtelaLancPedidos;



implementation

uses DB,uConfigSat, uGerarNfe, uPesItens;

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

  if PanelCalc.Visible = false then begin
    PanelCalc.Visible := true;
    telaDados.tblPedidosID_CLIENTE.Value := 1;
    edtDin.SetFocus;
  end else begin
    if edtTrc.Text = '0,00' then begin
      edtDin.SetFocus;
      ShowMessage('Valor pago deve ser maior ou igual ao valor total da compra');
      abort;
    end;
    if cbCliente.Text = '' then begin
      ShowMessage('Selecione o cliente');
      cbCliente.SetFocus;
      Abort;
    end;
    if editValProd.Text = '' then begin
      ShowMessage('Selecione ao menos um produto');
      Abort;
  end else begin

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
  edtItem.Enabled := false;

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
  PanelCalc.Visible := False;
  telaDados.tblPedidosItens.ApplyUpdates;
  telaDados.tblProdutos.Close;
  label10.Caption := 'Tecle F2 para Abrir Cupom';
  end;
  end;
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
  edtItem.Enabled := true;

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

  id := telaDados.tblPedidosID.asInteger + 1;

  telaDados.tblPedidos.Insert;
  telaDados.tblPedidosID.Value := id;
  telaDados.tblPedidosDATA_PEDIDO.AsString     := DateToStr(date()) + ' ' +  TimeToStr(time());
  telaDados.tblPedidosDATA_ENTREGA.AsString := DateToStr(date()) + ' ' +  TimeToStr(time());
  telaLancPedidos.Refresh;

  editId.Text := IntToStr(id);
  edtItem.SetFocus;
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
  edtItem.Enabled := false;

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
  Application.CreateForm(TtelaPesItens, telaPesItens);
  Application.CreateForm(TtelaLancItens, telaLancItens);

  tipo := 0;
  telaDados.cdsTempItens.Append;
  telaPesItens.Show;
end;

procedure TtelaLancPedidos.btnPesquisarClick(Sender: TObject);
begin
  Application.CreateForm(TtelaGerarNfe, telaGerarNfe);
  telaGerarNfe.Show;
end;

procedure TtelaLancPedidos.calculaTroco();
var
trc, din, car : currency;
begin

  if edtDin.Text = '' then edtDin.Text := '0';
  if edtCar.Text = '' then edtCar.Text := '0';
  if edtTrc.Text = '' then edtTrc.Text := '0';

  din := StrToCurr(edtDin.Text);
  car := StrToCurr(edtCar.Text);
  edtDin.text:= FormatCurr('#,##0.00',din);
  edtCar.text:= formatCurr('#,##0.00',car);

  trc := (din + car) - StrToCurr(editVtotal.Text);
  if trc < 0 then begin
    edtTrc.Text := '0,00';
  end else begin
    edtTrc.text:= FormatCurr('#,##0.00',trc);
  end;
end;

procedure TtelaLancPedidos.edtDinExit(Sender: TObject);
begin
  calculaTroco;
end;

procedure TtelaLancPedidos.edtCarExit(Sender: TObject);
begin
  calculaTroco;
end;

procedure TtelaLancPedidos.edtTrcDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  edtDin.SetFocus;
end;

procedure TtelaLancPedidos.encPanelExecute(Sender: TObject);
begin
  if PanelCalc.Visible = true then begin
     edtDin.Clear;
     edtCar.Clear;
     PanelCalc.Visible := false;
  end;
end;

procedure TtelaLancPedidos.excluirItemExecute(Sender: TObject);

begin
  telaDados.tblPedidosVALOR.Value := telaDados.tblPedidosVALOR.Value - DBGrid1.Columns.Items[5].Field.AsCurrency;
  telaDados.tblPedidosVALOR_TOTAL.Value := telaDados.tblPedidosVALOR_TOTAL.Value - DBGrid1.Columns.Items[5].Field.AsCurrency;
  telaDados.cdsTempItens.Delete;
end;

procedure TtelaLancPedidos.edtItemKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then begin
    if edtItem.Text <> '' then
    begin
      telaDados.qryProdutos.Close;
      telaDados.qryProdutos.SQL.Clear;
      telaDados.qryProdutos.SQL.Add('Select * from produtos where EAN13 = ');
      telaDados.qryProdutos.SQL.Add(edtItem.Text);
      telaDados.qryProdutos.Open;

      if telaDados.qryProdutos.RecordCount >0 then begin
       telaDados.cdsTempItens.Append;
       telaDados.tblPedidosItens.Open;
       telaDados.cdsTempItensDESC.Value := telaDados.qryProdutos.FieldByName('DESCRICAO').AsString;
       telaDados.cdsTempItensIDPROD.Value := telaDados.qryProdutos.FieldByName('ID').AsInteger;
       telaDados.cdsTempItensIDPED.Value := StrToInt(editId.Text);
       telaDados.cdsTempItensQUANT.Value := 1;
       telaDados.cdsTempItensVALOR.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
       telaDados.cdsTempItensDESCONTO.Value := 0;
       telaDados.cdsTempItensACRESCIMO.Value := 0;
       telaDados.cdsTempItensVRT.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;

       telaDados.cdsTempItens.Post;

       {telaDados.tblPedidosVALOR_TOTAL.Value :=   telaDados.cdsTempItensVRT.Value;
       telaDados.tblPedidosVALOR.Value := telaDados.tblPedidosVALOR_TOTAL.Value;}
       telaLancPedidos.Refresh;
       edtItem.Clear;
       end else begin
       ShowMessage('Nenhum produto com este código !');
       edtItem.SetFocus;
    end;
  end;
end;
end;

procedure TtelaLancPedidos.edtItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_shift then
  begin
  Application.CreateForm(TtelaLancItens, telaLancItens);

    if telaDados.qryProdutos.RecordCount < 1 then begin
      ShowMessage('Nenhum produto com este código !');
      edtItem.SetFocus;
      Abort;
    end;
  telaDados.cdsTempItens.Last;
  telaDados.cdsTempItens.edit;{
  telaDados.tblPedidosItens.Open;
  telaDados.cdsTempItensDESC.Value := telaDados.qryProdutos.FieldByName('DESCRICAO').AsString;
  telaDados.cdsTempItensIDPROD.Value := telaDados.qryProdutos.FieldByName('ID').AsInteger;
  telaDados.cdsTempItensIDPED.Value := StrToInt(editId.Text);
  telaDados.cdsTempItensQUANT.Value := 1;
  telaDados.cdsTempItensVALOR.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
  telaDados.cdsTempItensDESCONTO.Value := 0;
  telaDados.cdsTempItensACRESCIMO.Value := 0;
  telaDados.cdsTempItensVRT.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
  telaDados.cdsTempItensVRR.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
               }

  telaLancItens.Show;
  telaLancItens.pegaTipo(0);
  edtItem.Clear;
  end;
end; 

procedure TtelaLancPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  {if telaDados.cdsTempItens.RecordCount < 1 then begin
    Abort;
  end else begin
    telaDados.tblPedidosVALOR.Value := telaDados.cdsTempItens.Aggregates.Items[0].Value;
    calculaPedido;
  end; }
end;

end.


