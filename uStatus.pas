unit uStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, OleCtrls, SHDocVw, ACBrBase,
  ACBrDFe, ACBrNFe, pcnConversao, uDados;

type
  TtelaStatus = class(TForm)
    GroupBox1: TGroupBox;
    RetornoWS: TMemo;
    WebBrowser1: TWebBrowser;
    Dados: TMemo;
    Panel1: TPanel;
    btnVerificar: TBitBtn;
    btnFechar: TBitBtn;
    ACBrNFe1: TACBrNFe;
    procedure btnFecharClick(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaStatus: TtelaStatus;

implementation

{$R *.dfm}

procedure TtelaStatus.btnFecharClick(Sender: TObject);
begin
close;
end;

procedure TtelaStatus.btnVerificarClick(Sender: TObject);
begin
  ACBrNFe1.WebServices.StatusServico.Executar;
  RetornoWS.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetWS);
  //
  RetornoWS.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+ 'retornoWS.xml');
  WebBrowser1.Navigate(ExtractFilePath(Application.ExeName)+ 'retornoWS.xml');
  //
  Dados.Lines.Clear;
  Dados.Lines.Add('TpAmb: '+ TpAmbToStr(ACBrNFe1.WebServices.StatusServico.tpAmb));
  Dados.Lines.Add('VerAPlicativo: '+ ACBrNFe1.WebServices.StatusServico.verAplic);
  Dados.Lines.Add('Status: '+ IntToStr(ACBrNFe1.WebServices.StatusServico.cStat));
  Dados.Lines.Add('Motivo: '+ ACBrNFe1.WebServices.StatusServico.xMotivo);
  Dados.Lines.Add('UF: '+ IntToStr(ACBrNFe1.WebServices.StatusServico.cUF));
  Dados.Lines.Add('Data Hora Recebimento: '+ DateTimeToStr(ACBrNFe1.WebServices.StatusServico.dhRecbto));
  Dados.Lines.Add('Data Hora Retorno: '+ DateTimeToStr(ACBrNFe1.WebServices.StatusServico.dhRetorno));
  Dados.Lines.Add('Observação: '+ ACBrNFe1.WebServices.StatusServico.xObs);


end;

procedure TtelaStatus.FormShow(Sender: TObject);
begin
  telaDados.AtualizaConfigAcbr;
end;

end.
