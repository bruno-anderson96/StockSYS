unit uSped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TtelaSped = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    edtPath: TEdit;
    btnPath: TSpeedButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure btnPathClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaSped: TtelaSped;

implementation

{$R *.dfm}

procedure TtelaSped.btnPathClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtPath.Text := OpenDialog1.FileName;
end;

end.
