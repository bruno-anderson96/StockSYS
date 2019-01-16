unit uLancCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDados, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  Mask, ComCtrls, ActnList, DB;

type
  TtelaLancCompras = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    gbHeader: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    editId: TDBEdit;
    editDtCad: TDBEdit;
    editDtEmissao: TDBEdit;
    gbFor: TGroupBox;
    Label20: TLabel;
    editIdFornecedor: TDBEdit;
    cbFornecedor: TDBLookupComboBox;
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
    adicionarItem: TAction;
    gbItem: TGroupBox;
    Label24: TLabel;
    edtItem: TEdit;
    StatusBar1: TStatusBar;
    btnAddFor: TSpeedButton;
    Label10: TLabel;
    edtnNota: TDBEdit;
    Label12: TLabel;
    edtnSerie: TDBEdit;
    Label14: TLabel;
    edtCfop: TDBEdit;
    Label21: TLabel;
    edtChaveNfe: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    edtIDesc: TDBEdit;
    Label25: TLabel;
    edtICfop: TDBEdit;
    Label26: TLabel;
    edtIEan: TDBEdit;
    Label27: TLabel;
    edtIVrUnit: TDBEdit;
    Label28: TLabel;
    edtIPcusto: TDBEdit;
    Label29: TLabel;
    edtIQtd: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtIVrTotal: TDBEdit;
    Label33: TLabel;
    edtIMargem: TDBEdit;
    Label34: TLabel;
    edtIVenda: TDBEdit;
    Label35: TLabel;
    edtIMargemP: TDBEdit;
    Label36: TLabel;
    edtIVendaP: TDBEdit;
    gbAliq: TGroupBox;
    Label37: TLabel;
    edtIAICMS: TDBEdit;
    Label38: TLabel;
    edtIVICMS: TDBEdit;
    Label39: TLabel;
    edtIAIpi: TDBEdit;
    Label40: TLabel;
    edtIVIpi: TDBEdit;
    Label41: TLabel;
    edtIAPis: TDBEdit;
    Label42: TLabel;
    edtIVPis: TDBEdit;
    Label43: TLabel;
    edtIAIcmsSub: TDBEdit;
    Label44: TLabel;
    edtIVIcmsSub: TDBEdit;
    Label45: TLabel;
    edtIACofins: TDBEdit;
    Label46: TLabel;
    edtIVCofins: TDBEdit;
    cbModelo: TDBComboBox;
    btnConfirmProd: TSpeedButton;
    gbPrecos: TGroupBox;
    pcControle: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    gbImpostos: TGroupBox;
    gbTotais: TGroupBox;
    Label47: TLabel;
    edtBIpi: TDBEdit;
    Label48: TLabel;
    edtBPis: TDBEdit;
    Label49: TLabel;
    edtBCofins: TDBEdit;
    Label50: TLabel;
    edtBIcms: TDBEdit;
    Label51: TLabel;
    edtBIcmsS: TDBEdit;
    Label52: TLabel;
    edtVIpi: TDBEdit;
    Label53: TLabel;
    edtVPis: TDBEdit;
    Label54: TLabel;
    edtVCofins: TDBEdit;
    Label55: TLabel;
    edtVIcms: TDBEdit;
    Label56: TLabel;
    edtVIcmsS: TDBEdit;
    Label57: TLabel;
    edtVTnota: TDBEdit;
    Label58: TLabel;
    edtVProd: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label59: TLabel;
    edtTId: TDBEdit;
    Label60: TLabel;
    cbTDesc: TDBLookupComboBox;
    Label61: TLabel;
    Label62: TLabel;
    edtVId: TDBEdit;
    cbVDesc: TDBLookupComboBox;
    procedure IncluirExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure EncerrarExecute(Sender: TObject);
    procedure ConfirmarExecute(Sender: TObject);
    procedure adicionarItemExecute(Sender: TObject);
    procedure edtItemKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAddForClick(Sender: TObject);
    procedure edtCfopChange(Sender: TObject);
    procedure edtCfopExit(Sender: TObject);
    procedure btnConfirmProdClick(Sender: TObject);
    procedure edtIQtdExit(Sender: TObject);
    procedure edtIVrUnitExit(Sender: TObject);
    procedure edtIMargemExit(Sender: TObject);
    procedure edtIVendaExit(Sender: TObject);
    procedure edtIMargemPExit(Sender: TObject);
    procedure edtIVendaPExit(Sender: TObject);
    procedure cbTDescEnter(Sender: TObject);
  private
    { Private declarations }
    procedure calculaVrTotal();
  public
    { Public declarations }
        procedure calculaPedido();
        
  end;

