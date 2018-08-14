unit uContador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, ACBrBase,
  ACBrSocket, ACBrCEP;

type
  TtelaContador = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtId: TDBEdit;
    Label2: TLabel;
    edtNome: TDBEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    edtEndereco: TDBEdit;
    Label4: TLabel;
    edtNum: TDBEdit;
    Label5: TLabel;
    edtCompl: TDBEdit;
    Label6: TLabel;
    edtBairro: TDBEdit;
    Label7: TLabel;
    edtCep: TDBEdit;
    Label8: TLabel;
    edtCodMun: TDBEdit;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    edtEmail: TDBEdit;
    Label10: TLabel;
    edtCel1: TDBEdit;
    Label11: TLabel;
    edtCel2: TDBEdit;
    Label12: TLabel;
    edtCnpj: TDBEdit;
    Label13: TLabel;
    edtCpf: TDBEdit;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnBuscaCep: TSpeedButton;
    ACBrCEP1: TACBrCEP;
    Label14: TLabel;
    edtCidade: TDBEdit;
    Label15: TLabel;
    cbUf: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnBuscaCepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaContador: TtelaContador;

implementation

uses uDados;

{$R *.dfm}

procedure TtelaContador.FormShow(Sender: TObject);
begin
  telaDados.FormataCampos;

  if edtNome.Text = '' then begin
    btnEditar.Enabled := false;
    btnSalvar.Enabled := true;
    btnBuscaCep.Enabled := true;
    edtNome.Enabled := true;
    edtCnpj.Enabled := true;
    edtCpf.Enabled := true;
    edtCep.Enabled := true;
    edtEndereco.Enabled := true;
    edtBairro.Enabled := true;
    edtNum.Enabled := true;
    edtCompl.Enabled := true;
    edtCodMun.Enabled := true;
    edtEmail.Enabled := true;
    edtCel1.Enabled := true;
    edtCel2.Enabled := true;
    edtCidade.Enabled := true;
    cbUf.Enabled := true;
  end else begin
    btnEditar.Enabled := true;
    btnSalvar.Enabled := false;
    btnBuscaCep.Enabled := false;
    edtNome.Enabled := false;
    edtCnpj.Enabled := false;
    edtCpf.Enabled := false;
    edtCep.Enabled := false;
    edtEndereco.Enabled := false;
    edtBairro.Enabled := false;
    edtNum.Enabled := false;
    edtCompl.Enabled := false;
    edtCodMun.Enabled := false;
    edtEmail.Enabled := false;
    edtCel1.Enabled := false;
    edtCel2.Enabled := false;
    edtCidade.Enabled := false;
    cbUf.Enabled    := false;
  end;

  with telaDados.tblEstados do
  begin
    First;
    while not Eof do
    begin
      cbUf.Items.Add(telaDados.tblEstados.FieldByName('UF').AsString);
      Next;
    end;
  end;


end;

procedure TtelaContador.btnEditarClick(Sender: TObject);
begin
  btnEditar.Enabled := false;
  btnSalvar.Enabled := true;
  btnBuscaCep.Enabled := true;
  edtNome.Enabled := true;
  edtCnpj.Enabled := true;
  edtCpf.Enabled := true;
  edtCep.Enabled := true;
  edtEndereco.Enabled := true;
  edtBairro.Enabled := true;
  edtNum.Enabled := true;
  edtCompl.Enabled := true;
  edtCodMun.Enabled := true;
  edtEmail.Enabled := true;
  edtCel1.Enabled := true;
  edtCel2.Enabled := true;
  edtCidade.Enabled := true;
  cbUf.Enabled := true;
  telaDados.tblContador.Edit;
end;

procedure TtelaContador.btnSalvarClick(Sender: TObject);
begin
  btnEditar.Enabled := true;
  btnSalvar.Enabled := false;
  btnBuscaCep.Enabled := false;
  edtNome.Enabled := false;
  edtCnpj.Enabled := false;
  edtCpf.Enabled := false;
  edtCep.Enabled := false;
  edtEndereco.Enabled := false;
  edtBairro.Enabled := false;
  edtNum.Enabled := false;
  edtCompl.Enabled := false;
  edtCodMun.Enabled := false;
  edtEmail.Enabled := false;
  edtCel1.Enabled := false;
  edtCel2.Enabled := false;
  edtCidade.Enabled := false;
  cbUf.Enabled := false;

  telaDados.tblContadorID_LOGIN.Value := telaDados.tblLoginID.Value;

  telaDados.tblContador.Post;
end;

procedure TtelaContador.btnBuscaCepClick(Sender: TObject);
var
i : integer;
begin
 ACBrCEP1.BuscarPorCEP(edtCep.Text);

  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    telaDados.tblContadorCEP.AsString        := UpperCase(ACBrCEP1.Enderecos[i].CEP);
    telaDados.tblContadorENDERECO.AsString   := UpperCase(ACBrCEP1.Enderecos[i].Logradouro);
    telaDados.tblContadorCOMPL.AsString      := UpperCase(ACBrCEP1.Enderecos[i].Complemento);
    telaDados.tblContadorBAIRRO.AsString     := UpperCase(ACBrCEP1.Enderecos[i].Bairro);
    telaDados.tblContadorCIDADE.AsString := UpperCase(ACBrCEP1.Enderecos[i].Municipio);
    cbUf.Text                                := UpperCase(ACBrCEP1.Enderecos[i].UF);
  end;
end;

end.
