unit uPesNCM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, uDados;

type
  TtelaPesNCM = class(TForm)
    DBGrid1: TDBGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPesNCM: TtelaPesNCM;

implementation

{$R *.dfm}

uses uCadProdutos;

procedure TtelaPesNCM.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
t: String; 
begin 
// número da coluna, começando em zero 
if DataCol >= 1 then 
begin 
with DBGrid1.Canvas do 
begin 
// cor do fundo 
Pen.Style:=psClear; 
Brush.Style:=bsSolid; 
Brush.Color:=clYellow; 
Rectangle(Rect); 

// pega o texto do campo memo 
t:=Column.Field.Value; 

Font.Color:=clRed; 
Font.Style:=[]; 
TextOut(Rect.Left+2,Rect.Top+2,t); 
end; 
end; 
end;
procedure TtelaPesNCM.DBGrid1CellClick(Column: TColumn);
begin
telaCadProdutos.editNcm.Text := DBGrid1.Columns[0].Field.asString;
telaPesNCM.Close;
end;

end.
