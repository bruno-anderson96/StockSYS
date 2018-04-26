unit uCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDados, DB, Mask, DBCtrls, Buttons, ActnList,
  ACBrBase, ACBrSocket, ACBrNCMs, Grids, DBGrids, uPesNCM, uPesProduto,
  ACBrETQ, ACBrInStore, ACBrBarCode;

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
    btnRelatorio: TBitBtn;
    btnFechar: TBitBtn;
    radTipoProduto: TRadioGroup;
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
    cbCsosn: TComboBox;
    Label20: TLabel;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    edtCfop: TDBEdit;
    Label22: TLabel;
    cbCst: TComboBox;
    btnEstoque: TSpeedButton;
    Panel2: TPanel;
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

  //Abrindo Banco
  telaDados.tblProdutos.Open;

   editIcms.Text    := '0,00';
   editIpi.Text     := '0,00';
   editMva.Text     := '0,00';
   editBaseST.Text  := '0,00';
   editRedBas.Text  := '0,00';
   editCompra.Text  := '0,00';
   editLucro.Text   := '0,00';
   editVenda.Text   := '0,00';
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
  radTipoProduto.Enabled := true;
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
  Case radTipoProduto.ItemIndex of
    0 : i := 0;
    1 : i := 1;
    2 : i := 2;
    3 : i := 3;
    4 : i := 4;
  end;
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
  radTipoProduto.Enabled := false;
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
  radTipoProduto.Enabled := true;
  cbAtivo.Enabled := true;
  cbCtrlEstoque.Enabled := true;
  cbFracionada.Enabled := true;
  cbCst.Enabled := true;
  cbCsosn.Enabled := true;
  edtCfop.Enabled := true;
  btnPncm.Enabled := true;

  btnIncluir.Enabled := false;
  btnConfirmar.Enabled := true;
  btnCancelar.Enabled := true;
  btnEditar.Enabled := false;

  Confirmar.Enabled := True;
  Incluir.Enabled := False;
  Cancelar.Enabled := True;
  Editar.Enabled := false;

  cbAtivo.Checked := false;
  cbFracionada.Checked := false;
  cbCtrlEstoque.Checked := false;


  editIcms.Text := '0,00';
  editIpi.Text := '0,00';
  editMva.Text := '0,00';
  editBaseST.Text := '0,00';
  editRedBas.Text := '0,00';
  editCompra.Text := '0,00';
  editLucro.Text := '0,00';
  editVenda.Text := '0,00';

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

  i := 0;
  telaDados.tblProdutosUNIDADE.Value := cbUnidade.Text;
  Case radTipoProduto.ItemIndex of
    0 : i := 0;
    1 : i := 1;
    2 : i := 2;
    3 : i := 3;
    4 : i := 4;
  end;
  telaDados.tblProdutosTIPOPROD.Value := i;
  telaDados.tblProdutosID_CSOSN.Value := cbCsosn.ItemIndex;
  telaDados.tblProdutosTIPOPROD.Value := radTipoProduto.ItemIndex;
  telaDados.tblProdutosID_CST.Value   := cbCst.ItemIndex;
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
  radTipoProduto.Enabled := false;
  cbAtivo.Enabled := false;
  cbCtrlEstoque.Enabled := false;
  cbFracionada.Enabled := false;
  cbCst.Enabled := false;
  cbCsosn.Enabled := false;
  edtCfop.Enabled := false;

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
  editVenda.Text := FloatToStr(StrToFloat(editCompra.Text) + StrToFloat(editLucro.Text));
  telaDados.FormataCampos;
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
  radTipoProduto.Enabled := false;
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
  radTipoProduto.Enabled := false;
  cbAtivo.Enabled := false;
  cbCtrlEstoque.Enabled := false;
  cbFracionada.Enabled := false;
  cbCst.Enabled := false;
  cbCsosn.Enabled := false;
  edtCfop.Enabled := false;

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

procedure TtelaCadProdutos.FecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TtelaCadProdutos.editCompraExit(Sender: TObject);
begin
  {calculaValProd;}
  editVenda.Text := FloatToStr(StrToFloat(editCompra.Text) + StrToFloat(editLucro.Text));
  telaDados.FormataCampos;
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
  radTipoProduto.Enabled := true;
  cbAtivo.Enabled := true;
  cbCtrlEstoque.Enabled := true;
  cbFracionada.Enabled := true;
  cbCst.Enabled := true;
  cbCsosn.Enabled := true;
  edtCfop.Enabled := true;

  cbAtivo.Checked := false;
  cbFracionada.Checked := false;
  cbCtrlEstoque.Checked := false;

  btnPncm.Enabled := true;
end;

procedure TtelaCadProdutos.ExcluirExecute(Sender: TObject);
begin
  telaDados.qryProdutos.Close;
  telaDados.qryProdutos.SQL.Clear;
  telaDados.qryProdutos.SQL.Add('Delete from produtos where id = ');
  telaDados.qryProdutos.SQL.Add(editId.Text);
  telaDados.qryProdutos.Open;

  telaDados.tblProdutos.Refresh;
end;

procedure TtelaCadProdutos.FormCreate(Sender: TObject);
begin
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

end.
