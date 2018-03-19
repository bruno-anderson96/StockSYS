unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, IniFiles, uDados, DB,
  Mask, DBCtrls, ACBrBase, ACBrSocket, ACBrCEP, ACBrIBGE, uPrincipal;

type
  TtelaConfig = class(TForm)
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnFechar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    TabSheet4: TTabSheet;
    OpenDialog1: TOpenDialog;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    edtCaminhoCert: TEdit;
    btnCaminhoCert: TSpeedButton;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox5: TGroupBox;
    btnEscolherCaminho2: TSpeedButton;
    edtCaminhoArq: TEdit;
    GroupBox4: TGroupBox;
    btnEscolherCaminho: TSpeedButton;
    edtLogomarca: TEdit;
    chArquivos: TCheckBox;
    radioFormas: TRadioGroup;
    GroupBox9: TGroupBox;
    Label11: TLabel;
    edtUfws: TEdit;
    radioAmbiente: TRadioGroup;
    GroupBox10: TGroupBox;
    edtHost: TEdit;
    edtPorta: TEdit;
    edtUsuario: TEdit;
    edtSenhaws: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtNumSer: TEdit;
    Label16: TLabel;
    edtRazSoc: TDBEdit;
    edtNomeFan: TDBEdit;
    edtCnpj: TDBEdit;
    edtInscEst: TDBEdit;
    edtEndereco: TDBEdit;
    edtNum: TDBEdit;
    edtBairro: TDBEdit;
    edtCep: TDBEdit;
    edtCidade: TDBEdit;
    edtUf: TDBEdit;
    edtTelefone: TDBEdit;
    edtCodMun: TDBEdit;
    BitBtn1: TBitBtn;
    Schemas: TGroupBox;
    edtCaminhoSchemas: TEdit;
    SpeedButton1: TSpeedButton;
    TabSheet5: TTabSheet;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtEHost: TEdit;
    edtEPorta: TEdit;
    edtEUsuario: TEdit;
    edtESenha: TEdit;
    Label21: TLabel;
    edtEmailEmitente: TDBEdit;
    ACBrCEP1: TACBrCEP;
    SpeedButton2: TSpeedButton;
    TabSheet6: TTabSheet;
    Panel2: TPanel;
    Label22: TLabel;
    label23: TLabel;
    edtArqLog: TEdit;
    edtPathDll: TEdit;
    SpeedButton3: TSpeedButton;
    btnArqLog: TSpeedButton;
    procedure btnEscolherCaminhoClick(Sender: TObject);
    procedure btnEscolherCaminho2Click(Sender: TObject);
    procedure btnCaminhoCertClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnArqLogClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
   
  end;

var
  telaConfig: TtelaConfig;

implementation

{$R *.dfm}

procedure TtelaConfig.btnEscolherCaminhoClick(Sender: TObject);
begin

  OpenDialog1.Execute;
  edtLogomarca.Text := OpenDialog1.FileName;


end;

procedure TtelaConfig.btnEscolherCaminho2Click(Sender: TObject);
begin
OpenDialog1.Execute;
edtCaminhoArq.Text := OpenDialog1.FileName;
end;

procedure TtelaConfig.btnCaminhoCertClick(Sender: TObject);
begin
   OpenDialog1.Execute;
   edtCaminhoCert.Text := OpenDialog1.FileName;
end;


procedure TtelaConfig.FormShow(Sender: TObject);
begin
 telaDados.tblEmitente.Open;
 telaDados.LerArquivoIni;
 PageControl1.TabIndex := 0;
 telaDados.FormataCampos;
 
  //GERAL
  radioFormas.ItemIndex   := telaDados.sFormas;
  edtLogomarca.Text       := telaDados.sLogoMarca;
  chArquivos.Checked      := telaDados.sSalvarArq;
  edtCaminhoArq.Text      := telaDados.sCaminhoArq;
//CERTIFICADO
  edtCaminhoCert.Text     := telaDados.sCertificado;
  edtSenha.Text           := telaDados.sSenha;
  edtNumSer.Text          := telaDados.sSerial;
//EMITENTE
  edtRazSoc.Text          := telaDados.tblEmitenteRAZ_SOC.AsString;
  edtNomeFan.Text         := telaDados.tblEmitenteFANTASIA.AsString;
  edtCnpj.Text            := telaDados.tblEmitenteCNPJ.AsString;
  edtInscEst.Text         := telaDados.tblEmitenteINSCEST.AsString;
  edtEndereco.Text        := telaDados.tblEmitenteENDERECO.AsString;
  edtNum.Text             := telaDados.tblEmitenteNUMERO.AsString;
  edtBairro.Text          := telaDados.tblEmitenteBAIRRO.AsString;
  edtCidade.Text          := telaDados.tblEmitenteCIDADE.AsString;
  edtCep.Text             := telaDados.tblEmitenteCEP.AsString;
  edtUf.Text              := telaDados.tblEmitenteUF.AsString;
  edtTelefone.Text        := telaDados.tblEmitenteTELEFONE.AsString;
  edtCodMun.Text          := telaDados.tblEmitenteCODMUN.AsString;

