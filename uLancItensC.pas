unit uLancItensC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,
  ComCtrls, uDados, ActnList;

type
  TtelaLancItensC = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    editId: TDBEdit;
    editDesc: TDBEdit;
    editQuant: TDBEdit;
    editValor: TDBEdit;
    editDescnt: TDBEdit;
    editAcr: TDBEdit;
    editVrt: TDBEdit;
    editIdPedido: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaLancItensC: TtelaLancItensC;

implementation

{$R *.dfm}

end.
