unit uValidaXml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ActnList, uDados;

type
  TtelaValidaXml = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox1: TGroupBox;
    edtArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    btnValida: TSpeedButton;
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    actValidar: TAction;
    actFechar: TAction;
    procedure SpeedButton1Click(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actValidarExecute(Sender: TObject);
    procedure edtArquivoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaValidaXml: TtelaValidaXml;

implementation

{$R *.dfm}

procedure TtelaValidaXml.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TtelaValidaXml.actFecharExecute(Sender: TObject);
begin
Close;
end;

procedure TtelaValidaXml.actValidarExecute(Sender: TObject);
begin
  if edtArquivo.Text = '' then
  begin
    ShowMessage('É necessário selecionar o arquivo!');
    Abort;
  end;
  //Executa validação de arquivos
  try
    telaDados.ACBrNFe1.NotasFiscais.Clear;
    telaDados.ACBrNFe1.NotasFiscais.LoadFromFile(edtArquivo.Text);
    telaDados.ACBrNFe1.NotasFiscais.Validar;
  finally
    ShowMessage('Arquivo Validado com sucesso!');
  end;

end;

procedure TtelaValidaXml.edtArquivoExit(Sender: TObject);
begin
if edtArquivo.Text = '' then
  SpeedButton1Click(Sender);
end;

procedure TtelaValidaXml.FormShow(Sender: TObject);
begin
  telaDados.AtualizaConfigAcbr;
  edtArquivo.SetFocus;
end;

end.
