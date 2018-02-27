unit uEnviarNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ActnList, ExtCtrls, uDados;

type
  TtelaEnviarNfe = class(TForm)
    edtArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    gb: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    OpenDialog1: TOpenDialog;
    actEnviar: TAction;
    actFechar: TAction;
    Label1: TLabel;
    edtNumLote: TEdit;
    edtNumPed: TEdit;
    procedure actFecharExecute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure actEnviarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  telaEnviarNfe: TtelaEnviarNfe;

implementation

uses pcnRetConsReciNFe;

{$R *.dfm}

procedure TtelaEnviarNfe.actFecharExecute(Sender: TObject);
begin
Close;
end;

procedure TtelaEnviarNfe.SpeedButton1Click(Sender: TObject);
begin
OpenDialog1.Execute;
edtArquivo.Text := OpenDialog1.FileName;
end;

procedure TtelaEnviarNfe.FormShow(Sender: TObject);
begin
  telaDados.AtualizaConfigAcbr;
  edtArquivo.SetFocus;
end;

procedure TtelaEnviarNfe.BitBtn1Click(Sender: TObject);
var aChaveNfe, aRecibo, aProtocolo : String;
begin
  if edtArquivo.Text = '' then
  begin
    ShowMessage('É necessário selecionar o arquivo XML');
    Abort;
  end;
  if Trim(edtNumLote.Text) = '' then
  begin
    ShowMessage('É necessário informar o número do lote!');
    Abort;
  end;
  //
  try
    telaDados.ACBrNFe1.NotasFiscais.Clear;
    telaDados.ACBrNFe1.NotasFiscais.LoadFromFile(edtArquivo.Text);
    telaDados.ACBrNFe1.Enviar(edtNumLote.Text);
  //
    aChaveNfe  := telaDados.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].chNFe;
    aProtocolo := telaDados.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt;
    aRecibo    := telaDados.ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec;
  // gera chave NFe
    if aChaveNfe <> '' then
    begin
      telaDados.GravaChaveNFePedido(aChaveNfe,edtNumPed.Text);
    end;
  except
    ShowMessage('Erro ao enviar a NFe, Verifique!');
  end;

end;



procedure TtelaEnviarNfe.actEnviarExecute(Sender: TObject);
var aChaveNfe, aRecibo, aProtocolo : String;
begin
  if edtArquivo.Text = '' then
  begin
    ShowMessage('É necessário selecionar o arquivo XML');
    Abort;
  end;
  if Trim(edtNumLote.Text) = '' then
  begin
    ShowMessage('É necessário informar o número do lote!');
    Abort;
  end;
  //
  try
    telaDados.ACBrNFe1.NotasFiscais.Clear;
    telaDados.ACBrNFe1.NotasFiscais.LoadFromFile(edtArquivo.Text);
    telaDados.ACBrNFe1.Enviar(edtNumLote.Text);
  //
    aChaveNfe  := telaDados.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].chNFe;
    aProtocolo := telaDados.ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtNFe.Items[0].nProt;
    aRecibo    := telaDados.ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec;
  // gera chave NFe
    if aChaveNfe <> '' then
    begin
      telaDados.GravaChaveNFePedido(aChaveNfe,edtNumPed.Text);
    end;
  except
    ShowMessage('Erro ao enviar a NFe, Verifique!');
  end;

end;


end.
