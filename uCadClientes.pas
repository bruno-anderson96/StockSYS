unit uCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, uDados, StdCtrls, Mask, DBCtrls, Buttons,
  ActnList, Menus, uPesCliente, ACBrBase, ACBrSocket, ACBrCEP, ACBrIBGE,
  pngextra;

type
  TtelaCadClientes = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    editId: TDBEdit;
    Label2: TLabel;
    editNome: TDBEdit;
    Label3: TLabel;
    editEndereco: TDBEdit;
    Label4: TLabel;
    editNum: TDBEdit;
    Label5: TLabel;
    editCep: TDBEdit;
    Label6: TLabel;
    editBairro: TDBEdit;
    Label7: TLabel;
    editCidade: TDBEdit;
    Label8: TLabel;
    editCompl: TDBEdit;
    Label9: TLabel;
    editTelefone: TDBEdit;
    Label10: TLabel;
    editCelular: TDBEdit;
    Label11: TLabel;
    editCpf: TDBEdit;
    editRg: TDBEdit;
    Label14: TLabel;
    editDtCad: TDBEdit;
    cbAtivo: TDBCheckBox;
    btnIncluir: TBitBtn;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnPesquisar: TBitBtn;
    btnRelatorio: TBitBtn;
    btnFechar: TBitBtn;
    Label15: TLabel;
    editEntEnd: TDBEdit;
    Label16: TLabel;
    editEntNum: TDBEdit;
    Label17: TLabel;
    editEntBairro: TDBEdit;
    Label18: TLabel;
    editEntCidade: TDBEdit;
    Label19: TLabel;
    editEntCep: TDBEdit;
    Label20: TLabel;
    editEntUf: TDBEdit;
    Label21: TLabel;
    editEntCompl: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    editODEnd: TDBEdit;
    Label24: TLabel;
    editODTel: TDBEdit;
    Label25: TLabel;
    editODPai: TDBEdit;
    Label26: TLabel;
    editODMae: TDBEdit;
    Label27: TLabel;
    editODNasc: TDBEdit;
    Label28: TLabel;
    editODLim: TDBEdit;
    Label29: TLabel;
    editODContato: TDBEdit;
    Label30: TLabel;
    editODObs: TDBMemo;
    Label31: TLabel;
    EditODSite: TDBEdit;
    Label32: TLabel;
    editODEmail: TDBEdit;
    editODLoc: TDBEdit;
    ActionList1: TActionList;
    Incluir: TAction;
    Excluir: TAction;
    Confirmar: TAction;
    Cancelar: TAction;
    Pesquisar: TAction;
    Relatorio: TAction;
    Fechar: TAction;
    Label12: TLabel;
    Label13: TLabel;
    Label33: TLabel;
    RadioGroup1: TRadioGroup;
    ACBrCEP1: TACBrCEP;
    btnPes: TSpeedButton;
    btnPesEnt: TSpeedButton;
    ACBrIBGE1: TACBrIBGE;
    btnEditar: TBitBtn;
    Editar: TAction;
    editUf: TComboBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IncluirExecute(Sender: TObject);
    procedure ConfirmarExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure CancelarExecute(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure PesquisarExecute(Sender: TObject);
    procedure btnPesClick(Sender: TObject);
    procedure btnPesEntClick(Sender: TObject);
    procedure EditarExecute(Sender: TObject);
    procedure ExcluirExecute(Sender: TObject);
    procedure editTelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure editCelularKeyPress(Sender: TObject; var Key: Char);
    procedure editCpfKeyPress(Sender: TObject; var Key: Char);
    procedure editRgKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaCadClientes: TtelaCadClientes;

implementation

uses Contnrs, Math;

{$R *.dfm}

procedure TtelaCadClientes.btnIncluirClick(Sender: TObject);
var
id : integer;
begin
  Confirmar.Enabled := True;
  PageControl1.TabIndex := 0;
  telaDados.tblClientes.Last;

   editNome.Enabled := true;
   editCep.Enabled := true;
   editEndereco.Enabled := true;
   editNum.Enabled := true;
   editBairro.Enabled := true;
   editCompl.Enabled := true;
   editCidade.Enabled := true;
   editUf.Enabled := true;
   editTelefone.Enabled := true;
   editCelular.Enabled := true;
   editCpf.Enabled := true;
   editRg.Enabled := true;
   editDtCad.Enabled := true;
   cbAtivo.Enabled := true;

   editEntCep.Enabled := true;
   editEntEnd.Enabled := true;
   editEntNum.Enabled := true;
   editEntCompl.Enabled := true;
   editEntBairro.Enabled := true;
   editEntCidade.Enabled := true;
   editEntUf.Enabled := true;

   editODLoc.Enabled := true;
   editODEnd.Enabled := true;
   editODTel.Enabled := true;
   editODPai.Enabled := true;
   editODMae.Enabled := true;
   editODNasc.Enabled := true;
   editODLim.Enabled := true;
   editODContato.Enabled := true;
   editODEmail.Enabled := true;
   editODSite.Enabled := true;
   editODObs.Enabled := true;

   btnIncluir.Enabled := false;
   btnConfirmar.Enabled := true;
   btnCancelar.Enabled := true;

   id := telaDados.tblClientesID.AsInteger + 1;

   telaDados.tblClientes.Insert;

   editId.Text := IntToStr(id);
   editNome.SetFocus;

   telaDados.tblClientes.FieldByName('ativo').AsBoolean := True;
   cbAtivo.Checked := true; 
end;

procedure TtelaCadClientes.btnConfirmarClick(Sender: TObject);
begin

  if (editNome.Text = '') then begin
    ShowMessage('Por favor digite o Nome');
    editNome.SetFocus;
  end
  else
  if (editCep.Text = '') then begin
    ShowMessage('Por favor digite o CEP');
    editCep.SetFocus;
  end
  else
  if (editEndereco.Text = '') then begin
    ShowMessage('Por favor digite o Endereço');
    editEndereco.SetFocus;
  end
  else
  if (editBairro.Text = '') then begin
    ShowMessage('Por favor digite o Bairro');
    editBairro.SetFocus;
  end
  else
  if (editNum.Text = '') then begin
    ShowMessage('Por favor digite o Número');
    editNum.SetFocus;
  end
  else
  if (editCidade.Text = '') then begin
    ShowMessage('Por favor digite o Cidade');
    editCidade.SetFocus;
  end
  else
  if (editTelefone.Text = '') and (editCelular.Text = '') then begin
    ShowMessage('Por favor digite um Telefone ou Celular');
    editNome.SetFocus;
  end
  else
  if not (telaDados.verificaCpf(editCpf.Text)) then begin
    ShowMessage('Cpf Inválido');
    editCpf.SetFocus;
  end
  else
  if (editRg.Text = '') then begin
    ShowMessage('Por favor digite o RG');
    editRg.SetFocus;
  end
  else
  begin
    telaDados.tblClientes.Post;

    btnIncluir.Enabled := true;
    btnConfirmar.Enabled := false;
    btnCancelar.Enabled := false;

    Confirmar.Enabled := False;
  end; 
end;

procedure TtelaCadClientes.btnFecharClick(Sender: TObject);
begin
  Close;
  telaDados.tblClientes.Open;
end;

procedure TtelaCadClientes.FormShow(Sender: TObject);
begin
  telaDados.tblClientes.Open;
  telaDados.FormataCampos;

  if editNome.Text = '' then begin
    Excluir.Enabled := False;
  end else begin
    Excluir.Enabled := true;
  end;
end;

procedure TtelaCadClientes.IncluirExecute(Sender: TObject);
var
id:integer;
begin
  telaDados.tblClientes.Open;

  PageControl1.TabIndex := 0;

  telaDados.tblClientes.Last;

  editNome.Enabled := true;
  editCep.Enabled := true;
  editEndereco.Enabled := true;
  editNum.Enabled := true;
  editBairro.Enabled := true;
  editCompl.Enabled := true;
  editCidade.Enabled := true;
  editUf.Enabled := true;
  editTelefone.Enabled := true;
  editCelular.Enabled := true;
  editCpf.Enabled := true;
  editRg.Enabled := true;
  editDtCad.Enabled := true;
  cbAtivo.Enabled := true;

  editEntCep.Enabled := true;
  editEntEnd.Enabled := true;
  editEntNum.Enabled := true;
  editEntCompl.Enabled := true;
  editEntBairro.Enabled := true;
  editEntCidade.Enabled := true;
  editEntUf.Enabled := true;

  editODLoc.Enabled := true;
  editODEnd.Enabled := true;
  editODTel.Enabled := true;
  editODPai.Enabled := true;
  editODMae.Enabled := true;
  editODNasc.Enabled := true;
  editODLim.Enabled := true;
  editODContato.Enabled := true;
  editODEmail.Enabled := true;
  editODSite.Enabled := true;
  editODObs.Enabled := true;

  RadioGroup1.Enabled := true;
  btnIncluir.Enabled := false;
  btnConfirmar.Enabled := true;
  btnCancelar.Enabled := true;
  btnEditar.Enabled := false;
  btnPes.Enabled := true;
  btnPesEnt.Enabled := true;

  Confirmar.Enabled := True;
  Incluir.Enabled := False;
  Cancelar.Enabled := True;
  Editar.Enabled := false;
  Pesquisar.Enabled := false;

  id := telaDados.tblClientesID.AsInteger + 1;
  telaDados.tblClientes.Insert;

  telaDados.tblClientesID.Value := id;

  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      editUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;

  telaDados.tblClientes.FieldByName('ativo').AsBoolean := True;
  cbAtivo.Checked := true;
  RadioGroup1.ItemIndex := 0;
  telaDados.tblClientesDATA_CAD.AsString := DateTimeToStr(Now);
  editNome.SetFocus;
  
end;

procedure TtelaCadClientes.ConfirmarExecute(Sender: TObject);
begin
  if (editNome.Text = '') then begin
    ShowMessage('Por favor digite o Nome');
    editNome.SetFocus;
    Abort;
  end else
  if (editCep.Text = '_____-___') then begin
    if MessageBox(Handle, 'CEP inválido, deseja cadastrar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_NO then begin
    //if  MessageDlg('CEP inválido, deseja cadastrar mesmo assim?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
      Abort;
    end;
  end else
  if (editEndereco.GetTextLen < 2 ) then begin
    if MessageBox(Handle, 'Endereço inválido, deseja cadastrar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_NO then begin
    //if  MessageDlg('Endereço inválido, deseja cadastrar mesmo assim?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
      editEndereco.SetFocus;
      Abort;
    end;
  end else
  if (editBairro.GetTextLen < 2) then begin
     if MessageBox(Handle, 'Bairro inválido, deseja cadastrar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_NO then begin
    //if  MessageDlg('Bairro inválido, deseja cadastrar mesmo assim?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
      editBairro.SetFocus;
      Abort;
    end;
  end else
  if (editNum.Text = '') then begin
    if MessageBox(Handle, 'Número inválido, deseja cadastrar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_NO then begin
    //if  MessageDlg('Número inválido, deseja cadastrar mesmo assim?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
    editNum.SetFocus;
    Abort;
    end;
  end else
  if (editCidade.Text = '') then begin
    if MessageBox(Handle, 'Cidade inválida, deseja cadastrar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_NO then begin
    //if  MessageDlg('Cidade inválida, deseja cadastrar mesmo assim?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
    editCidade.SetFocus;
    Abort;
    end;
  end else
  if (editTelefone.Text = '') and (editCelular.Text = '') then begin
    if MessageBox(Handle, 'Telefone inválido, deseja cadastrar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_NO then begin
    //if  MessageDlg('Telefone inválido, deseja cadastrar mesmo assim?',mtConfirmation,[mbyes,mbno],0) = mrno then begin
    editNome.SetFocus;
    Abort;
    end;
  end else
  if RadioGroup1.ItemIndex >=0 then begin
    {telaDados.qryClientes.Close;
    telaDados.qryClientes.SQL.Clear;
    telaDados.qryClientes.SQL.Add('Select * from CLIENTE where CNPJ_CPF = ');
    telaDados.qryClientes.SQL.Add(editCpf.Text);
    telaDados.qryClientes.Open;
    }
    if RadioGroup1.ItemIndex = 0 then
    begin
    {if telaDados.qryClientes.RecordCount > 0 then begin
      ShowMessage('CPF/CNPJ já cadastrado');
      editCpf.SetFocus;
      Abort;
    end;}
    if not (telaDados.verificaCpf(editCpf.Text)) then begin
      ShowMessage('CPF Inválido');
      editCpf.SetFocus;
      Abort;
    end;
  end
  else
  begin
     if not (telaDados.verificaCnpj(editCpf.Text)) then begin
      ShowMessage('CNPJ Inválido');
      editCpf.SetFocus;
      Abort;
     end;
  end;
end else
  if (editRg.Text = '') then begin
    ShowMessage('Por favor digite o RG / Inscrição Estadual');
    editRg.SetFocus;
    Abort;
  end;

  telaDados.tblClientesUF_END.Value := editUf.Text;
  telaDados.tblClientes.Post;
  telaDados.trnscClientes.CommitRetaining;
  telaDados.tblClientes.ApplyUpdates;
  telaDados.tblClientes.Close;

  btnIncluir.Enabled := true;
  btnConfirmar.Enabled := false;
  btnCancelar.Enabled := false;
  btnEditar.Enabled := true;
  btnPes.Enabled := true;
  btnPesEnt.Enabled := false;

  Confirmar.Enabled := false;
  Incluir.Enabled := true;
  Cancelar.Enabled := false;
  Editar.Enabled := true;
  Pesquisar.Enabled := true;

  editNome.Enabled := false;
  editCep.Enabled := false;
  editEndereco.Enabled := false;
  editNum.Enabled := false;
  editBairro.Enabled := false;
  editCompl.Enabled := false;
  editCidade.Enabled := false;
  editUf.Enabled := false;
  editTelefone.Enabled := false;
  editCelular.Enabled := false;
  editCpf.Enabled := false;
  editRg.Enabled := false;
  editDtCad.Enabled := false;
  cbAtivo.Enabled := false;

  editEntCep.Enabled := false;
  editEntEnd.Enabled := false;
  editEntNum.Enabled := false;
  editEntCompl.Enabled := false;
  editEntBairro.Enabled := false;
  editEntCidade.Enabled := false;
  editEntUf.Enabled := false;

  editODLoc.Enabled := false;
  editODEnd.Enabled := false;
  editODTel.Enabled := false;
  editODPai.Enabled := false;
  editODMae.Enabled := false;
  editODNasc.Enabled := false;
  editODLim.Enabled := false;
  editODContato.Enabled := false;
  editODEmail.Enabled := false;
  editODSite.Enabled := false;
  editODObs.Enabled := false;

  RadioGroup1.Enabled := false; 
end;

procedure TtelaCadClientes.FecharExecute(Sender: TObject);
begin
  Close;
  telaDados.tblClientes.Open;
end;

procedure TtelaCadClientes.CancelarExecute(Sender: TObject);
begin

  telaDados.tblClientes.Cancel;
  telaDados.tblClientes.Close;
  editNome.Enabled := false;
  editCep.Enabled := false;
  editEndereco.Enabled := false;
  editNum.Enabled := false;
  editBairro.Enabled := false;
  editCompl.Enabled := false;
  editCidade.Enabled := false;
  editUf.Enabled := false;
  editTelefone.Enabled := false;
  editCelular.Enabled := false;
  editCpf.Enabled := false;
  editRg.Enabled := false;
  editDtCad.Enabled := false;
  cbAtivo.Enabled := false;

  editEntCep.Enabled := false;
  editEntEnd.Enabled := false;
  editEntNum.Enabled := false;
  editEntCompl.Enabled := false;
  editEntBairro.Enabled := false;
  editEntCidade.Enabled := false;
  editEntUf.Enabled := false;

  editODLoc.Enabled := false;
  editODEnd.Enabled := false;
  editODTel.Enabled := false;
  editODPai.Enabled := false;
  editODMae.Enabled := false;
  editODNasc.Enabled := false;
  editODLim.Enabled := false;
  editODContato.Enabled := false;
  editODEmail.Enabled := false;
  editODSite.Enabled := false;
  editODObs.Enabled := false;

  RadioGroup1.Enabled := false;

  btnPes.Enabled := false;
  btnPesEnt.Enabled := false;

  Incluir.Enabled   := true;
  Confirmar.Enabled := false;
  Cancelar.Enabled  := false;
  Editar.Enabled    := true;
  Pesquisar.Enabled := true;
  Relatorio.Enabled := true;
  if editCpf.Text = '' then begin
    Excluir.Enabled := False;
  end else begin
    Excluir.Enabled := true;
  end;

end;

procedure TtelaCadClientes.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
    telaDados.FormataCamposF;
  end else
  begin
    telaDados.FormataCamposJ;
  end;
    editCpf.SetFocus;
end;

procedure TtelaCadClientes.PesquisarExecute(Sender: TObject);
begin
  telaDados.tblClientes.Open;
  Application.CreateForm(TtelaPesCliente, telaPesCliente);
  telaPesCliente.Show;
end;

procedure TtelaCadClientes.btnPesClick(Sender: TObject);
var i : integer;
begin
  ACBrCEP1.BuscarPorCEP(editCep.Text);

  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    telaDados.tblClientesCEP_END.AsString    := UpperCase(ACBrCEP1.Enderecos[i].CEP);
    telaDados.tblClientesENDERECO.AsString   := UpperCase(ACBrCEP1.Enderecos[i].Logradouro);
    telaDados.tblClientesCOMPLEMENTO.AsString:= UpperCase(ACBrCEP1.Enderecos[i].Complemento);
    telaDados.tblClientesCIDADE_END.AsString := UpperCase(ACBrCEP1.Enderecos[i].Municipio);
    editUf.Text                              := UpperCase(ACBrCEP1.Enderecos[i].UF);
    telaDados.tblClientesBAIRRO_END.AsString := UpperCase(ACBrCEP1.Enderecos[i].Bairro);
  end;
end;

procedure TtelaCadClientes.btnPesEntClick(Sender: TObject);
var i : integer;
begin
  ACBrCEP1.BuscarPorCEP(editCep.Text);

  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    telaDados.tblClientesCEP_END_ENTREGA.AsString := ACBrCEP1.Enderecos[i].CEP;
    telaDados.tblClientesEND_ENTREGA.AsString := ACBrCEP1.Enderecos[i].Logradouro;
    telaDados.tblClientesCOMPL_ENT.AsString := ACBrCEP1.Enderecos[i].Complemento;
    telaDados.tblClientesCID_END_ENTREGA.AsString := ACBrCEP1.Enderecos[i].Municipio;
    telaDados.tblClientesUF_END_ENT.AsString := ACBrCEP1.Enderecos[i].UF;
    telaDados.tblClientesBAIRRO_END_ENTREGA.AsString := ACBrCEP1.Enderecos[i].Bairro;
  end;
end;

procedure TtelaCadClientes.EditarExecute(Sender: TObject);
begin
  telaDados.tblClientes.Open;
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
  btnPes.Enabled := true;
  btnPesEnt.Enabled := true;


  editNome.Enabled := true;
  editCep.Enabled := true;
  editEndereco.Enabled := true;
  editNum.Enabled := true;
  editBairro.Enabled := true;
  editCompl.Enabled := true;
  editCidade.Enabled := true;
  editUf.Enabled := true;
  editTelefone.Enabled := true;
  editCelular.Enabled := true;
  editCpf.Enabled := true;
  editRg.Enabled := true;
  editDtCad.Enabled := true;
  cbAtivo.Enabled := true;

  editEntCep.Enabled := true;
  editEntEnd.Enabled := true;
  editEntNum.Enabled := true;
  editEntCompl.Enabled := true;
  editEntBairro.Enabled := true;
  editEntCidade.Enabled := true;
  editEntUf.Enabled := true;

  editODLoc.Enabled := true;
  editODEnd.Enabled := true;
  editODTel.Enabled := true;
  editODPai.Enabled := true;
  editODMae.Enabled := true;
  editODNasc.Enabled := true;
  editODLim.Enabled := true;
  editODContato.Enabled := true;
  editODEmail.Enabled := true;
  editODSite.Enabled := true;
  editODObs.Enabled := true;

  RadioGroup1.Enabled := true;

  telaDados.tblClientes.Edit;
end;

procedure TtelaCadClientes.ExcluirExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Deseja excluir este cadastro?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

    telaDados.tblClientes.Open;

    telaDados.qryClientes.Close;
    telaDados.qryClientes.SQL.Clear;
    telaDados.qryClientes.SQL.Add('Delete from cliente where id = ');
    telaDados.qryClientes.SQL.Add(editId.Text);
    telaDados.qryClientes.Open;

    telaDados.tblClientes.Refresh;
    telaDados.tblClientes.Close;

  end;
end;

procedure TtelaCadClientes.editTelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadClientes.editCelularKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadClientes.editCpfKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

procedure TtelaCadClientes.editRgKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#13,#27,#42] ) then begin
    key:=#0;
  end;
end;

end.
