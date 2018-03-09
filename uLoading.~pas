unit uLoading;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, pngimage, ExtCtrls, ComCtrls, uPrincipal, StdCtrls;

type
  TtelaLoading = class(TForm)
    Image1: TImage;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaLoading: TtelaLoading;

implementation

{$R *.dfm}

procedure TtelaLoading.Timer1Timer(Sender: TObject);
begin
if ( ProgressBar1.Position < 100) then begin
ProgressBar1.Position := ProgressBar1.Position + 1;
Label1.Caption := IntToStr(ProgressBar1.Position) +'%';
end else begin
telaPrincipal.Show;
Hide;
end;


end;

end.