//WS
  edtUfws.Text            := telaDados.sUfws;
  radioAmbiente.ItemIndex := telaDados.sAmbiente;
  edtHost.Text            := telaDados.sHost;
  edtPorta.Text           := telaDados.sPorta;
  edtUsuario.Text         := telaDados.sUsuario;
  edtSenhaws.Text         := telaDados.sSenhaws;
//Email
  edtEHost.Text           := telaDados.sEHost;
  edtEPorta.Text          := telaDados.sEPorta;
  edtEUsuario.Text        := telaDados.sEUsuario;
  edtESenha.Text          := telaDados.sESenha;

end;

procedure TtelaConfig.btnFecharClick(Sender: TObject);
begin
telaConfig.Close;
telaDados.tblEmitente.Close;
end;

procedure TtelaConfig.btnConfirmarClick(Sender: TObject);
begin
//GERAL
  telaDados.sFormas       := radioFormas.ItemIndex;
  telaDados.sLogoMarca    := edtLogomarca.Text;
  telaDados.sSalvarArq    := chArquivos.Checked;
  telaDados.sCaminhoArq   := edtCaminhoArq.Text;
  telaDados.sCaminhoSchemas  := edtCaminhoSchemas.Text;
//CERTIFICADO
  telaDados.sCertificado  := edtCaminhoCert.Text;
  telaDados.sSenha        := edtSenha.Text;
  telaDados.sSerial       := edtNumSer.Text;
//EMITENTE
  telaDados.sRazSoc       := edtRazSoc.Text;
  telaDados.sFantasia     := edtNomeFan.Text;
  telaDados.sCnpj         := edtCnpj.Text;
  telaDados.sInscEst      := edtInscEst.Text;
  telaDados.sEndereco     := edtEndereco.text;
  telaDados.sNum          := edtNum.Text;
  telaDados.sBairro       := edtBairro.Text;
  telaDados.sCidade       := edtCidade.Text;
  telaDados.sCep          := edtCep.Text;
  telaDados.sUf           := edtUf.Text;
  telaDados.sCodMun       := edtCodMun.Text;
  telaDados.sEmailEmitente:= edtEmailEmitente.Text;
//WS
  telaDados.sUfws         := edtUfws.Text;
  telaDados.sAmbiente     := radioAmbiente.ItemIndex;
  telaDados.sHost         := edtHost.Text;
  telaDados.sPorta        := edtPorta.Text;
  telaDados.sUsuario      := edtUsuario.Text;
  telaDados.sSenhaws      := edtSenhaws.Text;

//Email

  telaDados.sEPorta       := edtEPorta.Text;
  telaDados.sEHost        := edtEHost.Text;
  telaDados.sEUsuario     := edtEUsuario.Text;
  telaDados.sESenha       := edtESenha.Text;

  telaDados.GravaArquivoIni;
  
end;

procedure TtelaConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
telaDados.tblEmitente.Close;
end;

procedure TtelaConfig.BitBtn1Click(Sender: TObject);
begin
telaDados.tblEmitente.Insert;
end;

procedure TtelaConfig.SpeedButton1Click(Sender: TObject);
begin
OpenDialog1.Execute;
edtCaminhoSchemas.Text := OpenDialog1.FileName;
end;

procedure TtelaConfig.SpeedButton2Click(Sender: TObject);
var i : integer;
begin
ACBrCEP1.BuscarPorCEP(edtCep.Text);

  for i := 0 to ACBrCEP1.Enderecos.Count -1 do
  begin
    telaDados.tblEmitenteCEP.AsString := ACBrCEP1.Enderecos[i].CEP;
    telaDados.tblEmitenteENDERECO.AsString := ACBrCEP1.Enderecos[i].Logradouro;
    telaDados.tblEmitenteCIDADE.AsString := ACBrCEP1.Enderecos[i].Municipio;
    telaDados.tblEmitenteUF.AsString := ACBrCEP1.Enderecos[i].UF;
    telaDados.tblEmitenteBAIRRO.AsString := ACBrCEP1.Enderecos[i].Bairro;
    telaDados.tblEmitenteCODMUN.AsString := ACBrCEP1.Enderecos[i].IBGE_Municipio;
  end;
end;

procedure TtelaConfig.btnArqLogClick(Sender: TObject);
begin
OpenDialog1.Execute;
edtArqLog.Text := OpenDialog1.FileName;
end;

procedure TtelaConfig.SpeedButton3Click(Sender: TObject);
begin
OpenDialog1.Execute;
edtPathDll.Text := OpenDialog1.FileName;
end;



end.

