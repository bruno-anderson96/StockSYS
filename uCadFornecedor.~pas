unit uCadFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDados, Mask, DBCtrls, Buttons, ActnList,
  ACBrBase, ACBrSocket, ACBrCEP, uPesFornecedor;

type
  TtelaCadFor = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    editId: TDBEdit;
    Label2: TLabel;
    editNome: TDBEdit;
    Label3: TLabel;
    editEndereco: TDBEdit;
    Label4: TLabel;
    editNum: TDBEdit;
    Label5: TLabel;
    editBairro: TDBEdit;
    Label6: TLabel;
    editCidade: TDBEdit;
    Label7: TLabel;
    editCep: TDBEdit;
    Label8: TLabel;
    editTel1: TDBEdit;
    Label9: TLabel;
    editTel2: TDBEdit;
    Label10: TLabel;
    editCnpj: TDBEdit;
    Label11: TLabel;
    editInsc: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    editEmail: TDBEdit;
    btnCep: TSpeedButton;
    labelCompl: TLabel;
    editCompl: TDBEdit;
    ActionList1: TActionList;
    actIncluir: TAction;
    actExcluir: TAction;
    actConfirmar: TAction;
    actCancelar: TAction;
    actPesquisar: TAction;
    actFechar: TAction;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnFechar: TBitBtn;
    ACBrCEP1: TACBrCEP;
    actEditar: TAction;
    btnEditar: TBitBtn;
    Label14: TLabel;
    editFantasia: TDBEdit;
    editUf: TComboBox;
    Label15: TLabel;
    editContato: TDBEdit;
    procedure actCancelarExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure btnCepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure editCepKeyPress(Sender: TObject; var Key: Char);
    procedure editTel1KeyPress(Sender: TObject; var Key: Char);
    procedure editTel2KeyPress(Sender: TObject; var Key: Char);
    procedure editCnpjKeyPress(Sender: TObject; var Key: Char);
    procedure editInscKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaCadFor: TtelaCadFor;

implementation

{$R *.dfm}

procedure TtelaCadFor.actCancelarExecute(Sender: TObject);
begin
  telaDados.tblFornecedores.Cancel;
  telaDados.tblFornecedores.Close;

  btnCep.Enabled := false;

  editNome.Enabled := false;
  editCep.Enabled := false;
  editCidade.Enabled := false;
  editEndereco.Enabled := false;
  editBairro.Enabled := false;
  editNum.Enabled := false;
  editCompl.Enabled := false;
  editUf.Enabled := false;
  editTel1.Enabled := false;
  editTel2.Enabled := false;
  editCnpj.Enabled := false;
  editInsc.Enabled := false;
  editEmail.Enabled := false;
  editFantasia.Enabled := false;
  editContato.Enabled := false;

  actExcluir.Enabled := true;
  actConfirmar.Enabled := false;
  actCancelar.Enabled := false;
  actIncluir.Enabled := true;
  actEditar.Enabled := true;

  btnExcluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  btnIncluir.Enabled := true;
  btnEditar.Enabled := true;

end;

procedure TtelaCadFor.actConfirmarExecute(Sender: TObject);
begin
  if (editNome.Text = '') then begin
    ShowMessage('Por favor digite o Nome');
    editNome.SetFocus;
    Abort;
  end;
  if (editCep.Text = '') then begin
    ShowMessage('Por favor digite o CEP');
    editCep.SetFocus;
    Abort;
  end;
  if (editEndereco.GetTextLen < 2 ) then begin
    ShowMessage('Digite um endereço Válido');
    editEndereco.SetFocus;
    Abort;
  end;
  if (editBairro.GetTextLen < 2) then begin
    ShowMessage('Por favor digite o Bairro');
    editBairro.SetFocus;
    Abort;
  end;
  if (editNum.Text = '') then begin
    ShowMessage('Por favor digite o Número');
    editNum.SetFocus;
    Abort;
  end;
  if (editCidade.Text = '') then begin
    ShowMessage('Por favor digite o Cidade');
    editCidade.SetFocus;
    Abort;
  end;
  if (editTel1.Text = '') and (editTel2.Text = '') then begin
    ShowMessage('Por favor digite um Telefone');
    editTel1.SetFocus;
    Abort;
  end;
  if not (telaDados.verificaCnpj(editCnpj.Text)) then begin
    ShowMessage('Cnpj Inválido');
    editCnpj.SetFocus;
    Abort;
  end;

  telaDados.tblFornecedoresUF_END.Value := editUf.Text;
  telaDados.tblFornecedores.Post;
  telaDados.trnscFornecedores.CommitRetaining;
  telaDados.tblFornecedores.ApplyUpdates;
  //telaDados.tblFornecedores.Close;

  btnCep.Enabled := false;

  editNome.Enabled := false;
  editCep.Enabled := false;
  editCidade.Enabled := false;
  editEndereco.Enabled := false;
  editBairro.Enabled := false;
  editNum.Enabled := false;
  editCompl.Enabled := false;
  editUf.Enabled := false;
  editTel1.Enabled := false;
  editTel2.Enabled := false;
  editCnpj.Enabled := false;
  editInsc.Enabled := false;
  editEmail.Enabled := false;
  editFantasia.Enabled := false;
  editContato.Enabled := false;

  actExcluir.Enabled := true;
  actConfirmar.Enabled := false;
  actCancelar.Enabled := false;
  actIncluir.Enabled := true;
  actEditar.Enabled := true;

  btnExcluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  btnIncluir.Enabled := true;
  btnEditar.Enabled := true;