var
  telaLancCompras: TtelaLancCompras;
   vCfop : integer;

implementation

uses uLancItens, uPesItens, uLancPedidos, uCadFornecedor;

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

telaDados.tblProdutos.Edit;
telaDados.tblProdutos.ClearFields;


//telaDados.cdsTempItens.Insert;

{editNumPed.Enabled := true;}
editDtCad.Enabled := true;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := true; {
editHrEmissao.Enabled := true; }
editIdFornecedor.Enabled := true;
cbFornecedor.Enabled := true;
{radTpPg.Enabled := true;}
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
edtItem.Enabled := true;

edtIDesc.Enabled := true;
edtnNota.Enabled := true;
edtnSerie.Enabled := true;
edtCfop.Enabled := true;
edtChaveNfe.Enabled := true;
edtICfop.Enabled := true;
edtIEan.Enabled := true;
edtIVrUnit.Enabled := true;
edtIPcusto.Enabled := true;
edtIQtd.Enabled := true;
//edtIVrTotal.Enabled := true;
edtIMargem.Enabled := true;
edtIMargemP.Enabled := true;
edtIVenda.Enabled := true;
edtIVendaP.Enabled := true;
edtIAICMS.Enabled := true;
edtIAIpi.Enabled := true;
edtIAPis.Enabled := true;
edtIAIcmsSub.Enabled := true;
edtIACofins.Enabled := true;
edtIVICMS.Enabled := true;
edtIVIpi.Enabled := true;
edtIVPis.Enabled := true;
edtIVIcmsSub.Enabled := true;
edtIVCofins.Enabled := true;
cbModelo.Enabled := true; 

btnIncItem.Enabled := true;
btnExcItem.Enabled := true;
btnRetPed.Enabled := true;
btnFinPed.Enabled := true;

btnIncluir.Enabled := false;
btnConfirmar.Enabled := true;
btnCancelar.Enabled := true;

btnAddFor.Enabled := true;
btnConfirmProd.Enabled := true;

Incluir.Enabled := false;
Confirmar.Enabled := true;
Cancelar.Enabled := true; 

{radTpPg.ItemIndex := 0;  }

editDesc.Text := FloatToStr(d);
editAsc.Text  := FloatToStr(a);
editOutrasDesp.Text := FloatToStr(od);  


        id := telaDados.tblComprasID.asInteger + 1;

        telaDados.tblCompras.Insert;
        telaDados.tblComprasID.Value := id;
        telaDados.tblComprasDATA_COMPRA.AsString := DateToStr(date()) + ' ' +  TimeToStr(time());
        telaDados.tblComprasDATA_ENTREGA.AsString := DateToStr(date()) + ' ' +  TimeToStr(time());
        telaLancCompras.Refresh;

        editId.Text := IntToStr(id);
        edtnNota.SetFocus;
        cbModelo.ItemIndex := 7;


end;

procedure TtelaLancCompras.CancelarExecute(Sender: TObject);
begin
telaDados.tblCompras.Cancel;
telaDados.tblProdutos.Cancel;

