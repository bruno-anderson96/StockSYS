unit uEnviaEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Buttons, ExtCtrls, uDados;

type
  TtelaEnviaEmail = class(TForm)
    GroupBox1: TGroupBox;
    spb: TSpeedButton;
    editArq: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    actEnviar: TAction;
    actFechar: TAction;
    edtEmail: TEdit;
    Label1: TLabel;
    procedure spbClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEnviarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaEnviaEmail: TtelaEnviaEmail;

implementation

{$R *.dfm}

procedure TtelaEnviaEmail.spbClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  editArq.Text := OpenDialog1.FileName;
end;

procedure TtelaEnviaEmail.FormShow(Sender: TObject);
begin
  telaDados.AtualizaConfigAcbr;
end;

procedure TtelaEnviaEmail.actEnviarExecute(Sender: TObject);
var Endereco : TStrings;
begin
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  telaDados.ACBrNFe1.NotasFiscais.LoadFromFile(editArq.Text);

  Endereco := TStringList.Create;
  Endereco.Add(edtEmail.Text);
  {
  telaDados.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(telaDados.sEHost,
                                                      telaDados.sEPorta,
                                                      telaDados.sEUsuario,
                                                      telaDados.sESenha,
                                                      telaDados.sEmailEmitente,
                                                      edtEmail.Text,
                                                      'NFe',
                                                      'NFe',
                                                      true,
                                                      true,
                                                      Endereco,
                                                      nil,
                                                      false,
                                                      true,
                                                      'Nome do Remetente'); }
  telaDados.ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(edtEmail.Text, 'NFe', nil, true, Endereco, nil, nil);
 


  FreeAndNil(Endereco);
end;

procedure TtelaEnviaEmail.actFecharExecute(Sender: TObject);
begin
  Close;
end;

end.
