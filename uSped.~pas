unit uSped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, ACBrBase, ACBrSpedFiscal,
  ACBrSEF2, ACBrSEF2Conversao, ACBrUtil, ACBrTXTClass,ACBrEFDBlocos, uDados;

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

uses ACBrEFDBloco_K_Class, ACBrEFDBloco_K, ACBrEFDBloco_0, ACBrEFDBloco_0_Class;

{$R *.dfm}

procedure TtelaSped.btnPathClick(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtPath.Text := OpenDialog1.FileName;
end;

procedure TtelaSped.FormShow(Sender: TObject);
begin
edtPath.Text := ExtractFilePath(Application.ExeName) + 'SPED';
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
  GerarDadosBloco('C');
  GerarDadosBloco('D');
  GerarDadosBloco('E');
  GerarDadosBloco('H');
  GerarDadosBloco('1');
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

  telaDados.qryEmitente.Close;
  telaDados.qryEmitente.SQL.Clear;
  telaDados.qryEmitente.SQL.Add('Select * from Emitente where id_login = ');
  telaDados.qryEmitente.SQL.Add(telaDados.tblLoginID.AsString);
  telaDados.qryEmitente.Open;

  telaDados.qryContador.Close;
  telaDados.qryContador.SQL.Clear;
  telaDados.qryContador.SQL.Add('Select * from Contador where id_login = ');
  telaDados.qryContador.SQL.Add(telaDados.tblLoginID.AsString);
  telaDados.qryContador.Open;

  telaDados.qryClientes.Close;
  telaDados.qryClientes.SQL.Clear;
  telaDados.qryClientes.SQL.Add('Select * from Clientes where id_login = '); //CORRIGIR POR DATA?
  telaDados.qryClientes.SQL.Add(telaDados.tblLoginID.AsString); //CORRIGIR POR DATA?
  telaDados.qryClientes.Open;

  telaDados.qryUnidade.Close;
  telaDados.qryUnidade.SQL.Clear;
  telaDados.qryUnidade.SQL.Add('Select * from Unidade where id_login = '); //CORRIGIR POR DATA?
  telaDados.qryUnidade.SQL.Add(telaDados.tblLoginID.AsString); //CORRIGIR POR DATA?
  telaDados.qryUnidade.Open;

  aTotalICMS := 0;
  if pBloco = '0' then begin
   with ACBrSpedFiscal1.Bloco_0 do
    begin
      // informações da Empresa
      with Registro0000New do
      begin
         COD_VER    := StrToCodVer('012');
         COD_FIN    := raOriginal;.tblEmitente
         NOME       := telaDados.qryEmitente.FieldByName('RAZ_SOC').AsString;
         CNPJ       := telaDados.qryEmitente.FieldByName('CNPJ').AsString;
         CPF        := '12345678901'; // Deve ser uma informação valida
         UF         := telaDados.qryEmitente.FieldByName('UF').AsString;
         IE         := telaDados.qryEmitente.FieldByName('INCEST').AsString;
         COD_MUN    := telaDados.qryEmitente.FieldByName('COD_MUN').AsString;
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
            FANTASIA   := telaDados.qryEmitente.FieldByName('FANTASIA').AsString;
            CEP        := telaDados.qryEmitente.FieldByName('CEP').AsString;
            ENDERECO   := telaDados.qryEmitente.FieldByName('ENDERECO').AsString;
            NUM        := telaDados.qryEmitente.FieldByName('NUMERO').AsString;
            COMPL      := telaDados.qryEmitente.FieldByName('COMPLEMENTO').AsString;
            BAIRRO     := telaDados.qryEmitente.FieldByName('BAIRRO').AsString;
            FONE       := '';
            FAX        := '';
            EMAIL      := telaDados.qryEmitente.FieldByName('EMAIL').AsString;
         end;
         // informações da contabilidade.
      with Registro0100New do
      begin
          NOME       := telaDados.qryContador.FieldByName('NOME').AsString;
          CPF        := telaDados.qryContador.FieldByName('CPF').AsString; // Deve ser uma informação valida
          CRC        := telaDados.qryContador.FieldByName('CRC').AsString;
          CNPJ       := '';
          CEP        := telaDados.qryContador.FieldByName('CEP').AsString;
          ENDERECO   := telaDados.qryContador.FieldByName('ENDERECO').AsString;
          NUM        := telaDados.qryContador.FieldByName('NUM').AsString;
          COMPL      := telaDados.qryContador.FieldByName('COMPL').AsString;
          BAIRRO     := telaDados.qryContador.FieldByName('BAIRRO').AsString;
          FONE       := telaDados.qryContador.FieldByName('CELULAR1').AsString;
          FAX        := telaDados.qryContador.FieldByName('CELULAR2').AsString;
          EMAIL      := telaDados.qryContador.FieldByName('EMAIL').AsString;
          COD_MUN    := telaDados.qryContador.FieldByName('COD_MUN').AsString;
       end;
       // Clientes
       with Registro0150New do
       begin
         COD_PART := telaDados.qryContador.FieldByName('ID').AsString;
         NOME     := telaDados.qryContador.FieldByName('NOME').AsString;
         COD_PAIS := '001';
         CNPJ     := '';
         CPF      := telaDados.qryContador.FieldByName('CNPJ_CPF').AsString;
         IE       := telaDados.qryContador.FieldByName('INSC_RG').AsString;
         COD_MUN  := '';
         SUFRAMA  := '';
         ENDERECO := telaDados.qryContador.FieldByName('ENDERECO').AsString;
         NUM      := telaDados.qryContador.FieldByName('NUM').AsString;
         COMPL    := telaDados.qryContador.FieldByName('COMPLEMENTO').AsString;
         BAIRRO   := telaDados.qryContador.FieldByName('BAIRRO').AsString;
       end;
       with Registro0190New do
        begin
          UNID  := telaDados.qryUnidade.FieldByName('SIGLA').AsString;
          DESCR := telaDados.qryUnidade.FieldByName('NOME').AsString;
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
   Notas := StrToInt64Def('1',1);
    with ACBrSpedFiscal1.Bloco_C do
    begin
      with RegistroC001New do
      begin
         IND_MOV := imComDados;
         //
         for Int1 := 1 to Notas do
         begin
           with RegistroC100New do
           begin
             COD_PART      := '000001';
             IND_EMIT      := edEmissaoPropria;
             IND_OPER      := tpEntradaAquisicao;
             COD_MOD       := '01';
             COD_SIT       := sdRegular;
             SER           := '';
             NUM_DOC       := IntToStrZero(Int1,6);
             CHV_NFE       := '';
             DT_DOC        := Date();
             DT_E_S        := Date();
             VL_DOC        := 0;
             IND_PGTO      := tpSemPagamento;
             VL_DESC       := 0;
             VL_ABAT_NT    := 0;
             VL_MERC       := 0;
             IND_FRT       := tfSemCobrancaFrete;
             VL_SEG        := 0;
             VL_OUT_DA     := 0;
             VL_BC_ICMS    := 0;
             VL_ICMS       := 0;
             VL_BC_ICMS_ST := 0;
             VL_ICMS_ST    := 0;
             VL_IPI        := 0;
             VL_PIS        := 0;
             VL_COFINS     := 0;
             VL_PIS_ST     := 0;
             VL_COFINS_ST  := 0;
             //c170
             for Int2 := 1 to 6 do
             begin
               with RegistroC170New do   //Inicio Adicionar os Itens:
               begin
                  NUM_ITEM    := IntToStrZero(Int2,3);
                  COD_ITEM    := IntToStrZero(Int2,6);
                  DESCR_COMPL := 'Descricao do item '+IntToStrZero(Int2,6);
                  QTD         := 1;
                  UNID        := 'UN';
                  VL_ITEM     := 10;
                  VL_DESC     := 0;
                  IND_MOV     := mfNao;
                  CST_ICMS    := '000';
                  CFOP        := '5102';
                  COD_NAT     := '';
                  VL_BC_ICMS  := 10;
                  ALIQ_ICMS   := 18;
                  VL_ICMS     := 1.8;
                  VL_BC_ICMS_ST := 0;
                  ALIQ_ST       := 0;
                  VL_ICMS_ST    := 0;
                  IND_APUR      := iaMensal;
                  CST_IPI       := 'teste';
                  COD_ENQ       := '';
                  VL_BC_IPI     := 0;
                  ALIQ_IPI      := 0;
                  VL_IPI        := 0;
                  CST_PIS       :='teste';
                  VL_BC_PIS     := 0;
                  ALIQ_PIS_PERC := 0;
                  QUANT_BC_PIS  := 0;
                  ALIQ_PIS_R    := 0;
                  VL_PIS        := 0;
                  CST_COFINS    := 'teste';
                  VL_BC_COFINS  := 0;
                  ALIQ_COFINS_PERC := 0;
                  QUANT_BC_COFINS  := 0;
                  ALIQ_COFINS_R    := 0;
                  VL_COFINS        := 0;
                  COD_CTA          := '000';
                end;
             end;
             //c190
             with RegistroC190New do
             begin
                CST_ICMS    := '000';
                CFOP        := '5102';
                ALIQ_ICMS   := 18;
                VL_OPR      := 60;
                VL_BC_ICMS  := 60;
                VL_ICMS     := 10.8;
                VL_BC_ICMS_ST := 0;
                VL_ICMS_ST    := 0;
                VL_RED_BC     := 0;
                VL_IPI        := 0;
                COD_OBS       := '';
             end;
             aTotalICMS := aTotalICMS + 10.8;
           end;
         end;
      end;
    end;
  end
 
  else if pBloco = 'D' then begin
   with ACBrSpedFiscal1.Bloco_D do
    begin
       with RegistroD001New do
       begin
         IND_MOV := imSemDados;
       end;
    end;
  end
 
  else if pBloco = 'E' then begin
   with ACBrSpedFiscal1.Bloco_E do
    begin
      with RegistroE001New do
      begin
         IND_MOV := imComDados;
         with RegistroE100New do
         begin
           DT_INI := DateTimePicker1.DateTime;
           DT_FIN := DateTimePicker2.DateTime;
         end;
         with RegistroE110New do
         begin
            VL_TOT_DEBITOS := aTotalICMS;
            VL_AJ_DEBITOS := 0;
            VL_TOT_AJ_DEBITOS := 0;
            VL_ESTORNOS_CRED := 0;
            VL_TOT_CREDITOS := 0;
            VL_AJ_CREDITOS := 0;
            VL_TOT_AJ_CREDITOS := 0;
            VL_ESTORNOS_DEB := 0;
            VL_SLD_CREDOR_ANT := 0;
            VL_SLD_APURADO := aTotalICMS;
            VL_TOT_DED := 0;
            VL_ICMS_RECOLHER := aTotalICMS;
            VL_SLD_CREDOR_TRANSPORTAR := 0;
            DEB_ESP := 0;
         end;
      end;
    end;
  end
 
  else if pBloco = 'H' then begin
  with ACBrSpedFiscal1.Bloco_H do
    begin
      with RegistroH001New do
      begin
         IND_MOV := imComDados;
         //
         with RegistroH005New do
         begin
            DT_INV := Date;
            VL_INV := 1000;
            // FILHO
            for Int1 := 1 to 6 do
            begin
               with RegistroH010New do
               begin
                  COD_ITEM := IntToStrZero(Int1,6);
                  UNID := 'UN';
                  QTD  := 1;
                  VL_UNIT := 100;
                  VL_ITEM := 100;
                  IND_PROP := piInformante;
                  COD_PART := '';
                  TXT_COMPL := '';
                  COD_CTA := '';
               end;
            end;
         end;
      end;
    end;
  end
 
  else if pBloco = '1' then begin
   with ACBrSpedFiscal1.Bloco_1 do
    begin
      with Registro1001New do
      begin
        IND_MOV := imSemDados;
      end;
    end;
  end
 
  else if pBloco = '9' then begin
    ACBrSPEDFiscal1.WriteBloco_9;
  end;
 
end;

end.