{editNumPed.Enabled := false;}
editDtCad.Enabled := false;{
editHrCad.Enabled := true; }
editDtEmissao.Enabled := false; {
editHrEmissao.Enabled := true; }
editIdFornecedor.Enabled := false;
cbFornecedor.Enabled := false;
{radTpPg.Enabled := false; }
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
edtItem.Enabled := false;

  edtIDesc.Enabled := false;
  edtnNota.Enabled := false;
  edtnSerie.Enabled := false;
  edtCfop.Enabled := false;
  edtChaveNfe.Enabled := false;
  edtICfop.Enabled := false;
  edtIEan.Enabled := false;
  edtIVrUnit.Enabled := false;
  edtIPcusto.Enabled := false;
  edtIQtd.Enabled := false;
  edtIVrTotal.Enabled := false;
  edtIMargem.Enabled := false;
  edtIMargemP.Enabled := false;
  edtIVenda.Enabled := false;
  edtIVendaP.Enabled := false;
  edtIAICMS.Enabled := false;
  edtIAIpi.Enabled := false;
  edtIAPis.Enabled := false;
  edtIAIcmsSub.Enabled := false;
  edtIACofins.Enabled := false;
  edtIVICMS.Enabled := false;
  edtIVIpi.Enabled := false;
  edtIVPis.Enabled := false;
  edtIVIcmsSub.Enabled := false;
  edtIVCofins.Enabled := false;
  cbModelo.Enabled := false;

btnIncItem.Enabled := false;
btnExcItem.Enabled := false;
btnRetPed.Enabled := false;
btnFinPed.Enabled := false;

btnIncluir.Enabled := true;
btnConfirmar.Enabled := false;
btnCancelar.Enabled := false;

btnAddFor.Enabled := false;
btnConfirmProd.Enabled := false;

Incluir.Enabled := true;
Confirmar.Enabled := false;
Cancelar.Enabled := false;

telaDados.cdsTempItens.EmptyDataSet; 


end;

procedure TtelaLancCompras.EncerrarExecute(Sender: TObject);
begin
telaLancCompras.Close;
telaDados.tblCompras.Close;

telaDados.cdsTempItens.EmptyDataSet;
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
  {radTpPg.Enabled := false;}
  editValProd.Enabled := false;
  editDesc.Enabled := false;
  editAsc.Enabled := false;
  editOutrasDesp.Enabled := false;
  editVtotal.Enabled := false;
  edtItem.Enabled := false;

  editEemitente.Enabled := false;
  editEendereco.Enabled := false;
  editEnum.Enabled := false;
  editEcompl.Enabled := false;
  editEbairro.Enabled := false;
  editEcidade.Enabled := false;
  editEuf.Enabled := false;
  editEcep.Enabled := false;

  edtIDesc.Enabled := false;
  edtnNota.Enabled := false;
  edtnSerie.Enabled := false;
  edtCfop.Enabled := false;
  edtChaveNfe.Enabled := false;
  edtICfop.Enabled := false;
  edtIEan.Enabled := false;
  edtIVrUnit.Enabled := false;
  edtIPcusto.Enabled := false;
  edtIQtd.Enabled := false;
  edtIVrTotal.Enabled := false;
  edtIMargem.Enabled := false;
  edtIMargemP.Enabled := false;
  edtIVenda.Enabled := false;
  edtIVendaP.Enabled := false;
  edtIAICMS.Enabled := false;
  edtIAIpi.Enabled := false;
  edtIAPis.Enabled := false;
  edtIAIcmsSub.Enabled := false;
  edtIACofins.Enabled := false;
  edtIVICMS.Enabled := false;
  edtIVIpi.Enabled := false;
  edtIVPis.Enabled := false;
  edtIVIcmsSub.Enabled := false;
  edtIVCofins.Enabled := false;
  cbModelo.Enabled := false;

  btnIncItem.Enabled := false;
  btnExcItem.Enabled := false;
  btnRetPed.Enabled := false;
  btnFinPed.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;

  btnAddFor.Enabled := false;
  btnConfirmProd.Enabled := false;

  Incluir.Enabled := true;
  Confirmar.Enabled := false;
  Cancelar.Enabled := false;

  telaDados.cdsTempItens.First;
  while not (telaDados.cdsTempItens.Eof) do
  begin

    telaDados.tblCompraItens.Append;

    telaDados.tblCompraItens.FieldByName('DESCRICAO').Value :=
      telaDados.cdsTempItens.FieldByName('DESC').Value;

    telaDados.tblCompraItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.cdsTempItens.FieldByName('IDPROD').Value;

    telaDados.tblCompraItens.FieldByName('ID_COMPRA').Value :=
      telaDados.cdsTempItens.FieldByName('IDPED').Value;

    telaDados.tblCompraItens.FieldByName('VALOR').Value :=
      telaDados.cdsTempItens.FieldByName('VALOR').Value;

    telaDados.tblCompraItens.FieldByName('QUANTIDADE').Value :=
      telaDados.cdsTempItens.FieldByName('QUANT').Value;

    telaDados.tblProdutos.Open;
    telaDados.tblProdutos.Edit;

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS where ID = ');
    telaDados.qryProdutos.SQL.Add(telaDados.cdsTempItens.FieldByName('IDPROD').AsString);
    estoque := telaDados.tblProdutosESTOQUE.AsInteger + telaDados.cdsTempItens.FieldByName('QUANT').AsInteger;
    telaDados.qryProdutos.Open; 

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Update PRODUTOS set ESTOQUE = :pDados Where ID = ');
    telaDados.qryProdutos.SQL.Add(telaDados.cdsTempItens.FieldByName('IDPROD').AsString);
    telaDados.qryProdutos.Params.ParamByName('pDados').AsInteger := estoque;
    telaDados.qryProdutos.Open;

    telaDados.tblProdutos.FieldByName('ESTOQUE').Value := telaDados.tblProdutos.FieldByName('ESTOQUE').Value +
      telaDados.cdsTempItens.FieldByName('QUANT').Value;

    telaDados.tblProdutos.Close;

    telaDados.tblCompraItens.FieldByName('DESCONTO').Value :=
      telaDados.cdsTempItens.FieldByName('DESCONTO').Value;

    telaDados.tblCompraItens.FieldByName('ACRESCIMO').Value :=
      telaDados.cdsTempItens.FieldByName('ACRESCIMO').Value;

    telaDados.tblCompraItens.FieldByName('VALOR_TOTAL').Value :=
      telaDados.cdsTempItens.FieldByName('VRT').Value;

      telaDados.tblCompraItens.Post;
      telaDados.cdsTempItens.Delete;

  end;

  telaDados.tblCompraItens.ApplyUpdates;
  telaDados.tblProdutos.Close;

