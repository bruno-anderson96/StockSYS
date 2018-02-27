unit uCancelaNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDados, DBTables, Provider, DB, DBClient, Grids,
  DBGrids, ExtCtrls, ActnList, Buttons;

type
  TtelaCancelaNFe = class(TForm)
    DBGrid1: TDBGrid;
    gbNFe: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtProtocolo: TEdit;
    edtJustificativa: TEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    actCancelar: TAction;
    actFechar: TAction;
    procedure FormShow(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaCancelaNFe: TtelaCancelaNFe;

implementation

{$R *.dfm}

procedure TtelaCancelaNFe.FormShow(Sender: TObject);
begin
  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from Pedido where CHAVENFE is not null');
  telaDados.qryPedidos.Open;

  telaDados.AtualizaConfigAcbr;


end;

procedure TtelaCancelaNFe.actFecharExecute(Sender: TObject);
begin
Close;
end;

procedure TtelaCancelaNFe.actCancelarExecute(Sender: TObject);
begin
  if telaDados.qryPedidos.RecordCount = 0 then
  begin
    ShowMessage('É necessário selecionar NFe!');
    Abort;
  end;
  if(edtProtocolo.Text ='') or (edtJustificativa.Text ='') then
  begin
    ShowMessage('É necessário informar o Protocolo e a Justificativa!');
    Abort;
  end;
  try
  {
    telaDados.ACBrNFe1.WebServices.Inutilizacao.Protocolo     := edtProtocolo.Text;
    telaDados.ACBrNFe1.WebServices.Inutilizacao.Justificativa := edtJustificativa.Text;
    telaDados.ACBrNFe1.WebServices.Inutilizacao.ID            := telaDados.qryPedidos.FieldByName('CHAVENFE').AsString;
    telaDados.ACBrNFe1.WebServices.Inutilizacao.Executar;
  }
  except
    ShowMessage('Erro ao cancelar NFe');
  end;

end;

end.
