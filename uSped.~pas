unit uSped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, ACBrBase, ACBrSpedFiscal,
  ACBrSEF2, ACBrSEF2Conversao, ACBrUtil, ACBrTXTClass,ACBrEFDBlocos;

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
    OpenDialog1: TOpenDialog;
    ACBrSPEDFiscal1: TACBrSPEDFiscal;
    btnGeraSped: TSpeedButton;
    ACBrSEF21: TACBrSEF2;
    procedure btnPathClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGeraSpedClick(Sender: TObject);
    procedure GerarDadosBloco(pBloco:String);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  telaSped: TtelaSped;

implementation

uses ACBrEFDBloco_0;

{$R *.dfm}

procedure TtelaSped.btnPathClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtPath.Text := OpenDialog1.FileName;
end;

procedure TtelaSped.FormShow(Sender: TObject);
begin
edtPath.Text := Application.ExeName;
end;

procedure TtelaSped.btnGeraSpedClick(Sender: TObject);
begin
// Configura o componente
 
  ACBrSpedFiscal1.DT_INI := DateTimePicker1.Date;
  ACBrSpedFiscal1.DT_FIN := DateTimePicker2.Date;
  ACBrSpedFiscal1.Path := edtPath.Text;
  ACBrSpedFiscal1.Arquivo :=
    'SPED_'+FormatDateTime('ddmmyyyyhhmmss',now)+'.txt';

// repassa os dados
  GerarDadosBloco('0');
 {
if CheckBox1.Checked then GerarDadosBloco('0');
 
if CheckBox2.Checked then GerarDadosBloco('C');
 
if CheckBox3.Checked then GerarDadosBloco('D');
 
if CheckBox4.Checked then GerarDadosBloco('E');
 
if CheckBox5.Checked then GerarDadosBloco('H');
 
if CheckBox6.Checked then GerarDadosBloco('1');
 }
// gera o arquivo
 
  ACBrSpedFiscal1.SaveFileTXT;
{
if CheckBox7.Checked then GerarDadosBloco('9');
}
  ShowMessage('Arquivo Gerado com sucesso!');
end;


procedure TtelaSped.GerarDadosBloco(pBloco: String);
var Int1, Int2, Notas : Integer;
    aTotalICMS : Double;
begin
  aTotalICMS := 0;
  if pBloco = '0' then begin
   with ACBrSpedFiscal1.Bloco_0 do
    begin
      // informações da Empresa
      with Registro0000New do
      begin
         COD_VER    := StrToCodVer('012');
         COD_FIN    := raOriginal;
         NOME       := 'RAZAO SOCIAL DO INFORMANTE';
         CNPJ       := '';
         CPF        := '12345678901'; // Deve ser uma informação valida
         UF         := 'RJ';
         IE         := '0000000000';
         COD_MUN    := 12345678;
         IM         := '';
         SUFRAMA    := '';
         IND_PERFIL := pfPerfilA;
         IND_ATIV   := atOutros;
      end;
      with Registro0001New do
      begin
         IND_MOV := imComDados;
         // informações complementares da Empresa
         with Registro0005New do
         begin
            FANTASIA   := 'NOME FANTASSIA DA EMPRESA';
            CEP        := '21000000';
            ENDERECO   := 'RUA PRINCIPAL';
            NUM        := 'S/N';
            COMPL      := '';
            BAIRRO     := 'CENTRO';
            FONE       := '';
            FAX        := '';
            EMAIL      := 'email@empresa.net';
         end;
         // informações da contabilidade.
      with Registro0100New do
      begin
          NOME       := 'NOME DO CONTADOR';
          CPF        := '12345678900'; // Deve ser uma informação valida
          CRC        := '123456';
          CNPJ       := '';
          CEP        := '';
          ENDERECO   := '';
          NUM        := '';
          COMPL      := '';
          BAIRRO     := '';
          FONE       := '';
          FAX        := '';
          EMAIL      := '';
          COD_MUN    := 3200607;
       end;
       // Clientes
       with Registro0150New do
       begin
         COD_PART := '000001';
         NOME     := 'RAZAO SOCIAL DO CLIENTE';
         COD_PAIS := '001';
         CNPJ     := '12345678000123';
         CPF      := '';
         IE       := '';
         COD_MUN  := 1;
         SUFRAMA  := '';
         ENDERECO := 'ENDERECO';
         NUM      := '';
         COMPL    := 'COMPL';
         BAIRRO   := 'BAIRRO';
       end;
       with Registro0190New do
        begin
          UNID  := 'UN';
          DESCR := 'Descricao unidade';
        end;
       for Int1 := 1 to 6 do
         begin
          if not Registro0200.LocalizaRegistro(IntToStrZero(Int1,6)) then
            begin
              with Registro0200New do
              begin
                 COD_ITEM     := IntToStrZero(Int1,6);
                 DESCR_ITEM   := 'DESCRIÇÃO DO ITEM '+IntToStrZero(Int1,6);
                 COD_BARRA    := IntToStrZero(Int1,13);
                 COD_ANT_ITEM := '';
                 UNID_INV     := 'UN';
                 TIPO_ITEM    := tiMercadoriaRevenda;
                 COD_NCM      := '';
                 EX_IPI       := '';
                 COD_GEN      := '';
                 COD_LST      := '';
                 ALIQ_ICMS    := 18;
              end;
            end;
         end;
      end;
    end;
  end
 
  else if pBloco = 'C' then begin
 
  end
 
  else if pBloco = 'D' then begin
 
  end
 
  else if pBloco = 'E' then begin
 
  end
 
  else if pBloco = 'H' then begin
 
  end
 
  else if pBloco = '1' then begin
 
  end
 
  else if pBloco = '9' then begin
 
  end;
 
end;

end.