end;

procedure TtelaLancCompras.adicionarItemExecute(Sender: TObject);
begin
Application.CreateForm(TtelaPesItens, telaPesItens);
Application.CreateForm(TtelaLancItens, telaLancItens); 

tipo := 1;
telaDados.cdsTempItens.Append;


telaPesItens.Show;
end;

procedure TtelaLancCompras.calculaPedido();
var dsc, acr, outrasDesp, vProd : double;
begin
  if editDesc.Text = '' then editDesc.Text := '0';
    dsc := StrToFloat(editDesc.Text);

  if editAsc.Text = '' then editAsc.Text := '0';
    acr := StrToFloat(editAsc.Text);

  if editOutrasDesp.Text = '' then editOutrasDesp.Text := '0';
    outrasDesp := StrToFloat(editOutrasDesp.Text);

  vProd := StrToFloat(editValProd.Text);


  telaDados.tblComprasVALOR_TOTAL.Value := vProd - dsc + acr + outrasDesp;

  telaLancCompras.Refresh;

  telaDados.FormataCampos;
end;


procedure TtelaLancCompras.edtItemKeyPress(Sender: TObject; var Key: Char);
begin
tipo := 1;
 if key =#13 then begin
    if edtItem.Text <> '' then
    begin
      telaDados.qryProdutos.Close;
      telaDados.qryProdutos.SQL.Clear;
      telaDados.qryProdutos.SQL.Add('Select * from produtos where ID = ');
      telaDados.qryProdutos.SQL.Add(edtItem.Text);
      telaDados.qryProdutos.Open;

      if telaDados.qryProdutos.RecordCount >0 then begin
       {telaDados.cdsTempItens.Append;
       telaDados.tblCompraItens.Open;
       telaDados.cdsTempItensDESC.Value := telaDados.qryProdutos.FieldByName('DESCRICAO').AsString;
       telaDados.cdsTempItensIDPROD.Value := telaDados.qryProdutos.FieldByName('ID').AsInteger;
       telaDados.cdsTempItensIDPED.Value := StrToInt(editId.Text);
       telaDados.cdsTempItensQUANT.Value := 1;
       telaDados.cdsTempItensVALOR.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
       telaDados.cdsTempItensDESCONTO.Value := 0;
       telaDados.cdsTempItensACRESCIMO.Value := 0;
       telaDados.cdsTempItensVRT.Value := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
       }

       //telaDados.cdsTempItens.Post;

       {telaDados.tblPedidosVALOR_TOTAL.Value :=   telaDados.cdsTempItensVRT.Value;
       telaDados.tblPedidosVALOR.Value := telaDados.tblPedidosVALOR_TOTAL.Value;}
       telaDados.tblProdutos.Locate('ID', telaDados.qryProdutos.FieldByName('ID').AsString, []);
       telaDados.tblProdutos.Edit;
       
       telaLancCompras.Refresh;
       edtItem.Clear;
       end else begin
        if telaDados.tblProdutos.State = dsEdit then begin
          telaDados.tblProdutos.ClearFields;
        end;
        ShowMessage('Nenhum produto com este código !');
        edtItem.Clear;
        edtItem.SetFocus;
      end;
    end;
  end;
