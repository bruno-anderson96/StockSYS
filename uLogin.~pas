unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Buttons, pngimage, ExtCtrls, jpeg;

type
  TtelaLogin = class(TForm)
    btnLogin: TSpeedButton;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    procedure btnLoginClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaLogin: TtelaLogin;

implementation

uses uDados, uPrincipal;

{$R *.dfm}

procedure TtelaLogin.btnLoginClick(Sender: TObject);
begin
  {telaDados.qryLogin.Close;
  telaDados.qryLogin.SQL.Clear;
  telaDados.qryLogin.SQL.Add('Select * from LOGIN where login like ');
  telaDados.qryLogin.SQL.Add(edtLogin.Text);
  telaDados.qryLogin.Open;
 }
    telaDados.tblLogin.Open;
    telaDados.tblLogin.Locate('LOGIN', edtLogin.Text,[loCaseInsensitive]);{ and
     (telaDados.tblLogin.Locate('SENHA', edtSenha.Text,[loCaseInsensitive])) then begin }

    telaDados.qryLogin.Close;
    telaDados.qryLogin.SQL.Clear;
    telaDados.qryLogin.SQL.Add('Select * From login where ID =');
    telaDados.qryLogin.SQL.Add(telaDados.tblLoginID.AsString);
    telaDados.qryLogin.Open;

  if (edtSenha.Text = telaDados.qryLogin.FieldByName('senha').AsString) then begin
    telaPrincipal.Show;
    telaLogin.Hide;
    telaDados.qryEmitente.Close;
    telaDados.qryEmitente.SQL.Clear;
    telaDados.qryEmitente.SQL.Add('Select * From emitente where ID_LOGIN =');
    telaDados.qryEmitente.SQL.Add(telaDados.tblLoginID.AsString);
    telaDados.qryEmitente.Open;
  end else begin
    ShowMessage('Login ou Senha incorreto!');
    edtSenha.SetFocus;
  end;
end;

procedure TtelaLogin.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TtelaLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if key =#13 then btnLogin.Click;
end;

procedure TtelaLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
