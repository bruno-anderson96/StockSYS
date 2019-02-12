unit uCadEmit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDados, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TtelaCadEmit = class(TForm)
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label21: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    edtUf: TDBEdit;
    edtTelefone: TDBEdit;
    edtRazSoc: TDBEdit;
    edtNum: TDBEdit;
    edtNomeFan: TDBEdit;
    edtInscEst: TDBEdit;
    edtEndereco: TDBEdit;
    edtEmailEmitente: TDBEdit;
    edtCodMun: TDBEdit;
    edtCnpj: TDBEdit;
    edtCidade: TDBEdit;
    edtCep: TDBEdit;
    edtBairro: TDBEdit;
    Label12: TLabel;
    edtLogin: TDBEdit;
    Label13: TLabel;
    edtSenha: TDBEdit;
    btnSalvar: TSpeedButton;
    Panel1: TPanel;
    radReg: TRadioGroup;
    cbEmpresa: TComboBox;
    Label11: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaCadEmit: TtelaCadEmit;

implementation

uses uConfigEmit;

{$R *.dfm}

procedure TtelaCadEmit.btnSalvarClick(Sender: TObject);

begin
  //telaDados.tblLoginID.Value := 10;
  telaDados.tblLoginADM.Value := 0;


  telaDados.tblEmitenteREGIME.Value := radReg.ItemIndex;
  telaDados.tblEmitenteTIPOEMP.Value := cbEmpresa.ItemIndex;
  telaDados.tblLogin.Post;
  //telaDados.tblEmitenteID_LOGIN.Value := telaDados.tblLoginID.Value;
  telaDados.tblEmitente.Post;

  telaConfigEmit.Show;
  telaCadEmit.Hide;
end;

procedure TtelaCadEmit.FormCreate(Sender: TObject);
begin
  telaDados.tblLogin.Insert;
  telaDados.tblEmitente.Insert;


end;

end.