end;

procedure TtelaLancCompras.edtItemKeyDown(Sender: TObject; var Key: Word;
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
      telaLancItens.pegaTipo(1);

      edtItem.Clear;


  end;
end;

procedure TtelaLancCompras.btnAddForClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadFor, telaCadFor);
  telaCadFor.Show;
end;

procedure TtelaLancCompras.edtCfopChange(Sender: TObject);
  var cfop : string;
begin
if edtCfop.Text <> '' then begin
  cfop := edtCfop.Text;
    if cfop[1] = '5' then begin
      cfop[1] := '1';
    end;
    if cfop[1] = '6' then begin
      cfop[1] := '2';
    end;
    edtCfop.Text := cfop;
  end;
end;


procedure TtelaLancCompras.edtCfopExit(Sender: TObject);
begin
vCfop := 0 ;
end;

procedure TtelaLancCompras.btnConfirmProdClick(Sender: TObject);
begin
  if edtIVIpi.Text = '' then telaDados.tblComprasVAL_IPI.AsString := '0,00';
  if edtIVPis.Text = '' then telaDados.tblComprasVAL_PIS.AsString := '0,00';
  if edtIVCofins.Text = '' then telaDados.tblComprasVAL_COFINS.AsString := '0,00';
  if edtIVICMS.Text = '' then telaDados.tblComprasVAL_ICMS.AsString := '0,00';
  if edtIVIcmsSub.Text = '' then telaDados.tblComprasVAL_ICMSSUB.AsString := '0,00';


  telaDados.cdsTempItens.Append;
  //telaDados.tblCompraItens.Open;
  telaDados.cdsTempItensDESC.Value := telaDados.tblProdutosDESCRICAO.Value;
  telaDados.cdsTempItensIDPROD.Value := telaDados.tblProdutosID.Value;
  telaDados.cdsTempItensIDPED.Value := StrToInt(editId.Text);
  telaDados.cdsTempItensQUANT.Value := StrToInt(edtIQtd.Text);
  telaDados.cdsTempItensVALOR.Value := telaDados.tblProdutosPRECO_COMPRA.Value;
  telaDados.cdsTempItensDESCONTO.Value := 0;
  telaDados.cdsTempItensACRESCIMO.Value := 0;
  telaDados.cdsTempItensVRT.Value := StrToFloat(edtIVrTotal.Text);

  telaDados.tblComprasVAL_IPI.AsString := FloatToStr(telaDados.tblProdutosVAL_IPI.AsFloat + StrToFloat(edtVIpi.Text));
  telaDados.tblComprasVAL_PIS.AsString := FloatToStr(telaDados.tblProdutosVAL_PIS.AsFloat + StrToFloat(edtVPis.Text));
  telaDados.tblComprasVAL_ICMSSUB.AsString := FloatToStr(telaDados.tblProdutosVAL_ICMSSUB.AsFloat + StrToFloat(edtVIcmsS.Text));
  telaDados.tblComprasVAL_ICMS.AsString := FloatToStr(telaDados.tblProdutosVAL_ICMS.AsFloat + StrToFloat(edtVIcms.Text));
  telaDados.tblComprasVAL_COFINS.AsString := FloatToStr(telaDados.tblProdutosVAL_COFINS.AsFloat + StrToFloat(edtVCofins.Text));

  edtVTnota.Text := FloatToStr(StrToFloat(edtVIpi.Text) + StrToFloat(edtVPis.Text) +
  StrToFloat(edtVIcmsS.Text) + StrToFloat(edtVIcms.Text) + StrToFloat(edtVCofins.Text) +
  StrToFloat(edtVProd.Text));

  telaDados.cdsTempItens.Post;
  telaDados.tblProdutos.ClearFields;

  edtItem.SetFocus;