end;

procedure TtelaCadFor.actIncluirExecute(Sender: TObject);
var
id : integer;
begin
  telaDados.tblFornecedores.Open;
  telaDados.tblFornecedores.Last;

  id := telaDados.tblFornecedoresID.Value + 1;

  telaDados.tblFornecedores.Insert;
  telaDados.tblFornecedoresID.Value := id;

  btnCep.Enabled := true;

  editNome.Enabled := true;
  editCep.Enabled := true;
  editCidade.Enabled := true;
  editEndereco.Enabled := true;
  editBairro.Enabled := true;
  editNum.Enabled := true;
  editCompl.Enabled := true;
  editUf.Enabled := true;
  editTel1.Enabled := true;
  editTel2.Enabled := true;
  editCnpj.Enabled := true;
  editInsc.Enabled := true;
  editEmail.Enabled := true;
  editFantasia.Enabled := true;
  editContato.Enabled := true;

  editNome.SetFocus;

  actExcluir.Enabled   := false;
  actConfirmar.Enabled := true;
  actCancelar.Enabled  := true;
  actIncluir.Enabled   := false;
  actEditar.Enabled    := false;

  btnExcluir.Enabled   := false;
  btnConfirmar.Enabled := true;
  btnCancelar.Enabled  := true;
  btnIncluir.Enabled   := false;
  btnEditar.Enabled    := false;

  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      editUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;
end;

procedure TtelaCadFor.actFecharExecute(Sender: TObject);
begin
  telaCadFor.Close;
end;

procedure TtelaCadFor.btnCepClick(Sender: TObject);
var i : integer;
begin
  ACBrCEP1.BuscarPorCEP(editCep.Text);

  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    telaDados.tblFornecedoresCEP_END.AsString     := UpperCase(ACBrCEP1.Enderecos[i].CEP);
    telaDados.tblFornecedoresENDERECO.AsString    := UpperCase(ACBrCEP1.Enderecos[i].Logradouro);
    telaDados.tblFornecedoresCOMPLEMENTO.AsString := UpperCase(ACBrCEP1.Enderecos[i].Complemento);
    telaDados.tblFornecedoresCIDADE_END.AsString  := UpperCase(ACBrCEP1.Enderecos[i].Municipio);
    editUf.Text                                   := UpperCase(ACBrCEP1.Enderecos[i].UF);
    telaDados.tblFornecedoresBAIRRO_END.AsString  := UpperCase(ACBrCEP1.Enderecos[i].Bairro);
  end;
end;

procedure TtelaCadFor.FormShow(Sender: TObject);
begin
  telaDados.FormataCampos;
end;

procedure TtelaCadFor.actPesquisarExecute(Sender: TObject);
begin
  Application.CreateForm(TtelaPesFor, telaPesFor);
  telaPesFor.Show;
  telaDados.tblFornecedores.Open;
end;

procedure TtelaCadFor.actEditarExecute(Sender: TObject);
begin
  telaDados.tblFornecedores.Open;

  btnCep.Enabled := true;

  editNome.Enabled := true;
  editCep.Enabled := true;
  editCidade.Enabled := true;
  editEndereco.Enabled := true;
  editBairro.Enabled := true;
  editNum.Enabled := true;
  editCompl.Enabled := true;
  editUf.Enabled := true;
  editTel1.Enabled := true;
  editTel2.Enabled := true;
  editCnpj.Enabled := true;
  editInsc.Enabled := true;
  editEmail.Enabled := true;
  editFantasia.Enabled := true;
  editContato.Enabled := true;

  editNome.SetFocus;

  actExcluir.Enabled := false;
  actConfirmar.Enabled := true;
  actCancelar.Enabled := true;
  actIncluir.Enabled := false;
  actEditar.Enabled := false;

  btnExcluir.Enabled := false;
  btnConfirmar.Enabled := true;
  btnCancelar.Enabled := true;
  btnIncluir.Enabled := false;
  btnEditar.Enabled := false;
end;

procedure TtelaCadFor.actExcluirExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Deseja excluir este cadastro?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

    telaDados.tblFornecedores.Open;

    telaDados.qryFornecedores.Close;
    telaDados.qryFornecedores.SQL.Clear;
    telaDados.qryFornecedores.SQL.Add('Delete from fornecedor where id = ');
    telaDados.qryFornecedores.SQL.Add(editId.Text);
    telaDados.qryFornecedores.Open;

    telaDados.tblFornecedores.Refresh;

    telaDados.tblFornecedores.Close;

  end;
end;

procedure TtelaCadFor.editCepKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadFor.editTel1KeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadFor.editTel2KeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadFor.editCnpjKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadFor.editInscKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

end.
