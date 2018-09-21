unit uPreviewCfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TtelaPreviewCfe = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRMemo1: TQRMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPreviewCfe: TtelaPreviewCfe;

implementation

{$R *.dfm}

end.