end;

procedure TtelaLancCompras.edtIQtdExit(Sender: TObject);
begin
   calculaVrTotal;
end;

procedure TtelaLancCompras.calculaVrTotal;
begin
  if edtIQtd.Text = '' then edtIQtd.Text := '0,00';
  if edtIVrUnit.Text = '' then edtIVrUnit.Text := '0,00';
  edtIVrTotal.Text := FloatToStr(StrToFloat(edtIQtd.Text) * StrToFloat(edtIVrUnit.Text));
end;

procedure TtelaLancCompras.edtIVrUnitExit(Sender: TObject);
begin
calculaVrTotal;
telaDados.tblProdutosPRECO_COMPRA.AsString := edtIVrUnit.Text;
end;

procedure TtelaLancCompras.edtIMargemExit(Sender: TObject);
begin
  if edtIMargem.Text = '' then begin
    edtIMargem.Text := '0,00';
  end else begin

    telaDados.tblProdutosPRECO_VENDA.AsString := FloatToStr(StrToFloat(edtIPcusto.Text) + (StrToFloat(edtIPcusto.Text) * StrToFloat(edtIMargem.Text))/100);
    {telaDados.FormataCampos; }
  end;
end;

procedure TtelaLancCompras.edtIVendaExit(Sender: TObject);
begin
  telaDados.tblProdutosMARGEM_LUCRO.AsString :=  FloatToStr(((StrToFloat(edtIVenda.Text) - StrToFloat(edtIPcusto.Text)) / StrToFloat(edtIPcusto.Text) )* 100);

  if edtIVenda.Text = '' then begin
    edtIVenda.Text := '0,00';
  end;
end;

procedure TtelaLancCompras.edtIMargemPExit(Sender: TObject);
begin
  if edtIMargemP.Text = '' then begin
    edtIMargemP.Text := '0,00';
  end else begin

  telaDados.tblProdutosPRECO_VENDAP.AsString := FloatToStr(StrToFloat(edtIVenda.Text) + (StrToFloat(edtIVenda.Text) * StrToFloat(edtIMargemP.Text))/100);  
  end;
end;

procedure TtelaLancCompras.edtIVendaPExit(Sender: TObject);
begin
  telaDados.tblProdutosMARGEM_LUCROP.AsString :=  FloatToStr(((StrToFloat(edtIVendaP.Text) - StrToFloat(edtIVenda.Text)) / StrToFloat(edtIVenda.Text) )* 100);

  if edtIVenda.Text = '' then begin
    edtIVenda.Text := '0,00';
  end;
end;

procedure TtelaLancCompras.cbTDescEnter(Sender: TObject);
begin
  If cbTDesc.Text <> '' then begin
    telaDados.qryVeiculo.Close;
    telaDados.qryVeiculo.SQL.Clear;
    telaDados.qryVeiculo.SQL.Add('Select * from VEICULO Where IDT = ');
    telaDados.qryVeiculo.SQL.Add(edtTId.Text);
    telaDados.qryVeiculo.Open;
  end;
end;

end.
