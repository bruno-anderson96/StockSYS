unit uEmiteDanfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, uDados, ActnList, ExtCtrls, pcnConversao;

type
  TtelaEmiteDanfe = class(TForm)
    GroupBox1: TGroupBox;
    editArq: TEdit;
    spb: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    actEmitir: TAction;
    actFechar: TAction;
    procedure spbClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure editArqExit(Sender: TObject);
    procedure actEmitirExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaEmiteDanfe: TtelaEmiteDanfe;

implementation

uses pcnNFe, ACBrNFeWebServices;

{$R *.dfm}

procedure TtelaEmiteDanfe.spbClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  editArq.Text := OpenDialog1.FileName;
end;

procedure TtelaEmiteDanfe.FormShow(Sender: TObject);
begin
  telaDados.AtualizaConfigAcbr;
end;

procedure TtelaEmiteDanfe.editArqExit(Sender: TObject);
begin
  if editArq.Text = '' then
    spbClick(Sender);
end;

procedure TtelaEmiteDanfe.actEmitirExecute(Sender: TObject);
begin

  if editArq.Text = '' then
  begin
    ShowMessage('É necessário selecionar o arquivo XML');
    Abort;
  end;
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  telaDados.ACBrNFe1.NotasFiscais.LoadFromFile(editArq.Text);
  if telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpEmis = TeDPEC then
  begin
    telaDados.ACBrNFe1.WebServices.Consulta.NFeChave := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID;
    telaDados.ACBrNFe1.WebServices.Consulta.Executar;

    telaDados.ACBrNFe1.DANFE.Protocolo  := telaDados.ACBrNFe1.WebServices.Consulta.Protocolo+''+
                                             DateTimeToStr(telaDados.ACBrNFe1.WebServices.Consulta.protNFe.dhRecbto)
  end;
  telaDados.ACBrNFe1.NotasFiscais.Imprimir;

end;

procedure TtelaEmiteDanfe.actFecharExecute(Sender: TObject);
begin
  Close;
end;

end.
