unit uInutilizaNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, Buttons, ExtCtrls, uDados;

type
  TtelaInutilizaNfe = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtModelo: TEdit;
    edtSerie: TEdit;
    edtAno: TEdit;
    edtNumIni: TEdit;
    edtNumFin: TEdit;
    GroupBox1: TGroupBox;
    memoJustificativa: TMemo;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    actEnviar: TAction;
    actFechar: TAction;
    Label7: TLabel;
    edtCnpj: TEdit;
    GroupBox2: TGroupBox;
    memoRetorno: TMemo;
    procedure FormShow(Sender: TObject);
    procedure actEnviarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaInutilizaNfe: TtelaInutilizaNfe;

implementation

{$R *.dfm}

procedure TtelaInutilizaNfe.FormShow(Sender: TObject);
begin
  telaDados.AtualizaConfigAcbr;
end;

procedure TtelaInutilizaNfe.actEnviarExecute(Sender: TObject);
begin
  if (edtModelo.Text = '') or (edtSerie.Text = '') or (edtAno.Text = '') or (edtCnpj.Text = '') or
     (edtNumIni.Text = '') or (edtNumFin.Text = '') or (memoJustificativa.Text = '') then
  begin
    ShowMessage('Todos os campos do formulário devem sem preenchidos!');
    Abort;
  end;
  telaDados.ACBrNFe1.WebServices.Inutiliza(edtCnpj.Text,
                                            memoJustificativa.Text,
                                            StrToInt(edtAno.Text),
                                            StrToInt(edtModelo.Text),
                                            StrToInt(edtSerie.Text),
                                            StrToInt(edtNumIni.Text),
                                            StrToInt(edtNumFin.Text));

   memoRetorno.Lines.Text := UTF8Encode(TelaDados.ACBrNFe1.WebServices.Inutilizacao.RetornoWS);


end;

procedure TtelaInutilizaNfe.actFecharExecute(Sender: TObject);
begin
Close;
end;

end.
