unit uCadTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DBCtrls, DB, StdCtrls, Mask, ActnList,
  Buttons, Grids, DBGrids;

type
  TtelaCadTransportadora = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    edtTId: TDBEdit;
    Label2: TLabel;
    edtTEnd: TDBEdit;
    Label3: TLabel;
    edtTCidade: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtTBairro: TDBEdit;
    Label6: TLabel;
    edtTTel: TDBEdit;
    Label7: TLabel;
    edtTCel: TDBEdit;
    Label8: TLabel;
    edtTCnpj: TDBEdit;
    Label9: TLabel;
    edtTInscest: TDBEdit;
    Label10: TLabel;
    edtTObs: TDBImage;
    Label11: TLabel;
    edtVId: TDBEdit;
    Label12: TLabel;
    edtVMod: TDBEdit;
    Label13: TLabel;
    edtVPlaca: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtVAntt: TDBEdit;
    Label16: TLabel;
    edtVChassi: TDBEdit;
    Label17: TLabel;
    edtVRenavam: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edtVTara: TDBEdit;
    Label22: TLabel;
    edtVCapCar: TDBEdit;
    Label23: TLabel;
    edtVCapM3: TDBEdit;
    ActionList1: TActionList;
    IncluirT: TAction;
    IncluirV: TAction;
    btnVInc: TSpeedButton;
    btnVEdit: TSpeedButton;
    btnVExc: TSpeedButton;
    btnVCanc: TSpeedButton;
    btnVFechar: TSpeedButton;
    btnVSalvar: TSpeedButton;
    EditarT: TAction;
    ExcluirT: TAction;
    CancelarT: TAction;
    PesquisarT: TAction;
    SalvarT: TAction;
    Fechar: TAction;
    btnTInc: TSpeedButton;
    btnTEdit: TSpeedButton;
    btnTExc: TSpeedButton;
    btnTCanc: TSpeedButton;
    btnTPes: TSpeedButton;
    btnTSalvar: TSpeedButton;
    btnTFechar: TSpeedButton;
    dbVeiculo: TDBGrid;
    cbTUf: TComboBox;
    cbVUf: TComboBox;
    Label24: TLabel;
    edtTDesc: TDBEdit;
    cbVTipCar: TDBComboBox;
    cbVTipoV: TDBComboBox;
    cbVTipoRod: TDBComboBox;
    procedure IncluirTExecute(Sender: TObject);
    procedure FecharExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditarTExecute(Sender: TObject);
    procedure ExcluirTExecute(Sender: TObject);
    procedure CancelarTExecute(Sender: TObject);
    procedure SalvarTExecute(Sender: TObject);
    procedure PesquisarTExecute(Sender: TObject);
    procedure btnVIncClick(Sender: TObject);
    procedure btnVEditClick(Sender: TObject);
    procedure btnVExcClick(Sender: TObject);
    procedure btnVCancClick(Sender: TObject);
    procedure btnVSalvarClick(Sender: TObject);
    procedure edtTIdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaCadTransportadora: TtelaCadTransportadora;

implementation

uses uDados, uPesTransportadora, IBQuery;

{$R *.dfm}

procedure TtelaCadTransportadora.IncluirTExecute(Sender: TObject);
var
id : integer;
begin
  edtTDesc.Enabled := true;
  edtTEnd.Enabled := true;
  edtTCidade.Enabled := true;
  edtTBairro.Enabled := true;
  edtTTel.Enabled := true;
  edtTCel.Enabled := true;
  edtTCnpj.Enabled := true;
  edtTInscest.Enabled := true;
  edtTObs.Enabled := true;
  cbTUf.Enabled := true;

  btnTInc.Enabled := false;
  btnTEdit.Enabled := false;
  btnTExc.Enabled := false;
  btnTCanc.Enabled := true;
  btnTSalvar.Enabled := true;

  edtTDesc.SetFocus;

  telaDados.tblTransportadora.Last;
  id := telaDados.tblTransportadoraID.Value + 1;
  telaDados.tblTransportadora.Insert;
  telaDados.tblTransportadoraID.Value := id;

  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      cbTUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;

  TabSheet2.Enabled := false;

end;

procedure TtelaCadTransportadora.FecharExecute(Sender: TObject);
begin
  telaCadTransportadora.Hide;
end;

procedure TtelaCadTransportadora.FormShow(Sender: TObject);
begin
  telaDados.FormataCampos;
  if edtTId.Text <> '' then begin
    btnTEdit.Enabled := true;
    btnTExc.Enabled := true;
    TabSheet2.Enabled := true;
    if edtVId.Text <> '' then begin
      btnVEdit.Enabled := true;
      btnVExc.Enabled := true;
    end;
  end;


