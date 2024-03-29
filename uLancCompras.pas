unit uLancCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDados, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  Mask, ComCtrls, ActnList, DB, uCadTransportadora, pcnConversao;

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
    Label26: TLabel;
    edtIEan: TDBEdit;
    Label27: TLabel;
    edtIVrUnit: TDBEdit;
    Label28: TLabel;
    edtIPcusto: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
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
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
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
    btnAddTransp: TSpeedButton;
    Label63: TLabel;
    cbVPlaca: TDBLookupComboBox;
    pnlEdtExc: TPanel;
    btnEdt: TSpeedButton;
    btnExc: TSpeedButton;
    btnFec: TSpeedButton;
    edtIQtd: TEdit;
    edtIVrTotal: TEdit;
    OpenDialog1: TOpenDialog;
    btnImporta: TSpeedButton;
    Label64: TLabel;
    edtIid: TDBEdit;
    edtIBIcms: TDBEdit;
    edtIBICmssub: TDBEdit;
    edtIBIpi: TDBEdit;
    edtIBPis: TDBEdit;
    edtIBCofins: TDBEdit;
    edtIVICMS: TDBEdit;
    edtIVIcmssub: TDBEdit;
    edtIVIpi: TDBEdit;
    edtIVPis: TDBEdit;
    edtIVCofins: TDBEdit;
    edtICfop: TEdit;
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
    procedure edtIQtdExit(Sender: TObject);
    procedure edtIVrUnitExit(Sender: TObject);
    procedure edtIMargemExit(Sender: TObject);
    procedure edtIVendaExit(Sender: TObject);
    procedure edtIMargemPExit(Sender: TObject);
    procedure edtIVendaPExit(Sender: TObject);
    procedure cbTDescEnter(Sender: TObject);
    procedure btnAddTranspClick(Sender: TObject);
    procedure cbVDescEnter(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnEdtClick(Sender: TObject);
    procedure btnExcClick(Sender: TObject);
    procedure btnFecClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
    procedure btnConfirmProdClick(Sender: TObject);
    procedure PesquisarExecute(Sender: TObject);
  private
    { Private declarations }
    procedure calculaVrTotal();
    procedure limpaCamposProduto();
    procedure atualizarDadosProduto();
    procedure addItem();
    procedure buscarItem();
  public
    { Public declarations }
        procedure calculaPedido();
        
  end;

var
  telaLancCompras: TtelaLancCompras;
  vCfop : integer;
  prod: String;
  modP : integer; //Variavel de controle de dados do produto

implementation

uses uLancItens, uPesItens, uLancPedidos, uCadFornecedor, pcnNFe,
  ACBrNFeNotasFiscais, ACBrNFe, uGerarNfeEntrada;

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

id := telaDados.tblCompras.RecordCount + 1;


telaDados.tblProdutos.Edit;
telaDados.tblProdutos.ClearFields;

DBGrid1.Enabled := true;
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
edtIBICMS.Enabled := true;
edtIBIpi.Enabled := true;
edtIBPis.Enabled := true;
edtIBIcmsSub.Enabled := true;
edtIBCofins.Enabled := true;
edtIVICMS.Enabled := true;
edtIVIpi.Enabled := true;
edtIVPis.Enabled := true;
edtIVIcmsSub.Enabled := true;
edtIVCofins.Enabled := true;
cbModelo.Enabled := true;
cbTDesc.Enabled := true;
cbVDesc.Enabled := true;

btnAddTransp.Enabled := true;
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


        telaDados.tblCompras.Insert;
        telaDados.tblComprasID.Value := id;
        telaDados.tblComprasDATA_COMPRA.AsString := DateToStr(date()) + ' ' +  TimeToStr(time());
        telaDados.tblComprasDATA_ENTREGA.AsString := DateToStr(date()) + ' ' +  TimeToStr(time());
        telaLancCompras.Refresh;

        //editId.Text := IntToStr(id);
        edtnNota.SetFocus;
        cbModelo.ItemIndex := 7;


end;

procedure TtelaLancCompras.CancelarExecute(Sender: TObject);
begin
telaDados.tblCompras.Cancel;
telaDados.tblProdutos.Cancel;

DBGrid1.Enabled := false;

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
  edtIBICMS.Enabled := false;
  edtIBIpi.Enabled := false;
  edtIBPis.Enabled := false;
  edtIBIcmsSub.Enabled := false;
  edtIBCofins.Enabled := false;
  edtIVICMS.Enabled := false;
  edtIVIpi.Enabled := false;
  edtIVPis.Enabled := false;
  edtIVIcmsSub.Enabled := false;
  edtIVCofins.Enabled := false;
  cbModelo.Enabled := false;
  cbTDesc.Enabled := false;
  cbVDesc.Enabled := false;

btnAddTransp.Enabled := false;
btnIncItem.Enabled := false;
btnExcItem.Enabled := false;
btnRetPed.Enabled := false;
btnFinPed.Enabled := false;

btnIncluir.Enabled := true;
btnConfirmar.Enabled := false;
btnCancelar.Enabled := false;
btnPesquisar.Enabled := true;

btnAddFor.Enabled := false;
btnConfirmProd.Enabled := false;

Incluir.Enabled := true;
Confirmar.Enabled := false;
Cancelar.Enabled := false;
Pesquisar.Enabled := true;

telaDados.cdsCTempItens.EmptyDataSet;

end;

procedure TtelaLancCompras.EncerrarExecute(Sender: TObject);
begin
telaLancCompras.Close;


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
    ShowMessage('Preencha a data de emiss�o');
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
  telaDados.tblComprasMODELO.Value := cbModelo.Text;
  telaDados.tblCompras.Post;
  telaDados.trnscCompras.CommitRetaining;
  telaDados.tblCompras.ApplyUpdates();

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
  edtIBICMS.Enabled := false;
  edtIBIpi.Enabled := false;
  edtIBPis.Enabled := false;
  edtIBIcmsSub.Enabled := false;
  edtIBCofins.Enabled := false;
  edtIVICMS.Enabled := false;
  edtIVIpi.Enabled := false;
  edtIVPis.Enabled := false;
  edtIVIcmsSub.Enabled := false;
  edtIVCofins.Enabled := false;
  cbModelo.Enabled := false;
  cbTDesc.Enabled := false;
  cbVDesc.Enabled := false;

  btnAddTransp.Enabled := false;
  btnIncItem.Enabled := false;
  btnExcItem.Enabled := false;
  btnRetPed.Enabled := false;
  btnFinPed.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  btnPesquisar.Enabled := true;

  btnAddFor.Enabled := false;
  btnConfirmProd.Enabled := false;

  Incluir.Enabled := true;
  Confirmar.Enabled := false;
  Cancelar.Enabled := false;
  Pesquisar.Enabled := true;

  telaDados.cdsCTempItens.First;


  while not (telaDados.cdsCTempItens.Eof) do
  begin
    telaDados.qryCompraItens2.Close;
    telaDados.qryCompraItens2.SQL.Clear;
    telaDados.qryCompraItens2.SQL.Add('Select * from COMPRA_ITENS where ID_COMPRA =');
    telaDados.qryCompraItens2.SQL.Add(telaDados.cdsCTempItensID_COMPRA.AsString);
    telaDados.qryCompraItens2.SQL.Add('and ID_PRODUTO = ');
    telaDados.qryCompraItens2.SQL.Add(telaDados.cdsCTempItensID_PRODUTO.AsString);
    telaDados.qryCompraItens2.Open;
    {ShowMessage(telaDados.qryCompraItens2.FieldByName('DESCRICAO').AsString + '  ' +
    telaDados.qryCompraItens2.FieldByName('QUANTIDADE').AsString + ' ANTES qry ');
     }

    if telaDados.qryCompraItens2.RecordCount > 0 then begin
      telaDados.tblCompraItens.Locate('ID_COMPRA;ID_PRODUTO', VarArrayOf([telaDados.cdsCTempItensID_COMPRA.Value,telaDados.cdsCTempItensID_PRODUTO.Value]),[loPartialKey, loCaseinsensitive]);
      telaDados.tblCompraItens.Edit;
    end;
        
    {ShowMessage(telaDados.tblCompraItensDESCRICAO.AsString + '  ' + telaDados.tblCompraItensQUANTIDADE.AsString + ' tbl ' );
    ShowMessage(' O que t� no CDS ' + telaDados.cdsCTempItens.FieldByName('DESCRICAO').AsString + telaDados.cdsCTempItens.FieldByName('QUANTIDADE').AsString);
     }
    if not(telaDados.tblCompraItens.State = dsEdit) then begin
      telaDados.tblCompraItens.Append;
    end;

    telaDados.tblCompraItens.FieldByName('DESCRICAO').Value :=
      telaDados.cdsCTempItens.FieldByName('DESCRICAO').Value;

    telaDados.tblCompraItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.cdsCTempItens.FieldByName('ID_PRODUTO').Value;

    telaDados.tblCompraItens.FieldByName('EAN13').Value :=
      telaDados.cdsCTempItens.FieldByName('EAN13').Value;

    telaDados.tblCompraItens.FieldByName('ID_COMPRA').Value :=
      telaDados.cdsCTempItens.FieldByName('ID_COMPRA').Value;

    telaDados.tblCompraItens.FieldByName('VALOR').Value :=
      telaDados.cdsCTempItens.FieldByName('VALOR').Value;

      telaDados.tblCompraItens.FieldByName('VALOR_TOTAL').Value :=
    telaDados.cdsCTempItens.FieldByName('VALOR_TOTAL').Value;

      telaDados.tblCompraItens.FieldByName('CFOP').Value :=
    telaDados.cdsCTempItens.FieldByName('CFOP').Value;

    telaDados.tblCompraItens.FieldByName('QUANTIDADE').Value :=
      telaDados.cdsCTempItens.FieldByName('QUANTIDADE').Value;

    telaDados.tblCompraItens.FieldByName('BC_ICMS').Value :=
      telaDados.cdsCTempItens.FieldByName('BC_ICMS').Value;

    telaDados.tblCompraItens.FieldByName('BC_ICMSSUB').Value :=
      telaDados.cdsCTempItens.FieldByName('BC_ICMSSUB').Value;

    telaDados.tblCompraItens.FieldByName('BC_PIS').Value :=
      telaDados.cdsCTempItens.FieldByName('BC_PIS').Value;

    telaDados.tblCompraItens.FieldByName('BC_COFINS').Value :=
      telaDados.cdsCTempItens.FieldByName('BC_COFINS').Value;

    telaDados.tblCompraItens.FieldByName('BC_IPI').Value :=
      telaDados.cdsCTempItens.FieldByName('BC_IPI').Value;

    telaDados.tblCompraItens.FieldByName('VAL_ICMS').Value :=
      telaDados.cdsCTempItens.FieldByName('VAL_ICMS').Value;

    telaDados.tblCompraItens.FieldByName('VAL_ICMSSUB').Value :=
      telaDados.cdsCTempItens.FieldByName('VAL_ICMSSUB').Value;

    telaDados.tblCompraItens.FieldByName('VAL_PIS').Value :=
      telaDados.cdsCTempItens.FieldByName('VAL_PIS').Value;

    telaDados.tblCompraItens.FieldByName('VAL_COFINS').Value :=
      telaDados.cdsCTempItens.FieldByName('VAL_COFINS').Value;

    telaDados.tblCompraItens.FieldByName('VAL_IPI').Value :=
      telaDados.cdsCTempItens.FieldByName('VAL_IPI').Value;

    telaDados.tblCompraItens.FieldByName('ALIQUOTA_ICMS').Value :=
      telaDados.cdsCTempItens.FieldByName('ALIQUOTA_ICMS').Value;

    telaDados.tblCompraItens.FieldByName('ALIQUOTA_ICMSSUB').Value :=
      telaDados.cdsCTempItens.FieldByName('ALIQUOTA_ICMSSUB').Value;

    telaDados.tblCompraItens.FieldByName('ALIQUOTA_PIS').Value :=
      telaDados.cdsCTempItens.FieldByName('ALIQUOTA_PIS').Value;

    telaDados.tblCompraItens.FieldByName('ALIQUOTA_COFINS').Value :=
      telaDados.cdsCTempItens.FieldByName('ALIQUOTA_COFINS').Value;

    telaDados.tblCompraItens.FieldByName('ALIQUOTA_IPI').Value :=
      telaDados.cdsCTempItens.FieldByName('ALIQUOTA_IPI').Value;


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

    //telaDados.tblProdutos.Close;

    {telaDados.tblCompraItens.FieldByName('DESCONTO').Value :=
      telaDados.cdsCTempItens.FieldByName('DESCONTO').Value;

    telaDados.tblCompraItens.FieldByName('ACRESCIMO').Value :=
      telaDados.cdsCTempItens.FieldByName('ACRESCIMO').Value;
     }
    telaDados.tblCompraItens.FieldByName('VALOR_TOTAL').Value :=
      telaDados.cdsCTempItens.FieldByName('VALOR_TOTAL').Value;

      telaDados.tblCompraItens.Post;

      telaDados.cdsCTempItens.Delete;

  end;

  telaDados.trnscCompraItens.CommitRetaining;
  telaDados.tblCompraItens.ApplyUpdates();
  telaDados.cdsCTempItens.EmptyDataSet;
  DBGrid1.Enabled := false;

  //telaDados.tblProdutos.Close;

end;

procedure TtelaLancCompras.adicionarItemExecute(Sender: TObject);
begin
Application.CreateForm(TtelaPesItens, telaPesItens);
Application.CreateForm(TtelaLancItens, telaLancItens); 

tipo := 1;
//telaDados.cdsCTempItens.Append;


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

  vProd := telaDados.tblComprasVALOR.Value;

  //telaDados.tblComprasVALOR_TOTAL.Value := telaDados.cdsCTempItens.Aggregates.Items[0].Value; - dsc + acr + outrasDesp;
  telaDados.tblComprasVALOR_TOTAL.Value := telaDados.tblComprasVAL_IPI.Value +
  telaDados.tblComprasVAL_PIS.Value +
  telaDados.tblComprasVAL_ICMS.Value +
  telaDados.tblComprasVAL_ICMSSUB.Value +
  telaDados.tblComprasVAL_COFINS.Value +
  telaDados.cdsCTempItens.Aggregates.Items[0].Value;

  //telaDados.tblCompras.ApplyUpdates;
  telaLancCompras.Refresh;
  telaDados.FormataCampos;
end;


procedure TtelaLancCompras.edtItemKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then begin
    buscarItem;
    telaDados.cdsCTempItens.Append;
    edtIQtd.SetFocus;
  end;
end;

procedure TtelaLancCompras.edtItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin
if key = vk_shift then
    begin
      Application.CreateForm(TtelaLancItens, telaLancItens);


        if telaDados.qryProdutos.RecordCount < 1 then begin
          ShowMessage('Nenhum produto com este c�digo !');
          edtItem.SetFocus;
          Abort;
        end;
       telaDados.cdsCTempItens.Last;
       telaDados.cdsCTempItens.edit;{
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

procedure TtelaLancCompras.buscarItem;
begin
modP := 0;
tipo := 1;
 //if key =#13 then begin
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

       if edtCfop.Text <> '' then begin
        edtICfop.Text := edtCfop.Text;
       end else begin
        edtICfop.Text := telaDados.tblProdutosCFOP.AsString;
       end;

       telaLancCompras.Refresh;
       edtItem.Clear;

       end else begin
        if telaDados.tblProdutos.State = dsEdit then begin
          telaDados.tblProdutos.ClearFields;
        end;
        ShowMessage('Nenhum produto com este c�digo !');
        edtItem.Clear;
        edtItem.SetFocus;
      end;
    end;
  //end;
end;

procedure TtelaLancCompras.limpaCamposProduto;
begin
  edtIid.Clear;
  edtIDesc.Clear;
  edtICfop.Clear;
  edtIEan.Clear;
  edtIVrUnit.Clear;
  edtIVrTotal.Clear;
  edtIPcusto.Clear;
  edtIMargem.Clear;
  edtIVenda.Clear;
  edtIMargemP.Clear;
  edtIVendaP.Clear;
  edtIBICMS.Clear;
  edtIBIpi.Clear;
  edtIBPis.Clear;
  edtIBIcmsSub.Clear;
  edtIBCofins.Clear;
  edtIVICMS.Clear;
  edtIVIpi.Clear;
  edtIVPis.Clear;
  edtIVIcmsSub.Clear;
  edtIVCofins.Clear;
end;

procedure TtelaLancCompras.atualizarDadosProduto;
begin
  telaDados.qryProdutos.Close;
  telaDados.qryProdutos.SQL.Clear;
  telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS Where ID = ');
  telaDados.qryProdutos.SQL.Add(telaDados.tblProdutosID.AsString);
  telaDados.qryProdutos.Open;

  //Verificar e atualizar Dados no Produto
  if telaDados.qryProdutos.FieldByName('EAN13').AsString <> telaDados.tblProdutosEAN13.AsString then begin
    telaDados.tblProdutosEAN13.AsString := edtIEan.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('DESCRICAO').AsString <> telaDados.tblProdutosDESCRICAO.AsString then begin
    telaDados.tblProdutosDESCRICAO.AsString := edtIDesc.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('PRECO_COMPRA').AsString <> telaDados.tblProdutosPRECO_COMPRA.AsString then begin
    telaDados.tblProdutosPRECO_COMPRA.AsString := edtIVrUnit.Text;
    modP := 1;
  end;
  {if telaDados.qryProdutos.FieldByName('CFOP').AsString<> telaDados.tblProdutosCFOP.AsString then begin
    telaDados.tblProdutosCFOP.AsString := edtICfop.Text;
    modP := 1;
  end;}
  if telaDados.qryProdutos.FieldByName('PRECO_COMPRA').AsString <> telaDados.tblProdutosPRECO_COMPRA.AsString then begin
    telaDados.tblProdutosPRECO_COMPRA.AsString := edtIPcusto.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('MARGEM_LUCRO').AsString <> telaDados.tblProdutosMARGEM_LUCRO.AsString then begin
    telaDados.tblProdutosMARGEM_LUCRO.AsString := edtIMargem.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsString <> telaDados.tblProdutosPRECO_VENDA.AsString then begin
    telaDados.tblProdutosPRECO_VENDA.AsString := edtIVenda.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('MARGEM_LUCROP').AsString <> telaDados.tblProdutosMARGEM_LUCROP.AsString then begin
    telaDados.tblProdutosMARGEM_LUCROP.AsString := edtIMargemP.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('PRECO_VENDAP').AsString <> telaDados.tblProdutosPRECO_VENDAP.AsString then begin
    telaDados.tblProdutosPRECO_VENDAP.AsString := edtIVendaP.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('BC_ICMS').AsString <> telaDados.tblProdutosBC_ICMS.AsString then begin
    telaDados.tblProdutosALIQUOTA_ICMS.AsString := edtIBICMS.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('BC_IPI').AsString <> telaDados.tblProdutosBC_IPI.AsString then begin
    telaDados.tblProdutosBC_IPI.AsString := edtIBIpi.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('BC_ICMSSUB').AsString <> telaDados.tblProdutosBC_ICMSSUB.AsString then begin
    telaDados.tblProdutosBC_ICMSSUB.AsString := edtIBIcmsSub.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('BC_PIS').AsString <> telaDados.tblProdutosBC_PIS.AsString then begin
    telaDados.tblProdutosBC_PIS.AsString := edtIBPis.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('BC_COFINS').AsString <> telaDados.tblProdutosBC_COFINS.AsString then begin
    telaDados.tblProdutosBC_COFINS.AsString := edtIBCofins.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('VAL_ICMS').AsString <> telaDados.tblProdutosVAL_ICMS.AsString then begin
    telaDados.tblProdutosVAL_ICMS.AsString := edtIVICMS.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('VAL_ICMSSUB').AsString <> telaDados.tblProdutosVAL_ICMSSUB.AsString then begin
    telaDados.tblProdutosVAL_ICMSSUB.AsString := edtIVIcmsSub.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('VAL_PIS').AsString <> telaDados.tblProdutosVAL_PIS.AsString then begin
    telaDados.tblProdutosVAL_PIS.AsString := edtIVPis.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('VAL_IPI').AsString <> telaDados.tblProdutosVAL_IPI.AsString then begin
    telaDados.tblProdutosVAL_IPI.AsString := edtIVIpi.Text;
    modP := 1;
  end;
  if telaDados.qryProdutos.FieldByName('VAL_COFINS').AsString <> telaDados.tblProdutosVAL_COFINS.AsString then begin
    telaDados.tblProdutosVAL_COFINS.AsString := edtIVCofins.Text;
    modP := 1;
  end;
  
  if modP = 1 then begin
    if MessageBox(Handle, 'Alguns dados deste produto foram modificados, deseja atualizar o cadastro?',
     'Confirma��o', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
      telaDados.tblProdutos.Post;
    end else begin
      if telaDados.tblProdutos.State = dsEdit then begin
        telaDados.tblProdutos.Cancel;
      end;
    end;
  end;

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
  {If cbTDesc.Text <> '' then begin
    telaDados.qryVeiculo.Close;
    telaDados.qryVeiculo.SQL.Clear;
    telaDados.qryVeiculo.SQL.Add('Select * from VEICULO Where IDT = ');
    telaDados.qryVeiculo.SQL.Add(edtTId.Text);
    telaDados.qryVeiculo.Open;
  end;}
end;

procedure TtelaLancCompras.btnAddTranspClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadTransportadora, telaCadTransportadora);
  telaCadTransportadora.Show;
end;

procedure TtelaLancCompras.cbVDescEnter(Sender: TObject);
begin
  cbVPlaca.ListFieldIndex := 0;
end;

procedure TtelaLancCompras.DBGrid1DblClick(Sender: TObject);
begin
  pnlEdtExc.Visible := true;
  prod := DBGrid1.Columns[0].Field.AsString;
end;

procedure TtelaLancCompras.btnEdtClick(Sender: TObject);
begin
  telaDados.tblProdutos.Locate('ID', prod, []);
  telaDados.tblProdutos.Open;
  telaDados.tblProdutos.Edit;

  telaDados.cdsCTempItens.Locate('ID_PRODUTO', prod, []);
  edtIQtd.Text := telaDados.cdsCTempItensQUANTIDADE.AsString;
  edtIVrTotal.Text := telaDados.cdsCTempItensVALOR_TOTAL.AsString;
  edtIBIcms.Text     := telaDados.cdsCTempItensBC_ICMS.AsString;
  edtIBIcmssub.Text  := telaDados.cdsCTempItensBC_ICMSSUB.AsString;
  edtIBIpi.Text      := telaDados.cdsCTempItensBC_IPI.AsString;
  edtIBPis.Text      := telaDados.cdsCTempItensBC_PIS.AsString;
  edtIBCofins.Text   := telaDados.cdsCTempItensBC_COFINS.AsString;

  edtICfop.Text := telaDados.cdsCTempItensCFOP.AsString;
  telaDados.cdsCTempItens.Open;
  telaDados.cdsCTempItens.Edit;

  //telaDados.tblProdutos.Locate();
  pnlEdtExc.Visible := false;
end;

procedure TtelaLancCompras.btnExcClick(Sender: TObject);
begin
    if MessageDlg('Deseja realmente excluir o produto?',mtinformation,[mbyes,mbno],0) = mryes then begin
    telaDados.cdsCTempItens.Edit;
    pnlEdtExc.Visible := false;
    telaDados.tblCompraItens.Locate('ID_PRODUTO', telaDados.cdsTempItensIDPROD.Value,[]);
    if telaDados.tblCompraItens.RecordCount>0 then begin
      telaDados.tblCompraItens.Delete;
    end;       
    telaDados.cdsCTempItens.CommandText := 'Delete * from c:\tabela.dat where DESCRICAO =' + prod;
    //telaDados.cdsCTempItens.Locate('DESCRICAO', prod, []);
    telaDados.cdsCTempItens.Open;
    telaDados.cdsCTempItens.Delete;
    if telaDados.cdsCTempItens.RecordCount < 1 then begin
      telaDados.tblComprasVALOR.Value := 0;
      telaDados.tblComprasVALOR_TOTAL.value := 0;
    end else begin
    telaDados.tblComprasVALOR.Value := telaDados.cdsCTempItens.Aggregates.Items[0].Value;
    //telaDados.tblComprasVALOR_TOTAL.Value := telaDados.cdsCTempItens.Aggregates.Items[0].Value;
    telaLancCompras.calculaPedido;
    limpaCamposProduto;
    end;
  end;
end;

procedure TtelaLancCompras.btnFecClick(Sender: TObject);
begin
  pnlEdtExc.Visible := false;
end;

procedure TtelaLancCompras.FormShow(Sender: TObject);
begin
  tipo := 1;
end;

procedure TtelaLancCompras.btnImportaClick(Sender: TObject);
var
idEmit, idProd : integer;
i : integer;
begin
  OpenDialog1.Execute;
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  telaDados.ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);

  //Verifica��o de nota existente
  telaDados.qryCompras.Close;
  telaDados.qryCompras.SQL.Clear;
  telaDados.qryCompras.SQL.Add('Select * From COMPRA where CHAVENFE = '''+IntToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cNF)+'''');
  telaDados.qryCompras.Open;

  if telaDados.qryCompras.RecordCount > 0 then begin
    ShowMessage('Nota j� existente');
    Abort;
  end;

  Incluir.Execute;

  //Cabe�alho da nota
  telaDados.tblComprasCHAVENFE.Value := IntToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cNF);
  telaDados.tblComprasDATA_COMPRA.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.dEmi;
  telaDados.tblComprasCFOP.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.natOp;
  telaDados.tblComprasNNOTA.Value := IntToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
  telaDados.tblComprasNSERIE.Value := IntToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.serie);


  // Busca Fornecedor
  telaDados.qryFornecedores.Close;
  telaDados.qryFornecedores.SQL.Clear;
  telaDados.qryFornecedores.SQL.Add('Select * from FORNECEDOR where NOME = ''' + telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome+ '''' );
  //telaDados.qryFornecedores.SQL.Add(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome);
  telaDados.qryFornecedores.Open;


  // Fornecedor
  if telaDados.qryFornecedores.RecordCount < 1 then begin
    telaDados.tblFornecedores.Last;
    idEmit := telaDados.tblFornecedoresID.Value + 1;
    telaDados.tblFornecedores.Insert;
    telaDados.tblFornecedoresID.Value := idEmit;
    telaDados.tblFornecedoresNOME.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome;
    telaDados.tblFornecedoresCNPJ_CPF.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.CNPJCPF;
    telaDados.tblFornecedoresFANTASIA.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xFant;
    telaDados.tblFornecedoresINSC_RG.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.IEST;
    telaDados.tblFornecedoresENDERECO.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr;
    telaDados.tblFornecedoresNUM_END.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.nro;
    telaDados.tblFornecedoresCOMPLEMENTO.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xCpl;
    telaDados.tblFornecedoresBAIRRO_END.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xBairro;
    telaDados.tblFornecedoresCIDADE_END.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun;
    telaDados.tblFornecedoresUF_END.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF;
    telaDados.tblFornecedoresTELEFONE.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.EnderEmit.fone;
    telaDados.tblFornecedores.Post;
  end else begin
    idEmit := telaDados.qryFornecedores.FieldByName('ID').Value;
  end;

  //Produtos
  for i := 0 to telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Count -1 do begin
  telaDados.qryProdutos.Close;
  telaDados.qryProdutos.SQL.Clear;
  telaDados.qryProdutos.SQL.Add('Select * From PRODUTOS where DESCRICAO = '''+telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.xProd+ '''');
  telaDados.qryProdutos.Open;
  if telaDados.qryProdutos.RecordCount >= 1 then begin
    idProd := telaDados.qryProdutos.FieldByName('ID').Value;
    edtItem.Text := IntTOStr(idProd);
    buscarItem;
    //addItem;
  end;
  if telaDados.qryProdutos.RecordCount < 1 then begin
    //Cadastro de Produto
    telaDados.tblProdutos.Last;
    idProd := telaDados.tblProdutosID.Value + 1;
    telaDados.tblProdutos.Insert;
    telaDados.tblProdutosID.Value := idProd;
    telaDados.tblProdutosDESCRICAO.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.xProd;
    telaDados.tblProdutosEAN13.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.cEAN;
    telaDados.tblProdutosPRECO_COMPRA.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.vUnCom;
    telaDados.tblProdutosCFOP.Value := StrToInt(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.CFOP);
    //telaDados.tblProdutosCFOP.AsString := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.natOp;
    telaDados.tblProdutosUNIDADE.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.uTrib;

    //Cadastro de tributos do produto
    telaDados.qryCsosn.Close;
    telaDados.qryCsosn.SQL.Clear;
    telaDados.qryCsosn.SQL.Add('Select * from CSOSN where CODIGO = ');
    telaDados.qryCsosn.SQL.Add(CSOSNIcmsToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.CSOSN));
    telaDados.qryCsosn.Open;

    telaDados.qryCst.Close;
    telaDados.qryCst.SQL.Clear;
    telaDados.qryCst.SQL.Add('Select * from CST where CODIGO =');
    telaDados.qryCst.SQL.Add(CSTICMSToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.CST));
    telaDados.qryCst.Open;

    telaDados.qryOrigem.Close;
    telaDados.qryOrigem.SQL.Clear;
    telaDados.qryOrigem.SQL.Add('Select * from ORIGEM where CODIGO =');
    telaDados.qryOrigem.SQL.Add(OrigToStr(telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.orig));
    telaDados.qryOrigem.Open;

    telaDados.tblProdutosID_ORIGEM.Value := telaDados.qryOrigem.FieldByName('ID').Value;
    telaDados.tblProdutosID_CSOSN.Value := telaDados.qryCsosn.FieldByName('ID').Value;
    telaDados.tblProdutosID_CST.Value := telaDados.qryCst.FieldByName('ID').Value;

    //Valores de tributo dos produtos
    telaDados.tblProdutosBC_ICMS.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.vBC;
    telaDados.tblProdutosBC_ICMSSUB.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.vBCST;
    telaDados.tblProdutosBC_IPI.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.IPI.vBC;
    telaDados.tblProdutosBC_PIS.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.PIS.vBC;
    telaDados.tblProdutosBC_COFINS.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.COFINS.vBC;

    telaDados.tblProdutosVAL_ICMS.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.vICMS;
    telaDados.tblProdutosVAL_ICMSSUB.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.ICMS.vICMSST;
    telaDados.tblProdutosVAL_IPI.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.IPI.vIPI;
    telaDados.tblProdutosVAL_PIS.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.PIS.vPIS;
    telaDados.tblProdutosVAL_COFINS.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Imposto.COFINS.vCOFINS;

    telaDados.tblProdutos.Post;

    //Totais da Nota
  
  end;

  //telaDados.tblProdutos.Locate('ID',idProd, []);
  telaDados.cdsCTempItens.Insert;

  telaDados.cdsCTempItensDESCRICAO.Value := telaDados.tblProdutosDESCRICAO.Value;
  telaDados.cdsCTempItensID_PRODUTO.Value := telaDados.tblProdutosID.Value;
  telaDados.cdsCTempItensID_COMPRA.Value := StrToInt(editId.Text);
  telaDados.cdsCTempItensQUANTIDADE.AsFloat := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.qCom;
  telaDados.cdsCTempItensVALOR.Value := telaDados.tblProdutosPRECO_COMPRA.Value;
  telaDados.cdsCTempItensVALOR_TOTAL.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Det.Items[i].Prod.qCom * telaDados.tblProdutosPRECO_COMPRA.Value;
  telaDados.cdsCTempItensCFOP.Value := edtCfop.Text;

  addItem;


  end;

    {
  //telaDados.tblProdutos.Post; DANDO ERRO
  if telaDados.tblComprasVAL_IPI.AsString = '' then telaDados.tblComprasVAL_IPI.AsString := '0';
  if telaDados.tblComprasVAL_PIS.AsString = '' then telaDados.tblComprasVAL_PIS.AsString := '0';
  if telaDados.tblComprasVAL_COFINS.AsString = '' then telaDados.tblComprasVAL_COFINS.AsString := '0';
  if telaDados.tblComprasVAL_ICMS.AsString = '' then telaDados.tblComprasVAL_ICMS.AsString := '0';
  if telaDados.tblComprasVAL_ICMSSUB.AsString = '' then telaDados.tblComprasVAL_ICMSSUB.AsString := '0';

  telaDados.tblComprasVAL_IPI.AsString := FloatToStr(telaDados.tblProdutosVAL_IPI.AsFloat + StrToFloat(edtVIpi.Text));
  telaDados.tblComprasVAL_PIS.AsString := FloatToStr(telaDados.tblProdutosVAL_PIS.AsFloat + StrToFloat(edtVPis.Text));
  telaDados.tblComprasVAL_ICMSSUB.AsString := FloatToStr(telaDados.tblProdutosVAL_ICMSSUB.AsFloat + StrToFloat(edtVIcmsS.Text));
  telaDados.tblComprasVAL_ICMS.AsString := FloatToStr(telaDados.tblProdutosVAL_ICMS.AsFloat + StrToFloat(edtVIcms.Text));
  telaDados.tblComprasVAL_COFINS.AsString := FloatToStr(telaDados.tblProdutosVAL_COFINS.AsFloat + StrToFloat(edtVCofins.Text));

  telaDados.tblComprasVALOR_TOTAL.Value := telaDados.tblComprasVAL_IPI.Value +
  telaDados.tblComprasVAL_PIS.Value +
  telaDados.tblComprasVAL_ICMS.Value +
  telaDados.tblComprasVAL_ICMSSUB.Value +
  telaDados.tblComprasVAL_COFINS.Value +
  telaDados.tblComprasVALOR.Value;

  edtIQtd.Clear;
  edtIVrTotal.Clear;

  telaDados.cdsCTempItens.Post;
  end; }
  //telaDados.tblComprasnFor.Value := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Emit.xNome;
end;

procedure TtelaLancCompras.btnConfirmProdClick(Sender: TObject);
begin
addItem;
telaDados.FormataCampos;
end;

procedure TtelaLancCompras.addItem;
begin
  if telaDados.tblComprasVAL_IPI.AsString = '' then telaDados.tblComprasVAL_IPI.AsString := '0';
  if telaDados.tblComprasVAL_PIS.AsString = '' then telaDados.tblComprasVAL_PIS.AsString := '0';
  if telaDados.tblComprasVAL_COFINS.AsString = '' then telaDados.tblComprasVAL_COFINS.AsString := '0';
  if telaDados.tblComprasVAL_ICMS.AsString = '' then telaDados.tblComprasVAL_ICMS.AsString := '0';
  if telaDados.tblComprasVAL_ICMSSUB.AsString = '' then telaDados.tblComprasVAL_ICMSSUB.AsString := '0';

 { if edtIBIcms.Text     = '' then edtIBICms.Text := '0';
  if edtIBIcmssub.Text  = '' then edtIBICmssub.Text := '0';
  if edtIBIpi.Text      = '' then edtIBIpi.Text := '0';
  if edtIBPis.Text      = '' then edtIBPis.Text := '0';
  if edtIBCofins.Text   = '' then edtIBCofins.Text := '0';
  }
  //telaDados.cdsCTempItens.Close;
  //telaDados.cdsCTempItens.Open;

  if not(telaDados.cdsCTempItens.State = dsInsert) then begin
    if not(telaDados.cdsCTempItens.State = dsEdit) then begin
      telaDados.cdsCTempItens.Append;
     end;
  end;
  //telaDados.cdsCTempItensID.Value := 1;
  //telaDados.tblCompraItens.Open;
  telaDados.cdsCTempItensDESCRICAO.Value := telaDados.tblProdutosDESCRICAO.Value;
  telaDados.cdsCTempItensID_PRODUTO.Value := telaDados.tblProdutosID.Value;
  telaDados.cdsCTempItensID_COMPRA.Value := StrToInt(editId.Text);
  telaDados.cdsCTempItensQUANTIDADE.Value := StrToInt(edtIQtd.Text);
  telaDados.cdsCTempItensVALOR.Value := telaDados.tblProdutosPRECO_COMPRA.Value;
  telaDados.cdsCTempItensEAN13.Value := telaDados.tblProdutosEAN13.Value;
  telaDados.cdsCTempItensCFOP.Value := edtICfop.Text;

  //Checando campos em branco
  if telaDados.cdsCTempItensBC_IPI.AsString = '' then telaDados.cdsCTempItensBC_IPI.AsString := '0,00';
  if telaDados.cdsCTempItensBC_PIS.AsString = '' then telaDados.cdsCTempItensBC_PIS.AsString := '0,00';
  if telaDados.cdsCTempItensBC_COFINS.AsString = '' then telaDados.cdsCTempItensBC_COFINS.AsString := '0,00';
  if telaDados.cdsCTempItensBC_ICMS.AsString = '' then telaDados.cdsCTempItensBC_ICMS.AsString := '0,00';
  if telaDados.cdsCTempItensBC_ICMSSUB.AsString = '' then telaDados.cdsCTempItensBC_ICMSSUB.AsString := '0,00';

  if telaDados.cdsCTempItensVAL_IPI.AsString = '' then telaDados.cdsCTempItensVAL_IPI.AsString := '0,00';
  if telaDados.cdsCTempItensVAL_PIS.AsString = '' then telaDados.cdsCTempItensVAL_PIS.AsString := '0,00';
  if telaDados.cdsCTempItensVAL_COFINS.AsString = '' then telaDados.cdsCTempItensVAL_COFINS.AsString := '0,00';
  if telaDados.cdsCTempItensVAL_ICMS.AsString = '' then telaDados.cdsCTempItensVAL_ICMS.AsString := '0,00';
  if telaDados.cdsCTempItensVAL_ICMSSUB.AsString = '' then telaDados.cdsCTempItensVAL_ICMSSUB.AsString := '0,00';

  if telaDados.cdsCTempItensALIQUOTA_IPI.AsString = '' then telaDados.cdsCTempItensALIQUOTA_IPI.AsString := '0,00';
  if telaDados.cdsCTempItensALIQUOTA_PIS.AsString = '' then telaDados.cdsCTempItensALIQUOTA_PIS.AsString := '0,00';
  if telaDados.cdsCTempItensALIQUOTA_COFINS.AsString = '' then telaDados.cdsCTempItensALIQUOTA_COFINS.AsString := '0,00';
  if telaDados.cdsCTempItensALIQUOTA_ICMS.AsString = '' then telaDados.cdsCTempItensALIQUOTA_ICMS.AsString := '0,00';
  if telaDados.cdsCTempItensALIQUOTA_ICMSSUB.AsString = '' then telaDados.cdsCTempItensALIQUOTA_ICMSSUB.AsString := '0,00';

  {telaDados.cdsCTempItensBC_ICMS.Value           := StrTofLoat(edtIBIcms.Text);
  telaDados.cdsCTempItensBC_ICMSSUB.Value        := StrTofLoat(edtIBIcmssub.Text);
  telaDados.cdsCTempItensBC_PIS.Value            := StrTofLoat(edtIBPis.Text);
  telaDados.cdsCTempItensBC_COFINS.Value         := StrTofLoat(edtIBCofins.Text);
  telaDados.cdsCTempItensBC_IPI.Value            := StrTofLoat(edtIBIpi.Text);
  telaDados.cdsCTempItensVAL_ICMS.Value          := telaDados.tblProdutosVAL_ICMS.Value;
  telaDados.cdsCTempItensVAL_ICMSSUB.Value       := telaDados.tblProdutosVAL_ICMSSUB.Value;
  telaDados.cdsCTempItensVAL_PIS.Value           := telaDados.tblProdutosVAL_PIS.Value;
  telaDados.cdsCTempItensVAL_COFINS.Value        := telaDados.tblProdutosVAL_COFINS.Value;
  telaDados.cdsCTempItensVAL_IPI.Value           := telaDados.tblProdutosVAL_IPI.Value;
  telaDados.cdsCTempItensALIQUOTA_ICMS.Value     := telaDados.tblProdutosALIQUOTA_ICMS.Value;
  telaDados.cdsCTempItensALIQUOTA_ICMSSUB.Value  := telaDados.tblProdutosALIQUOTA_ICMSSUB.Value;
  telaDados.cdsCTempItensALIQUOTA_PIS.Value      := telaDados.tblProdutosALIQUOTA_PIS.Value;
  telaDados.cdsCTempItensALIQUOTA_COFINS.Value   := telaDados.tblProdutosALIQUOTA_COFINS.Value;
  telaDados.cdsCTempItensALIQUOTA_IPI.Value      := telaDados.tblProdutosALIQUOTA_IPI.Value;}

  //telaDados.cdsCTempItensDESCONTO.Value := 0;
  //telaDados.cdsCTempItensACRESCIMO.Value := 0;
  telaDados.cdsCTempItensVALOR_TOTAL.Value := StrToFloat(edtIVrTotal.Text);
  //end;
  //telaDados.tblProdutos.Post; DANDO ERRO
 { telaDados.tblComprasBC_ICMS.AsString := FloatToStr(telaDados.cdsCTempItensBC_ICMS.AsFloat + VIcms.Text));
  telaDados.tblComprasBC_ICMSSUB.AsString := FloatToStr(StrToFloat(edtIBIcmssub.Text) + StrToFloat(edtVIcmsS.Text));
  telaDados.tblComprasBC_PIS.AsString := FloatToStr(StrToFloat(edtIBPis.Text) + StrToFloat(edtVPis.Text));
  telaDados.tblComprasBC_COFINS.AsString := FloatToStr(StrToFloat(edtIBCofins.Text) + StrToFloat(edtVCofins.Text));
  telaDados.tblComprasBC_IPI.AsString := FloatToStr(StrToFloat(edtIBIpi.Text) + StrToFloat(edtVIpi.Text));
   }
  {telaDados.tblComprasVAL_IPI.AsString := FloatToStr(telaDados.tblProdutosVAL_IPI.AsFloat + StrToFloat(edtVIpi.Text));
  telaDados.tblComprasVAL_PIS.AsString := FloatToStr(telaDados.tblProdutosVAL_PIS.AsFloat + StrToFloat(edtVPis.Text));
  telaDados.tblComprasVAL_ICMSSUB.AsString := FloatToStr(telaDados.tblProdutosVAL_ICMSSUB.AsFloat + StrToFloat(edtVIcmsS.Text));
  telaDados.tblComprasVAL_ICMS.AsString := FloatToStr(telaDados.tblProdutosVAL_ICMS.AsFloat + StrToFloat(edtVIcms.Text));
  telaDados.tblComprasVAL_COFINS.AsString := FloatToStr(telaDados.tblProdutosVAL_COFINS.AsFloat + StrToFloat(edtVCofins.Text));
   }
  {telaDados.tblComprasVALOR_TOTAL.Value := telaDados.tblComprasVAL_IPI.Value +
  telaDados.tblComprasVAL_PIS.Value +
  telaDados.tblComprasVAL_ICMS.Value +
  telaDados.tblComprasVAL_ICMSSUB.Value +
  telaDados.tblComprasVAL_COFINS.Value +
  telaDados.tblComprasVALOR.Value; }

  telaDados.cdsCTempItens.Post;
  telaDados.cdsTempItens.ApplyUpdates(0);

  atualizarDadosProduto;

  edtIQtd.Clear;
  edtIVrTotal.Clear;


  limpaCamposProduto;
  edtItem.SetFocus;
end;


procedure TtelaLancCompras.PesquisarExecute(Sender: TObject);
begin
  Application.CreateForm(TtelaGerarNfeEntrada, telaGerarNfeEntrada);
  telaGerarNfeEntrada.Show;
end;

end.
