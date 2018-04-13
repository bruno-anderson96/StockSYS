unit uCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, uDados, Grids, DBGrids,
  ActnList;

type
  TtelaCadUnidade = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    editNome: TDBEdit;
    btnCadastrar: TBitBtn;
    btnSair: TBitBtn;
    btnInserir: TBitBtn;
    editSigla: TDBEdit;
    btnEdit: TBitBtn;
    DBGrid1: TDBGrid;
    ActionList1: TActionList;
    actIncluir: TAction;
    actConfirmar: TAction;
    actEditar: TAction;
    actSair: TAction;
    actExcluir: TAction;
    btnExcluir: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actConfirmarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
   
  private
    { Private declarations }    
  
  public
    { Public declarations }
  end;

var
  telaCadUnidade: TtelaCadUnidade;
  id : Integer;

implementation



{$R *.dfm}

procedure TtelaCadUnidade.btnSairClick(Sender: TObject);
begin
Close;
end;   

procedure TtelaCadUnidade.btnCadastrarClick(Sender: TObject);
begin

  telaDados.qryUnidade.Close;
  telaDados.qryUnidade.SQL.Clear;
  telaDados.qryUnidade.SQL.Add('Select * from unidade where sigla = ');
  telaDados.qryUnidade.SQL.Add(QuotedStr(editSigla.Text));
  telaDados.qryUnidade.Open;

  if telaDados.qryUnidade.RecordCount>0 then begin
     ShowMessage('sigla já cadastrada');
     editSigla.SetFocus;
     
  end
  else begin
    telaDados.tblUnidade.Post;
    telaDados.tblUnidade.ApplyUpdates();
    telaDados.tblUnidade.Refresh;

     editSigla.Clear;
     editNome.Clear;

     editSigla.Enabled := false;
     editNome.Enabled := false;

     btnInserir.Enabled := true;
     btnInserir.SetFocus;

  end;



end;


procedure TtelaCadUnidade.FormShow(Sender: TObject);
begin     
  btnInserir.SetFocus;

end;

procedure TtelaCadUnidade.btnInserirClick(Sender: TObject);
var id : integer;
begin

    telaDados.tblUnidade.Last;

    id := telaDados.tblUnidadeID.Value + 1;

    {
    telaDados.tblUnidade.Last;

    if editId.Text = ''  then begin
      id := 0;
    end else begin
      id := StrToInt(editId.Text) +1;
    end;
   }
   telaDados.tblUnidade.Insert;
   telaDados.tblUnidadeID.Value := id;

   {editId.Text := IntToStr(id);}

   editSigla.Enabled := true;
   editNome.Enabled := true;
   editSigla.SetFocus;

   btnInserir.Enabled := false;

   DBGrid1.Enabled := False;


end;

procedure TtelaCadUnidade.actIncluirExecute(Sender: TObject);
var id : integer;
begin

    telaDados.tblUnidade.Last;

    id := telaDados.tblUnidadeID.Value + 1;

    {
    telaDados.tblUnidade.Last;

    if editId.Text = ''  then begin
      id := 0;
    end else begin
      id := StrToInt(editId.Text) +1;
    end;
   }
   telaDados.tblUnidade.Insert;
   telaDados.tblUnidadeID.Value := id;

   {editId.Text := IntToStr(id);}

   editSigla.Enabled := true;
   editNome.Enabled := true;
   editSigla.SetFocus;

   btnInserir.Enabled := false;

   DBGrid1.Enabled := False;


end;


procedure TtelaCadUnidade.actConfirmarExecute(Sender: TObject);
begin

  telaDados.qryUnidade.Close;
  telaDados.qryUnidade.SQL.Clear;
  telaDados.qryUnidade.SQL.Add('Select * from unidade where sigla = ');
  telaDados.qryUnidade.SQL.Add(QuotedStr(editSigla.Text));
  telaDados.qryUnidade.Open;

  if telaDados.qryUnidade.RecordCount>0 then begin
     ShowMessage('sigla já cadastrada');
     editSigla.SetFocus;
     Abort;
     
  end
  else begin
     editSigla.Enabled := false;
     editNome.Enabled := false;

     btnInserir.Enabled := true;
     btnInserir.SetFocus;


    telaDados.tblUnidade.Post;
    telaDados.tblUnidade.ApplyUpdates();
    telaDados.tblUnidade.Refresh;

    editSigla.Clear;
    editNome.Clear;


  end;

end;

procedure TtelaCadUnidade.actSairExecute(Sender: TObject);
begin
Close;
end;

procedure TtelaCadUnidade.actEditarExecute(Sender: TObject);
begin

telaDados.tblUnidade.Edit;
DBGrid1.Enabled := true;
editSigla.Enabled := true;
editNome.Enabled := true;
end;

procedure TtelaCadUnidade.actExcluirExecute(Sender: TObject);
begin
telaDados.tblUnidade.Delete;
end;

end.
