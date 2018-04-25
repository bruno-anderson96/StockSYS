unit uPesCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, uDados;

type
  TtelaPesCliente = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    editBusca: TEdit;
    cbCategoria: TComboBox;
    btnPesquisa: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editBuscaKeyPress(Sender: TObject; var Key: Char);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  telaPesCliente: TtelaPesCliente;

implementation

  uses uCadClientes, DB;

{$R *.dfm}

procedure TtelaPesCliente.btnPesquisaClick(Sender: TObject);
begin
  if editBusca.Text = '' then
  begin
    telaDados.qryClientes.Close;
    telaDados.qryClientes.SQL.Clear;
    telaDados.qryClientes.SQL.Add('select * from cliente');
    telaDados.qryClientes.Open;
  end else
  begin
    telaDados.qryClientes.Close;
    telaDados.qryClientes.SQL.Clear;
    telaDados.qryClientes.SQL.Add('select * from cliente where ');
    case cbCategoria.ItemIndex of
      0:telaDados.qryClientes.SQL.Add('NOME like :pDados');
      1:telaDados.qryClientes.SQL.Add('CNPJ_cpf like :pDados ');
      2:telaDados.qryClientes.SQL.Add('INSC_RG like :pDados ');
      3:telaDados.qryClientes.SQL.Add('CIDADE_END like :pDados');
    end;
    telaDados.qryClientes.Params.ParamByName('pDados').asString := editBusca.Text + '%';
    telaDados.qryClientes.Open;
  end;                         
end;

procedure TtelaPesCliente.FormShow(Sender: TObject);
begin
  cbCategoria.ItemIndex := 1;
end;

procedure TtelaPesCliente.DBGrid1DblClick(Sender: TObject);
var num : String;
begin
  num := DBGrid1.Columns.Items[6].Field.AsString;
  telaDados.tblClientes.Locate('INSC_RG', num , []);
  telaPesCliente.Close;
end;

procedure TtelaPesCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  telaCadClientes.Show;
end;

procedure TtelaPesCliente.editBuscaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key =#13 then btnPesquisa.Click;
end;

end.