end;

procedure TtelaCadTransportadora.EditarTExecute(Sender: TObject);
begin
  edtTDesc.Enabled := true;
  edtTEnd.Enabled := true;
  edtTCidade.Enabled := true;
  edtTBairro.Enabled := true;
  edtTTel.Enabled := true;
  edtTCel.Enabled := true;
  edtTCnpj.Enabled := true;
  edtTInscest.Enabled := true;
  edtTObs.Enabled := true;
  cbTUf.Enabled := true;

  btnTInc.Enabled := false;
  btnTEdit.Enabled := false;
  btnTExc.Enabled := false;
  btnTCanc.Enabled := true;
  btnTSalvar.Enabled := true;

  telaDados.tblTransportadora.Edit;
  
  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      cbTUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;
  
end;

procedure TtelaCadTransportadora.ExcluirTExecute(Sender: TObject);
begin
  if MessageBox(Handle, 'Deseja excluir este cadastro?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

    telaDados.tblTransportadora.Open;

    telaDados.qryTransportadora.Close;
    telaDados.qryTransportadora.SQL.Clear;
    telaDados.qryTransportadora.SQL.Add('Delete from TRANSPORTADORA where id = ');
    telaDados.qryTransportadora.SQL.Add(edtTId.Text);
    telaDados.qryTransportadora.Open;

    telaDados.tblTransportadora.Refresh;
    telaDados.tblTransportadora.Close;
  end;

  if edtTId.Text = '' then begin
    btnVEdit.Enabled := false;
    btnVExc.Enabled := false;
  end;

end;

procedure TtelaCadTransportadora.CancelarTExecute(Sender: TObject);
begin
  edtTDesc.Enabled := false;
  edtTEnd.Enabled := false;
  edtTCidade.Enabled := false;
  edtTBairro.Enabled := false;
  edtTTel.Enabled := false;
  edtTCel.Enabled := false;
  edtTCnpj.Enabled := false;
  edtTInscest.Enabled := false;
  edtTObs.Enabled := false;
  cbTUf.Enabled := false;

  btnTInc.Enabled := true;
  btnTEdit.Enabled := false;
  btnTExc.Enabled := false;
  btnTCanc.Enabled := false;
  btnTSalvar.Enabled := false;

  telaDados.tblTransportadora.Cancel;

  if edtTId.Text = '' then begin
    ExcluirT.Enabled := False;
  end else begin
    ExcluirT.Enabled := true;
    TabSheet2.Enabled := true;
  end;

end;

procedure TtelaCadTransportadora.SalvarTExecute(Sender: TObject);
begin
  edtTDesc.Enabled := false;
  edtTEnd.Enabled := false;
  edtTCidade.Enabled := false;
  edtTBairro.Enabled := false;
  edtTTel.Enabled := false;
  edtTCel.Enabled := false;
  edtTCnpj.Enabled := false;
  edtTInscest.Enabled := false;
  edtTObs.Enabled := false;
  cbTUf.Enabled := false;

  btnTInc.Enabled := true;
  btnTEdit.Enabled := true;
  btnTExc.Enabled := true;
  btnTCanc.Enabled := false;
  btnTSalvar.Enabled := false;

  telaDados.tblTransportadoraUF.Value := cbTUf.Text;
  telaDados.tblTransportadora.Post;
  telaDados.trnscTransportadora.CommitRetaining;
  telaDados.tblTransportadora.ApplyUpdates;

   TabSheet2.Enabled := true;
   telaDados.tblVeiculo.Filter := 'IDT =' + edtTId.Text;
   telaDados.tblVeiculo.Filtered := true;

end;

procedure TtelaCadTransportadora.PesquisarTExecute(Sender: TObject);
begin
  Application.CreateForm(TtelaPesTransportadora, telaPesTransportadora);
  telaPesTransportadora.Show;
end;

procedure TtelaCadTransportadora.btnVIncClick(Sender: TObject);
var
id: integer;
begin
  If edtTId.Text = '' then begin
    ShowMessage('Você precisa selecionar uma Transportadora');
    TabSheet1.SetFocus;
    Abort;
  end;

  edtVMod.Enabled := true;
  edtVPlaca.Enabled := true;
  edtVAntt.Enabled := true;
  edtVChassi.Enabled := true;
  edtVRenavam.Enabled := true;
  edtVTara.Enabled := true;
  edtVCapCar.Enabled := true;
  edtVCapM3.Enabled := true;
  cbVUf.Enabled := true;
  cbVTipoV.Enabled := true;
  cbVTipCar.Enabled := true;
  cbVTipoRod.Enabled := true;

  btnVInc.Enabled := false;
  btnVEdit.Enabled := false;
  btnVExc.Enabled := false;
  btnVCanc.Enabled := true;
  btnVSalvar.Enabled := true;

  edtVMod.SetFocus;

  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      cbVUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;

  telaDados.tblVeiculo.Filtered := false;
  telaDados.tblVeiculo.Last;
  id := telaDados.tblVeiculoID.Value + 1;
  telaDados.tblVeiculo.Filtered := true;
  
  telaDados.tblVeiculo.Insert;
  telaDados.tblVeiculoID.Value := id;

end;

procedure TtelaCadTransportadora.btnVEditClick(Sender: TObject);
begin
  edtVMod.Enabled := true;
  edtVPlaca.Enabled := true;
  edtVAntt.Enabled := true;
  edtVChassi.Enabled := true;
  edtVRenavam.Enabled := true;
  edtVTara.Enabled := true;
  edtVCapCar.Enabled := true;
  edtVCapM3.Enabled := true;
  cbVUf.Enabled := true;
  cbVTipoV.Enabled := true;
  cbVTipCar.Enabled := true;
  cbVTipoRod.Enabled := true;

  btnVInc.Enabled := false;
  btnVEdit.Enabled := false;
  btnVExc.Enabled := false;
  btnVCanc.Enabled := true;
  btnVSalvar.Enabled := true;

  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      cbTUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;

  dbVeiculo.Enabled := true;
  cbVUf.Text := telaDados.tblVeiculoUF.Value;
  telaDados.tblVeiculo.Edit;
  
end;

procedure TtelaCadTransportadora.btnVExcClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Deseja excluir este cadastro?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin

    telaDados.tblVeiculo.Open;

    telaDados.qryVeiculo.Close;
    telaDados.qryVeiculo.SQL.Clear;
    telaDados.qryVeiculo.SQL.Add('Delete from VEICULO where id = ');
    telaDados.qryVeiculo.SQL.Add(edtVId.Text);
    telaDados.qryVeiculo.Open;

    telaDados.tblVeiculo.Refresh;
  end;

  if edtVId.Text = '' then begin
    btnVEdit.Enabled := false;
    btnVExc.Enabled := false;
  end;

end;

procedure TtelaCadTransportadora.btnVCancClick(Sender: TObject);
begin
  edtVMod.Enabled := false;
  edtVPlaca.Enabled := false;
  edtVAntt.Enabled := false;
  edtVChassi.Enabled := false;
  edtVRenavam.Enabled := false;
  edtVTara.Enabled := false;
  edtVCapCar.Enabled := false;
  edtVCapM3.Enabled := false;
  cbVUf.Enabled := false;
  cbVTipoV.Enabled := false;
  cbVTipCar.Enabled := false;
  cbVTipoRod.Enabled := false;

  btnVInc.Enabled := true;
  btnVExc.Enabled := false;
  btnVCanc.Enabled := false;
  btnVSalvar.Enabled := false;

  if edtVId.Text = '' then begin
    btnVExc.Enabled := False;
  end else begin
    btnVExc.Enabled := true;
  end;

  telaDados.tblVeiculo.Cancel;



end;

procedure TtelaCadTransportadora.btnVSalvarClick(Sender: TObject);
begin
  edtVMod.Enabled := false;
  edtVPlaca.Enabled := false;
  edtVAntt.Enabled := false;
  edtVChassi.Enabled := false;
  edtVRenavam.Enabled := false;
  edtVTara.Enabled := false;
  edtVCapCar.Enabled := false;
  edtVCapM3.Enabled := false;
  cbVUf.Enabled := false;
  cbVTipoV.Enabled := false;
  cbVTipCar.Enabled := false;
  cbVTipoRod.Enabled := false;

  btnVInc.Enabled := true;
  btnVEdit.Enabled := true;
  btnVExc.Enabled := true;
  btnVCanc.Enabled := false;
  btnVSalvar.Enabled := false;

  telaDados.tblVeiculoIDT.Value := telaDados.tblTransportadoraID.Value;
  telaDados.tblVeiculo.Post;
  telaDados.trnscVeiculo.CommitRetaining;
  telaDados.tblVeiculo.ApplyUpdates;

end;

procedure TtelaCadTransportadora.edtTIdChange(Sender: TObject);
begin
  telaDados.tblVeiculo.Close;
  telaDados.tblVeiculo.Open;
  //telaDados.tblVeiculo.Locate('IDT', edtTId.Text ,[]);

  if telaDados.tblTransportadoraDESCRICAO.AsString <> '' then begin
    telaDados.tblVeiculo.Filter := 'IDT =' + edtTId.Text;
    telaDados.tblVeiculo.Filtered := true;
  end;
  
end;

end.
