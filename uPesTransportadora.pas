unit uPesTransportadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, uDados;

type
  TtelaPesTransportadora = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    edtBusca: TEdit;
    cbCategoria: TComboBox;
    btnPesquisa: TSpeedButton;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaPesTransportadora: TtelaPesTransportadora;

implementation

uses uCadTransportadora;

{$R *.dfm}

procedure TtelaPesTransportadora.DBGrid1DblClick(Sender: TObject);
var
num: String;
begin
  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      telaCadTransportadora.cbTUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;
  
  num := DBGrid1.Columns.Items[0].Field.AsString;
  telaDados.tblTransportadora.Locate('ID', num , []);
  telaCadTransportadora.cbTUf.Text := telaDados.tblTransportadoraUF.AsString;
  telaPesTransportadora.Close;

  telaCadTransportadora.ExcluirT.Enabled := true;
end;

procedure TtelaPesTransportadora.btnPesquisaClick(Sender: TObject);
begin
  if edtBusca.Text = '' then
  begin
    telaDados.qryTransportadora.Close;
    telaDados.qryTransportadora.SQL.Clear;
    telaDados.qryTransportadora.SQL.Add('select * from TRANSPORTADORA');
    telaDados.qryTransportadora.Open;
  end else
  begin
    telaDados.qryTransportadora.Close;
    telaDados.qryTransportadora.SQL.Clear;
    telaDados.qryTransportadora.SQL.Add('select * from TRANSPORTADORA where ');
    case cbCategoria.ItemIndex of
      0:telaDados.qryTransportadora.SQL.Add('DESCRICAO like :pDados');
      1:telaDados.qryTransportadora.SQL.Add('CNPJ_cpf like :pDados ');
      2:telaDados.qryTransportadora.SQL.Add('INSC_RG like :pDados ');
    end;
    telaDados.qryTransportadora.Params.ParamByName('pDados').asString := edtBusca.Text + '%';
    telaDados.qryTransportadora.Open;
  end;
end;

end.
