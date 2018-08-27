unit uCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDados, DB, Mask, DBCtrls, Buttons, ActnList,
  ACBrBase, ACBrSocket, ACBrNCMs, Grids, DBGrids, uPesNCM, uPesProduto,
  ACBrETQ, ACBrInStore, ACBrBarCode, ACBrIBPTax;

type
  TtelaCadProdutos = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    editId: TDBEdit;
    Label2: TLabel;
    editDesc: TDBEdit;
    Label3: TLabel;
    editRef: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    editEmb: TDBEdit;
    Label6: TLabel;
    editNcm: TDBEdit;
    Label7: TLabel;
    editEan: TDBEdit;
    Label8: TLabel;
    editDun: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    editEstoque: TDBEdit;
    Label10: TLabel;
    editDescMax: TDBEdit;
    Label11: TLabel;
    editComissao: TDBEdit;
    Label12: TLabel;
    editIcms: TDBEdit;
    Label13: TLabel;
    editIpi: TDBEdit;
    Label14: TLabel;
    editRedBas: TDBEdit;
    Label15: TLabel;
    editBaseST: TDBEdit;
    Label16: TLabel;
    editMva: TDBEdit;
    Label17: TLabel;
    editCompra: TDBEdit;
    Label18: TLabel;
    editVenda: TDBEdit;
    Label19: TLabel;
    editLucro: TDBEdit;
    cbAtivo: TDBCheckBox;
    cbCtrlEstoque: TDBCheckBox;
    cbFracionada: TDBCheckBox;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    ActionList1: TActionList;
    Incluir: TAction;
    Excluir: TAction;
    Confirmar: TAction;
    Cancelar: TAction;
    Pesquisar: TAction;
    Relatorio: TAction;
    Fechar: TAction;
    btnPncm: TSpeedButton;
    ACBrNCMs1: TACBrNCMs;
    cbUnidade: TDBComboBox;
    Image1: TImage;
    btnEditar: TBitBtn;
    Editar: TAction;
    Label20: TLabel;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    edtCfop: TDBEdit;
    Label22: TLabel;
    btnEstoque: TSpeedButton;
    panelEstoque: TPanel;
    Label25: TLabel;
    editEstQtd: TDBEdit;
    Label26: TLabel;
    DBEdit4: TDBEdit;
    Label27: TLabel;
    cbTipo: TComboBox;
    SpeedButton1: TSpeedButton;
    Label24: TLabel;
    cbCsosn: TComboBox;
    cbCst: TComboBox;
    cbOrigem: TComboBox;
    labelOrigem: TLabel;
    Label23: TLabel;
    editVendaP: TDBEdit;
    Label28: TLabel;
    editLucroP: TDBEdit;
    ACBrIBPTax1: TACBrIBPTax;
    edArquivo: TEdit;
    btnTeste: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    lblIbptM: TLabel;
    lblIbptE: TLabel;
    lblIbptN: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    cbTrib: TComboBox;
    Label32: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IncluirExecute(Sender: TObject);
    procedure ConfirmarExecute(Sender: TObject);
    procedure editLucroExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure editCompraExit(Sender: TObject);
    procedure btnPncmClick(Sender: TObject);
    procedure PesquisarExecute(Sender: TObject);
    procedure editEanExit(Sender: TObject);
    procedure editEanKeyPress(Sender: TObject; var Key: Char);
    procedure editIcmsExit(Sender: TObject);
    procedure editIpiExit(Sender: TObject);
    procedure editRedBasExit(Sender: TObject);
    procedure editBaseSTExit(Sender: TObject);
    procedure editMvaExit(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCfopKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadUniClick(Sender: TObject);
    procedure btnEstoqueClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure editLucroPExit(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure editNcmExit(Sender: TObject);
    procedure editVendaExit(Sender: TObject);
    procedure editVendaPExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure calculaValProd;
  end;

var
  telaCadProdutos: TtelaCadProdutos;

implementation

uses uCadUnidade;

{$R *.dfm}

procedure TtelaCadProdutos.FormShow(Sender: TObject);
begin

  
  //Formatando Campos
  telaDados.FormataCampos;

  //Preenchendo Combobox Unidades
  telaDados.qryUnidade.First;
  while not telaDados.qryUnidade.Eof do begin
    cbUnidade.Items.Add(telaDados.qryUnidade.FieldValues['SIGLA']);
    telaDados.qryUnidade.Next;
  end;

  telaDados.tblProdutos.Close;

  //Abrindo Banco
 { telaDados.tblProdutos.Open;

   editIcms.Text    := '0,00';
   editIpi.Text     := '0,00';
   editMva.Text     := '0,00';
   editBaseST.Text  := '0,00';
   editRedBas.Text  := '0,00';
   editCompra.Text  := '0,00';
   editLucro.Text   := '0,00';
   editVenda.Text   := '0,00';

   if editId.Text <> '' then begin

   telaDados.GeraBarrasEAN13(editEan.Text, telaCadProdutos.Image1.Canvas);


   if telaDados.tblProdutosID_TRIB.Value >= 0 then begin
    telaDados.qryTributos.Close;
    telaDados.qryTributos.SQL.Clear;
    telaDados.qryTributos.SQL.Add('Select * from TRIBUTO where id = ');
    telaDados.qryTributos.SQL.Add(telaDados.tblProdutosID_CSOSN.AsString);
    telaDados.qryTributos.Open;
    telaCadProdutos.cbTrib.ItemIndex := telaDados.qryTributos.FieldByName('ID').AsInteger ;
   end else begin
    telaCadProdutos.cbTrib.ItemIndex := -1;
   end;

   if telaDados.tblProdutosID_CSOSN.Value >= 1 then begin
    telaDados.qryCsosn.Close;
    telaDados.qryCsosn.SQL.Clear;
    telaDados.qryCsosn.SQL.Add('Select * from CSOSN where id = ');
    telaDados.qryCsosn.SQL.Add(telaDados.tblProdutosID_CSOSN.AsString);
    telaDados.qryCsosn.Open;
    telaCadProdutos.cbCsosn.ItemIndex := telaDados.qryCsosn.FieldByName('ID').Value;
   end else begin
    telaCadProdutos.cbCsosn.ItemIndex := -1;
   end;

   if telaDados.tblProdutosID_CST.Value >= 1 then begin
    telaDados.qryCst.Close;
    telaDados.qryCst.SQL.Clear;
    telaDados.qryCst.SQL.Add('Select * from CST where id =');
    telaDados.qryCst.SQL.Add(telaDados.tblProdutosID_CST.AsString);
    telaDados.qryCst.Open;
    telaCadProdutos.cbCst.ItemIndex := telaDados.qryCst.FieldByName('ID').Value;
   end else begin
    telaCadProdutos.cbCst.ItemIndex := -1;
   end;

   if telaDados.tblProdutosID_ORIGEM.Value >= 1 then begin
    telaDados.qryOrigem.Close;
    telaDados.qryOrigem.SQL.Clear;
    telaDados.qryOrigem.SQL.Add('Select * from ORIGEM where id =');
    telaDados.qryOrigem.SQL.Add(telaDados.tblProdutosID_ORIGEM.AsString);
    telaDados.qryOrigem.Open;
    telaCadProdutos.cbOrigem.ItemIndex := telaDados.qryOrigem.FieldByName('ID').Value;
   end else begin
    telaCadProdutos.cbOrigem.ItemIndex := -1;
   end;

  telaCadProdutos.Excluir.Enabled := true;

   end;}
end;

procedure TtelaCadProdutos.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TtelaCadProdutos.btnIncluirClick(Sender: TObject);
var
id : Integer;
begin
  telaDados.tblProdutos.Last;

  id := telaDados.tblProdutosID.Value + 1;

  telaDados.tblProdutos.Insert;
  telaDados.tblProdutosID.Value := id;

  editDesc.Enabled := true;
  editRef.Enabled := true;
  cbUnidade.Enabled := true;
  editEmb.Enabled := true;
  editNcm.Enabled := true;
  editEan.Enabled := true;
  editDun.Enabled := true;
  editEstoque.Enabled := true;
  editDescMax.Enabled := true;
  editComissao.Enabled := true;
  editIcms.Enabled := true;
  editIpi.Enabled := true;
  editRedBas.Enabled := true;
  editBaseST.Enabled := true;
  editMva.Enabled := true;
  editCompra.Enabled := true;
  editLucro.Enabled := true;
  editVenda.Enabled := true;
  cbTrib.Enabled := true;
  cbAtivo.Enabled := true;
  cbCtrlEstoque.Enabled := true;
  cbFracionada.Enabled := true;

  btnIncluir.Enabled := false;
  btnConfirmar.Enabled := true;
  btnCancelar.Enabled := true;

  Confirmar.Enabled := True;
  Incluir.Enabled := False;
  Cancelar.Enabled := True;

  editDesc.SetFocus;

  telaDados.tblProdutos.FieldByName('ativo').AsBoolean := false;
  telaDados.tblProdutos.FieldByName('fracionado').AsBoolean := false;
  telaDados.tblProdutos.FieldByName('controlador_estoque').AsBoolean := false;

  cbAtivo.Checked := false;
  cbFracionada.Checked := false;
  cbCtrlEstoque.Checked := false;
end;

procedure TtelaCadProdutos.btnConfirmarClick(Sender: TObject);
var
i : integer;
begin
  if editDesc.Text = '' then begin
    ShowMessage('Preencha o nome do produto');
    editDesc.SetFocus;
  Abort;
  end;
  if cbUnidade.Text = '' then begin
    ShowMessage('Preencha a unidade do produto');
    cbUnidade.SetFocus;
    Abort;
  end;
  if editNcm.Text = '' then begin
    ShowMessage('Preencha o código do produto');
    editNcm.SetFocus;
    Abort;
  end;
  if editCompra.Text = '' then begin
    ShowMessage('Preencha o preço de compra do produto');
    editCompra.SetFocus;
    Abort;
  end;
  if editLucro.Text = '' then begin
    ShowMessage('Preencha a margem de lucro');
    editLucro.SetFocus;
    Abort;
  end;

  i := 0;
  telaDados.tblProdutosUNIDADE.Value := cbUnidade.Text;

  telaDados.tblProdutosTIPOPROD.Value := i;

  telaDados.tblProdutos.Post;

  editDesc.Enabled := false;
  editRef.Enabled := false;
  cbUnidade.Enabled := false;
  editEmb.Enabled := false;
  editNcm.Enabled := false;
  editEan.Enabled := false;
  editDun.Enabled := false;
  editEstoque.Enabled := false;
  editDescMax.Enabled := false;
  editComissao.Enabled := false;
  editIcms.Enabled := false;
  editIpi.Enabled := false;
  editRedBas.Enabled := false;
  editBaseST.Enabled := false;
  editMva.Enabled := false;
  editCompra.Enabled := false;
  editLucro.Enabled := false;
  editVenda.Enabled := false;
  cbTrib.Enabled := false;
  cbAtivo.Enabled := false;
  cbCtrlEstoque.Enabled := false;
  cbFracionada.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;

  Confirmar.Enabled := false;
  Incluir.Enabled := true;
  Cancelar.Enabled := false;
end;

procedure TtelaCadProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  telaDados.tblProdutos.Close;
end;

procedure TtelaCadProdutos.IncluirExecute(Sender: TObject);
var
id : Integer;

begin
  telaDados.tblProdutos.Open;
  telaDados.tblProdutos.Last;

  id := telaDados.tblProdutosID.Value + 1;

  telaDados.tblProdutos.Insert;
  telaDados.tblProdutosID.Value := id;

  editDesc.Enabled := true;
  editRef.Enabled := true;
  cbUnidade.Enabled := true;
  editEmb.Enabled := true;
  editNcm.Enabled := true;
  editEan.Enabled := true;
  editDun.Enabled := true;
  {editEstoque.Enabled := true;}
  editDescMax.Enabled := true;
  editComissao.Enabled := true;
  editIcms.Enabled := true;
  editIpi.Enabled := true;
  editRedBas.Enabled := true;
  editBaseST.Enabled := true;
  editMva.Enabled := true;
  editCompra.Enabled := true;
  editLucro.Enabled := true;
  cbTrib.Enabled := true;
  cbAtivo.Enabled := true;
  cbCtrlEstoque.Enabled := true;
  cbFracionada.Enabled := true;
  cbCst.Enabled := true;
  cbCsosn.Enabled := true;
  edtCfop.Enabled := true;
  editLucroP.Enabled := true;
  cbOrigem.Enabled := true;
  editVenda.Enabled := true;
  editVendaP.Enabled := true;

  btnPncm.Enabled := true;
  btnIncluir.Enabled := false;
  btnConfirmar.Enabled := true;
  btnCancelar.Enabled := true;
  btnEditar.Enabled := false;

  Confirmar.Enabled := True;
  Incluir.Enabled := False;
  Cancelar.Enabled := True;
  Editar.Enabled := false;
  Pesquisar.Enabled := false;

  cbAtivo.Checked := false;
  cbFracionada.Checked := false;
  cbCtrlEstoque.Checked := false;


  editIcms.Text   := '0,00';
  editIpi.Text    := '0,00';
  editMva.Text    := '0,00';
  editBaseST.Text := '0,00';
  editRedBas.Text := '0,00';
  editCompra.Text := '0,00';
  editLucro.Text  := '0,00';
  editVenda.Text  := '0,00';
  editLucroP.Text := '0,00';
  editVendaP.Text := '0,00';

  cbCsosn.ItemIndex  := -1;
  cbCst.ItemIndex    := -1;
  cbOrigem.ItemIndex := -1;
  cbTrib.ItemIndex   := -1;
  editDesc.SetFocus;
end;

procedure TtelaCadProdutos.ConfirmarExecute(Sender: TObject);
var
i : integer;
iu : integer;
begin
  telaDados.qryProdutos.Close;
  telaDados.qryProdutos.SQL.Clear;
  telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS where EAN13 =');
  telaDados.qryProdutos.SQL.Add(editEan.Text);
  telaDados.qryProdutos.Open;
  if editDesc.Text = '' then begin
    ShowMessage('Preencha o nome do produto');
    editDesc.SetFocus;
    Abort;
  end;
  if cbUnidade.Text = '' then begin
    ShowMessage('Preencha a unidade do produto');
    cbUnidade.SetFocus;
    Abort;
  end else begin
  telaDados.qryUnidade.Close;
  telaDados.qryUnidade.SQL.Clear;
  telaDados.qryUnidade.SQL.Add('Select * from UNIDADE where SIGLA =');
  telaDados.qryUnidade.SQL.Add(QuotedStr(cbUnidade.Text));
  telaDados.qryUnidade.Open;
    if telaDados.qryUnidade.RecordCount < 1 then begin
      telaDados.tblUnidade.Last;
      iu := telaDados.tblUnidadeID.Value;
      telaDados.tblUnidade.Insert;
      telaDados.tblUnidadeID.Value := iu + 1;
      telaDados.tblUnidadeSIGLA.Value := cbUnidade.Text;
      telaDados.tblUnidade.Post;
    end;
  end;
  if editNcm.Text = '' then begin
    ShowMessage('Código do produto inválido');
    editNcm.SetFocus;
    Abort;
  end;
  if telaDados.qryProdutos.RecordCount > 1 then begin
    ShowMessage('Código EAN13 já existente');
    editEan.SetFocus;
    Abort;
  end;
  if editCompra.Text = '' then begin
    ShowMessage('Preencha o preço de compra do produto');
    editCompra.SetFocus;
    Abort;
  end;
  if editLucro.Text = '' then begin
    ShowMessage('Preencha a margem de lucro');
    editLucro.SetFocus;
    Abort;
  end;

  telaDados.tblProdutosUNIDADE.Value := cbUnidade.Text;

  if cbCsosn.ItemIndex >= 0 then begin
    telaDados.tblProdutosID_CSOSN.Value := cbCsosn.ItemIndex;
  end else begin
    telaDados.tblProdutosID_CSOSN.Value := -1;
  end;

  if cbTrib.ItemIndex >= 0 then begin
    telaDados.tblProdutosID_TRIB.Value := cbTrib.ItemIndex;
  end else begin
    telaDados.tblProdutosID_TRIB.Value := -1;
  end;

  if cbCst.ItemIndex >= 0 then begin
    telaDados.tblProdutosID_CST.Value   := cbCst.ItemIndex;
  end else begin
    telaDados.tblProdutosID_CST.Value := -1;
  end;

  if cbOrigem.ItemIndex >= 0 then begin
    telaDados.tblProdutosID_ORIGEM.Value:= cbOrigem.ItemIndex;
  end else begin
    telaDados.tblProdutosID_ORIGEM.Value := -1;
  end;

  telaDados.tblProdutos.Post;

  telaDados.tblFornecedores.Close;

  editDesc.Enabled := false;
  editRef.Enabled := false;
  cbUnidade.Enabled := false;
  editEmb.Enabled := false;
  editNcm.Enabled := false;
  editEan.Enabled := false;
  editDun.Enabled := false;
  {editEstoque.Enabled := false;}
  editDescMax.Enabled := false;
  editComissao.Enabled := false;
  editIcms.Enabled := false;
  editIpi.Enabled := false;
  editRedBas.Enabled := false;
  editBaseST.Enabled := false;
  editMva.Enabled := false;
  editCompra.Enabled := false;
  editLucro.Enabled := false;
  editVenda.Enabled := false;
  cbTrib.Enabled := false;
  cbAtivo.Enabled := false;
  cbCtrlEstoque.Enabled := false;
  cbFracionada.Enabled := false;
  cbCst.Enabled := false;
  cbCsosn.Enabled := false;
  edtCfop.Enabled := false;
  editLucroP.Enabled := false;
  editVendaP.Enabled := false;
  cbOrigem.Enabled := false;

  btnPncm.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  btnEditar.Enabled := true;

  Confirmar.Enabled := false;
  Incluir.Enabled := true;
  Cancelar.Enabled := false;
  Editar.Enabled := true;
end;

procedure TtelaCadProdutos.editLucroExit(Sender: TObject);
begin
  if editLucro.Text = '' then begin
    editLucro.Text := '0,00';
  end else begin

    telaDados.tblProdutosPRECO_VENDA.AsString := FloatToStr(StrToFloat(editCompra.Text) + (StrToFloat(editCompra.Text) * StrToFloat(editLucro.Text))/100);
    {telaDados.FormataCampos; }
  end;
end;

procedure TtelaCadProdutos.btnCancelarClick(Sender: TObject);
begin
  telaDados.tblProdutos.Cancel;

  editDesc.Enabled := false;
  editRef.Enabled := false;
  cbUnidade.Enabled := false;
  editEmb.Enabled := false;
  editNcm.Enabled := false;
  editEan.Enabled := false;
  editDun.Enabled := false;
  editEstoque.Enabled := false;
  editDescMax.Enabled := false;
  editComissao.Enabled := false;
  editIcms.Enabled := false;
  editIpi.Enabled := false;
  editRedBas.Enabled := false;
  editBaseST.Enabled := false;
  editMva.Enabled := false;
  editCompra.Enabled := false;
  editLucro.Enabled := false;
  editVenda.Enabled := false;
  cbTrib.Enabled := false;
  cbAtivo.Enabled := false;
  cbCtrlEstoque.Enabled := false;
  cbFracionada.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;

  Confirmar.Enabled := false;
  Incluir.Enabled := true;
  Cancelar.Enabled := false;
end;

procedure TtelaCadProdutos.CancelarExecute(Sender: TObject);
begin
  telaDados.tblProdutos.Cancel;
  telaDados.tblProdutos.Close;

  editDesc.Enabled := false;
  editRef.Enabled := false;
  cbUnidade.Enabled := false;
  editEmb.Enabled := false;
  editNcm.Enabled := false;
  editEan.Enabled := false;
  editDun.Enabled := false;
  {editEstoque.Enabled := false;}
  editDescMax.Enabled := false;
  editComissao.Enabled := false;
  editIcms.Enabled := false;
  editIpi.Enabled := false;
  editRedBas.Enabled := false;
  editBaseST.Enabled := false;
  editMva.Enabled := false;
  editCompra.Enabled := false;
  editLucro.Enabled := false;
  editVenda.Enabled := false;
  cbTrib.Enabled := false;
  cbAtivo.Enabled := false;
  cbCtrlEstoque.Enabled := false;
  cbFracionada.Enabled := false;
  cbCst.Enabled := false;
  cbCsosn.Enabled := false;
  edtCfop.Enabled := false;
  editLucroP.Enabled := false;
  editVendaP.Enabled := false;
  cbOrigem.Enabled := false;
  editVenda.Enabled := false;
  editVendaP.Enabled := false;

  btnPncm.Enabled := false;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  btnEditar.Enabled := true;

  Confirmar.Enabled := false;
  Incluir.Enabled := true;
  Cancelar.Enabled := false;
  Editar.Enabled := true;
  Pesquisar.Enabled := true;

  cbCsosn.ItemIndex  := -1;
  cbCst.ItemIndex    := -1;
  cbOrigem.ItemIndex := -1;
  cbTrib.ItemIndex   := -1;
end;

procedure TtelaCadProdutos.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TtelaCadProdutos.editCompraExit(Sender: TObject);
begin
  {calculaValProd;}
  {editVenda.Text := FloatToStr(StrToFloat(editCompra.Text) + StrToFloat(editLucro.Text));
  telaDados.FormataCampos;}
end;

procedure TtelaCadProdutos.btnPncmClick(Sender: TObject);
var
i : integer;
begin
{
ACBrNCMs1.ListarNcms();
i := 1;
while i<11000 {ACBrNCMs1.NCMS.Count}{ do begin
telaDados.tblNCM.Append;
telaDados.tblNCM.FieldByName('CodNCM').Value := ACBrNCMs1.NCMS[i].CodigoNcm;
telaDados.tblNCM.FieldByName('CodCatNCM').Value := ACBrNCMs1.NCMS[i].CodigoCategoriaNcm;
telaDados.tblNCM.FieldByName('DescCatNCM').Value := ACBrNCMs1.NCMS[i].DescrCategoriaNcm;
telaDados.tblNCM.FieldByName('DescNCM').Value := ACBrNCMs1.NCMS[i].DescricaoNcm;
telaDados.tblNCM.Post;
i := i + 1;
end;
}
  Application.CreateForm(TtelaPesNCM, telaPesNCM);
  telaPesNCM.Show;
end;

procedure TtelaCadProdutos.PesquisarExecute(Sender: TObject);
begin
  Application.CreateForm(TtelaPesProduto, telaPesProduto);
  telaPesProduto.Show;
  telaDados.tblProdutos.Open;
end;

procedure TtelaCadProdutos.calculaValProd();
var
mva, icms, ipi, redBase, baseSt, compra, mLucro, vIcms, vIpi, vRedBase, vBaseSt, vMva : double;
resultado : double;
begin
try
  if editIcms.Text = '' then editIcms.Text     := '0,00';
  if editIpi.Text = '' then editIpi.Text       := '0,00';
  if editRedBas.Text = '' then editRedBas.Text := '0,00';
  if editBaseST.Text = '' then editBaseSt.Text := '0,00';
  if editCompra.Text = '' then editCompra.Text := '0,00';
  if editLucro.Text = '' then editLucro.Text   := '0,00';
  if editMva.Text = '' then editMva.Text       := '0,00';

  icms    := StrToFloat(editIcms.Text)/100;
  ipi     := StrToFloat(editIpi.Text)/100;
  redBase := StrToFloat(editRedBas.Text)/100;
  baseSt  := StrToFloat(editBaseST.Text)/100;
  compra  := StrToFloat(editCompra.Text);
  mLucro  := StrToFloat(editLucro.Text);

  {
  Base do ICMS ST = (Valor do produto + Valor do IPI + Frete + Seguro +
                     Outras Despesas Acessórias – Descontos)
                    * (1+(%MVA / 100))
   }
  if redBase>0 then
  begin
    vRedBase := compra * redBase;
    vIcms    := (compra - vRedBase) * icms;
    vIpi     := (compra - vRedBase) * ipi;
  end
  else begin
    vIcms := compra * icms;
    vIpi  :=  compra * ipi;
  end;
    telaDados.tblProdutosVAL_IPI.Value  := vIpi;
    telaDados.tblProdutosVAL_ICMS.Value := vIcms;
    compra := compra + vIcms + vIpi;             
    editCompra.Text := FloatToStr(compra);
  except
    ShowMessage('Erro');
  end;
end;

procedure TtelaCadProdutos.editEanExit(Sender: TObject);
begin
  if Length(editEan.Text) < 13 then begin
    ShowMessage('Código EAN deve conter 13 caracteres');
  end else
  begin
    telaDados.GeraBarrasEAN13(editEan.Text, Image1.Canvas);
  end;     
end;

procedure TtelaCadProdutos.editEanKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadProdutos.editIcmsExit(Sender: TObject);
begin
  if editIcms.Text = '' then editIcms.Text := '0,00';
end;

procedure TtelaCadProdutos.editIpiExit(Sender: TObject);
begin
  if editIpi.Text = '' then editIpi.Text := '0,00';
end;

procedure TtelaCadProdutos.editRedBasExit(Sender: TObject);
begin
  if editRedBas.Text = '' then editRedBas.Text := '0,00';
end;

procedure TtelaCadProdutos.editBaseSTExit(Sender: TObject);
begin
  if editBaseST.Text = '' then editBaseST.Text := '0,00';
end;

procedure TtelaCadProdutos.editMvaExit(Sender: TObject);
begin
  if editMva.Text = '' then editMva.Text := '0,00';
end;

procedure TtelaCadProdutos.EditarExecute(Sender: TObject);
begin
  telaDados.tblProdutos.Open;
  telaDados.tblProdutos.Edit;

  Incluir.Enabled := false;
  Excluir.Enabled := true;
  Cancelar.Enabled := true;
  Editar.Enabled := false;
  Confirmar.Enabled := true;

  btnIncluir.Enabled := false;
  btnExcluir.Enabled := true;
  btnCancelar.Enabled := true;
  btnEditar.Enabled := false;
  btnConfirmar.Enabled := true;

  editDesc.Enabled := true;
  editRef.Enabled := true;
  cbUnidade.Enabled := true;
  editEmb.Enabled := true;
  editNcm.Enabled := true;
  editEan.Enabled := true;
  editDun.Enabled := true;
  {editEstoque.Enabled := true;}
  editDescMax.Enabled := true;
  editComissao.Enabled := true;
  editIcms.Enabled := true;
  editIpi.Enabled := true;
  editRedBas.Enabled := true;
  editBaseST.Enabled := true;
  editMva.Enabled := true;
  editCompra.Enabled := true;
  editLucro.Enabled := true;
  cbTrib.Enabled := true;
  cbAtivo.Enabled := true;
  cbCtrlEstoque.Enabled := true;
  cbFracionada.Enabled := true;
  cbCst.Enabled := true;
  cbCsosn.Enabled := true;
  edtCfop.Enabled := true;
  editLucroP.Enabled := true;
  cbOrigem.Enabled := true;
  editVenda.Enabled := true;
  editVendaP.Enabled := true;

  cbAtivo.Checked := false;
  cbFracionada.Checked := false;
  cbCtrlEstoque.Checked := false;

  btnPncm.Enabled := true;
end;

procedure TtelaCadProdutos.ExcluirExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Deseja excluir este cadastro?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

    telaDados.tblProdutos.Open;

    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Delete from produtos where id = ');
    telaDados.qryProdutos.SQL.Add(editId.Text);
    telaDados.qryProdutos.Open;

    telaDados.tblProdutos.Refresh;
    telaDados.tblProdutos.Close;
  end;
end;

procedure TtelaCadProdutos.FormCreate(Sender: TObject);
begin
  with telaDados.tblTributos do
  begin
    First;
    while not Eof do
    begin
      cbTrib.Items.Add(telaDados.tblTributos.FieldByName('ID').AsString + ' - ' + telaDados.tblTributos.FieldByName('TIPOTRIB').AsString);
      Next;
     end;
  end;
  with telaDados.tblOrigem do
  begin
    First;
    while not Eof do
    begin
      cbOrigem.Items.Add(telaDados.tblOrigem.FieldByName('CODIGO').AsString + ' - ' + telaDados.tblOrigem.FieldByName('DESCRICAO').AsString);
      Next;
     end;
  end;
  with telaDados.tblCsosn do
  begin
    First;
    while not Eof do
    begin
      cbCsosn.Items.Add(telaDados.tblCsosn.FieldByName('CODIGO').AsString + ' - ' + telaDados.tblCsosn.FieldByName('DESCRICAO').AsString);
      Next;
     end;
  end;
  with telaDados.tblCst do
  begin
    First;
    while not Eof do
    begin
      cbCst.Items.Add(telaDados.tblCst.FieldByName('CODIGO').AsString + ' - ' + telaDados.tblCst.FieldByName('DESCRICAO').AsString);
      Next;
     end;
  end;
end;

procedure TtelaCadProdutos.edtCfopKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadProdutos.btnCadUniClick(Sender: TObject);
begin
  Application.CreateForm(TtelaCadUnidade, telaCadUnidade);
  telaCadUnidade.Show;
end;

procedure TtelaCadProdutos.btnEstoqueClick(Sender: TObject);
var i : integer;
begin
  telaDados.tblEstoqueDATA.DisplayFormat               := 'dd/mm/yyyy hh:mm:ss';
  telaDados.tblEstoque.FieldByName('DATA').EditMask    := '!99/99/0000 00:00:00;1; ';

  if editDesc.Text <> '' then begin
    panelEstoque.Visible := true;
    editEstQtd.SetFocus;
    telaDados.tblEstoque.Last;
    i := telaDados.tblEstoqueID.Value;
    telaDados.tblEstoque.Insert;
    telaDados.tblEstoqueDATA.AsString := DateToStr(date()) + ' ' +  TimeToStr(time());
    telaDados.tblEstoqueID.Value := i + 1;
  end else begin
    ShowMessage('Selecione um produto!');
  end;
end;

procedure TtelaCadProdutos.SpeedButton1Click(Sender: TObject);
begin
  telaDados.tblEstoqueID_PRODUTO.Value := StrToInt(editId.Text);
  case cbTipo.ItemIndex of
    0 : telaDados.tblEstoqueTIPO.Value := 'E';
    1 : telaDados.tblEstoqueTIPO.Value := 'S';
  end;
  telaDados.tblEstoque.Post;
  panelEstoque.Visible := false;
end;

procedure TtelaCadProdutos.editLucroPExit(Sender: TObject);
begin
  if editLucroP.Text = '' then begin
    editLucroP.Text := '0,00';
  end else begin

  telaDados.tblProdutosPRECO_VENDAP.AsString := FloatToStr(StrToFloat(editVenda.Text) + (StrToFloat(editVenda.Text) * StrToFloat(editLucroP.Text))/100);  
  end;
end;

procedure TtelaCadProdutos.btnTesteClick(Sender: TObject);
var I: integer;
begin

  if OpenDialog1.Execute then
  begin
    edArquivo.Text := OpenDialog1.FileName;

    // se o path do arquivo não for passado, então o componente vai tentar baixar
    // a tabela no URL informado

    try
      if ACBrIBPTax1.AbrirTabela(edArquivo.Text) then
      begin
        {lVersao.Caption := 'Versão: ' + ACBrIBPTax1.VersaoArquivo;
        lbVigencia.Caption := 'Vigência: ' + Format('%s a %s', [DateToStr(ACBrIBPTax1.VigenciaInicio), DateToStr(ACBrIBPTax1.VigenciaFim)]);
        lblChave.Caption := 'Chave: ' + ACBrIBPTax1.ChaveArquivo;
        lblFonte.Caption := 'Fonte: ' + ACBrIBPTax1.Fonte;  }

        telaDados.tblIbpt.Open;
  
        try
          for I := 0 to ACBrIBPTax1.Itens.Count - 1 do
          begin
            telaDados.tblIbpt.Insert;
            telaDados.tblIbptNCM.AsString             := ACBrIBPTax1.Itens[I].NCM;
            telaDados.tblIbptDESCRICAO.AsString       := ACBrIBPTax1.Itens[I].Descricao;
            telaDados.tblIbptEXC.AsString             := ACBrIBPTax1.Itens[I].Excecao;
            telaDados.tblIbptTABELA.AsInteger         := Integer(ACBrIBPTax1.Itens[I].Tabela);
            telaDados.tblIbptNACIONAL.AsFloat         := ACBrIBPTax1.Itens[I].FederalNacional;
            telaDados.tblIbptIMPORTADO.AsFloat        := ACBrIBPTax1.Itens[I].FederalImportado;
            telaDados.tblIbptESTADUAL.AsFloat         := ACBrIBPTax1.Itens[I].Estadual;
            telaDados.tblIbptMUNICIPAL.AsFloat        := ACBrIBPTax1.Itens[I].Municipal;
            telaDados.tblIbpt.Post;
          end;
        finally
          telaDados.tblIbpt.First;

        end;
      end;
    finally
      ShowMessage('Tabela baixada com sucesso');
    end;
  end;
end;

procedure TtelaCadProdutos.editNcmExit(Sender: TObject);
var
  ex, descricao: String;
  tabela: Integer;
  aliqFedNac, aliqFedImp, aliqEst, aliqMun: Double;
begin
  ACBrIBPTax1.AbrirTabela('C:\Users\Bruno\Documents\IBPT\18.1.A\TabelaIBPTaxCE18.1.A.csv');     //LEMBRAR DE ALTERAR
  if ACBrIBPTax1.Procurar(editNcm.Text, ex, descricao, tabela, aliqFedNac, aliqFedImp, aliqEst, aliqMun) then
  begin
      lblIbptE.caption :=  FloatToStr(aliqEst);
      lblIbptM.Caption :=  FloatToStr(aliqMun);
      lblIbptN.Caption :=  FloatToStr(aliqFedNac);
      {ShowMessage(
      'Código: '    + edArquivo.Text  + sLineBreak +
      'Exceção: '   + ex + sLineBreak +
      'Descrição: ' + descricao + sLineBreak +
      'Tabela: '    + IntToStr(tabela) + sLineBreak +
      'Aliq Federal Nacional: '  + FloatToStr(aliqFedNac) + sLineBreak +
      'Aliq Federal Importado: '  + FloatToStr(aliqFedImp) + sLineBreak +
      'Aliq Estadual: '  + FloatToStr(aliqEst) + sLineBreak +
      'Aliq Municipal: '  + FloatToStr(aliqMun)
      ) }
  end
  else begin
    showmessage('Código não encontrado!');
    editNcm.SetFocus;
  end;
end;



procedure TtelaCadProdutos.editVendaExit(Sender: TObject);
begin
  telaDados.tblProdutosMARGEM_LUCRO.AsString :=  FloatToStr(((StrToFloat(editVenda.Text) - StrToFloat(editCompra.Text)) / StrToFloat(editCompra.Text) )* 100);

  if editVenda.Text = '' then begin
    editVenda.Text := '0,00';
  end;

end;

procedure TtelaCadProdutos.editVendaPExit(Sender: TObject);
begin

  telaDados.tblProdutosMARGEM_LUCROP.AsString :=  FloatToStr(((StrToFloat(editVendaP.Text) - StrToFloat(editVenda.Text)) / StrToFloat(editVenda.Text) )* 100);


  if editVenda.Text = '' then begin
    editVenda.Text := '0,00';
  end;
end;

end.
