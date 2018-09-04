unit uCadPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uDados, Grids, DBGrids, ActnList, Buttons, StdCtrls,
  Mask, DBCtrls, DB;

type
  TtelaCadPos = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    editDesc: TDBEdit;
    Label3: TLabel;
    editSerial: TDBEdit;
    ActionList1: TActionList;
    btnSair: TSpeedButton;
    btnInserir: TSpeedButton;
    btnEdit: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCadastrar: TSpeedButton;
    actInserir: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actCadastrar: TAction;
    actSair: TAction;
    Label1: TLabel;
    edtChReq: TDBEdit;
    btnGeraChave: TSpeedButton;
    procedure actInserirExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCadastrarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure btnGeraChaveClick(Sender: TObject);
  private
    { Private declarations }
    function GuidCreate: string;
  public
    { Public declarations }
  end;

var
  telaCadPos: TtelaCadPos;

implementation

{$R *.dfm}

procedure TtelaCadPos.actInserirExecute(Sender: TObject);
var
id : integer;
begin

    telaDados.tblPos.Last;

    id := telaDados.tblPosID.Value + 1;

   telaDados.tblPos.Insert;
   telaDados.tblPosID.Value := id;

   editDesc.Enabled := true;
   editSerial.Enabled := true;
   edtChReq.Enabled := true;
   btnGeraChave.Enabled := true;
   editDesc.SetFocus;

   btnInserir.Enabled := false;

   DBGrid1.Enabled := False;
end;


procedure TtelaCadPos.actEditarExecute(Sender: TObject);
begin
  telaDados.tblPos.Edit;
  DBGrid1.Enabled := true;
  editDesc.Enabled := true;
  editSerial.Enabled := true;
  edtChReq.Enabled := true;
  btnGeraChave.Enabled := true;
end;

procedure TtelaCadPos.actExcluirExecute(Sender: TObject);
begin
  telaDados.tblPos.Delete;
end;

function TtelaCadPos.GuidCreate: string;
var
  ID: TGUID;
  IDn : String;

begin

  Result := '';
  if CreateGuid(ID) = S_OK then
    IDn := GUIDToString(ID);

  while Pos('{', IDn) > 0 do
    IDn[Pos('{', IDn)] := ' ';
  while Pos('}', IDn) > 0 do
    IDn[Pos('}', IDn)] := ' ';

  Result := Trim(IDn);
end;


procedure TtelaCadPos.actCadastrarExecute(Sender: TObject);
begin

  telaDados.qryPos.Close;
  telaDados.qryPos.SQL.Clear;
  telaDados.qryPos.SQL.Add('Select * from POS where DESCRICAO = ');
  telaDados.qryPos.SQL.Add(QuotedStr(editDesc.Text));
  telaDados.qryPos.Open;

  if (telaDados.tblPos.State = dsInsert) then begin
    if telaDados.qryPos.RecordCount>0 then begin
     ShowMessage('POS já cadastrado');
     editDesc.SetFocus;
     Abort;
    end;
  end;
     editDesc.Enabled := false;
     editSerial.Enabled := false;
     edtChReq.Enabled := false;
     btnGeraChave.Enabled := false;

     btnInserir.Enabled := true;

    telaDados.tblPos.Post;
    telaDados.tblPos.ApplyUpdates();
    telaDados.tblPos.Refresh;

    DBGrid1.Enabled := false;

    editDesc.Clear;
    editSerial.Clear;
    edtChReq.Clear;

end;

procedure TtelaCadPos.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TtelaCadPos.btnGeraChaveClick(Sender: TObject);
begin
  edtChReq.Text := GuidCreate;
end;

end.
