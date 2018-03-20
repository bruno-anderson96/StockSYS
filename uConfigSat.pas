unit uConfigSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ACBrPosPrinter, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrSAT, ACBrBase,  TypInfo, ACBrSATClass,
   ACBrIntegrador, pcnConversao, Math, ACBrUtil, RLPrinters, Printers, ACBrSATMFe_integrador, pcnVFPe,
   ACBrDFeSSL;

type
  TtelaConfigSat = class(TForm)
    ACBrIntegrador1: TACBrIntegrador;
    ACBrSAT1: TACBrSAT;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    ACBrPosPrinter1: TACBrPosPrinter;
    Memo1: TMemo;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Enviar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ComboBox1: TComboBox;
    editSchema: TEdit;
    SpeedButton3: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure At(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnviarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AjustarCfe;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure GetsignAC(var Chave: AnsiString);
    procedure GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure GetNumeroSessao(var Chave: Integer);
  public
    { Public declarations }
  end;

var
  telaConfigSat: TtelaConfigSat;

implementation

uses pcnCFe;

{$R *.dfm}

procedure TtelaConfigSat.GetsignAC(var Chave: AnsiString);
begin
  Chave := AnsiString( 'MD2Nof/O0tQMPKiYeeAydSjYt7YV9kU0nWKZGXHVdYIzR2W9Z6tgXni/Y5bnjmUAk8MkqlBJIiOOIskKCjJ086k7vAP0EU5cBRYj/nzHUi'+'Rdu9AVD7WRfVs00BDyb5fsnnKg7gAXXH6SBgCxG9yjAkxJ0l2E2idsWBAJ5peQEBZqtHytRUC+FLaSfd3+66QNxIBlDwQIRzUGPaU6fvErVDSfMUf8WpkwnPz36fCQnyLypqe/5mbox9pt3RCbbXcYqnR/4poYGr9M9Kymj4/PyX9xGeiXwbgzOOHNIU5M/aAs0rulXz948bZla0eXABgEcp6mDkTzweLPZTbmOhX+eA=='  );

end;

procedure TtelaConfigSat.GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := AnsiString( '123456789' );
end;

procedure TtelaConfigSat.GetNumeroSessao(var Chave: Integer);
begin
  Chave := 900000102;
end; 

procedure TtelaConfigSat.At(Sender: TObject);
begin
memo1.Text := acbrSat1.AtivarSAT(1,'11.111.111/1111-11',23);
end;

procedure TtelaConfigSat.SpeedButton6Click(Sender: TObject);
begin
Memo1.Text := ACBrSAT1.ConsultarSAT;
end;

procedure TtelaConfigSat.AjustarCfe;
begin
 with ACBrSAT1 do
 begin


  Modelo := satDinamico_stdcall;
  Config.ide_CNPJ := '11111111111111';
  {
  Config.ide_CNPJ := '08490295000133';
  Config.ide_CNPJ := '11.111.111/1111-11'; }
  config.ide_numeroCaixa := 1;
  Config.ide_tpAmb := taHomologacao;
  Config.emit_IE := '123456789123';
  Config.emit_IM := '';
  Config.emit_cRegTrib := RTSimplesNacional;
  Config.emit_cRegTribISSQN := RTISSMicroempresaMunicipal;
  Config.emit_indRatISSQN := irNao;    {
  Config.emit_CNPJ := '14200166000166'; }
  Config.emit_CNPJ := '11111111111111';


  {ACBrSAT1.OnGetNumeroSessao := GetNumeroSessao;}

  end;

  ACBrSAT1.Inicializar;

ACBrSAT1.OnGetcodigoDeAtivacao := GetcodigoDeAtivacao;
ACBrSAT1.OnGetsignAC := GetsignAC;

{'12373349000158'}
end;

procedure TtelaConfigSat.SpeedButton5Click(Sender: TObject);
begin
  
  Memo1.Text := ACBrSAT1.AssociarAssinatura( '11111111111111' + '11111111111111','MD2Nof/O0tQMPKiYeeAydSjYt7YV9kU0nWKZGXHVdYIzR2W9Z6tgXni/Y5bnjmUAk8MkqlBJIiOOIskKCjJ086k7vAP0EU5cBRYj/nzHUiRdu9AVD7WRfVs00BDyb5fsnnKg7gAXXH6SBgCxG9yjAkxJ0l2E2idsWBAJ5peQEBZqtHytRUC+FLaSfd3+'+'66QNxIBlDwQIRzUGPaU6fvErVDSfMUf8WpkwnPz36fCQnyLypqe/5mbox9pt3RCbbXcYqnR/4poYGr9M9Kymj4/PyX9xGeiXwbgzOOHNIU5M/aAs0rulXz948bZla0eXABgEcp6mDkTzweLPZTbmOhX+eA==');
end;

procedure TtelaConfigSat.SpeedButton1Click(Sender: TObject);
var
  TotalItem, TotalGeral, Pagto1: Double;
  A: Integer;
  Loops: Integer;
begin
  Memo1.Clear;{
  TotalGeral := 0;
  PageControl1.ActivePage := tsGerado;  } 

  ACBrSAT1.CFe.IdentarXML := true;;
  ACBrSAT1.CFe.TamanhoIdentacao := 3;
  ACBrSAT1.CFe.RetirarAcentos := true;;
  {
  mVendaEnviar.Clear;
   }
  // Trasnferindo Informações de Config para o CFe //
  AjustarCfe;
  ACBrSAT1.InicializaCFe;



  // Montando uma Venda //
  with ACBrSAT1.CFe do
  begin

    ide.numeroCaixa := 1;
    ide.cNF := Random(999999);

    Dest.CNPJCPF := '5481336000137';
    Dest.xNome := 'D.J. SYSTEM ÁÉÍÓÚáéíóúÇç teste de nome Longo';

    Entrega.xLgr := 'logradouro';
    Entrega.nro := '112233';
    Entrega.xCpl := 'complemento';
    Entrega.xBairro := 'bairro';
    Entrega.xMun := 'municipio';
    Entrega.UF := 'RJ';

    Loops := max(Trunc(10 / 3)-1, 0);

    For A := 0 to Loops do  // Ajuste aqui para vender mais itens
    begin
    with Det.Add do
    begin
      nItem := 1 + (A * 3);
      Prod.cProd := 'ACBR0001';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'Assinatura SAC';
      prod.NCM := '99';
      Prod.CFOP := '5120';
      Prod.uCom := 'UN';
      Prod.qCom := 1;
      Prod.vUnCom := 120.00;
      Prod.indRegra := irTruncamento;
      Prod.vDesc := 1;

      with Prod.obsFiscoDet.Add do
      begin
        xCampoDet := 'campo';
        xTextoDet := 'texto';
      end;

      TotalItem := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc, -2);
      TotalGeral := TotalGeral + TotalItem;
      Imposto.vItem12741 := TotalItem * 0.12;

      Imposto.ICMS.orig := oeNacional;
      if Emit.cRegTrib = RTSimplesNacional then
        Imposto.ICMS.CSOSN := csosn102
      else
        Imposto.ICMS.CST := cst00;

      Imposto.ICMS.pICMS := 18;

      Imposto.PIS.CST := pis49;
      Imposto.PIS.vBC := TotalItem;
      Imposto.PIS.pPIS := 0.0065;

      Imposto.COFINS.CST := cof49;
      Imposto.COFINS.vBC := TotalItem;
      Imposto.COFINS.pCOFINS := 0.0065;
      //
      //Imposto.COFINSST.vBC := 87206.46;
      //Imposto.COFINSST.pCOFINS := 1.8457;

      infAdProd := 'Informacoes adicionais';
    end;

    with Det.Add do
    begin
      nItem := 2 + (A * 3);
      Prod.cProd := '6291041500213';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'Outro produto Qualquer, com a Descrição Grande';
      Prod.CFOP := '5529';
      Prod.uCom := 'un';
      Prod.qCom := 1.1205;
      Prod.vUnCom := 1.210;
      Prod.indRegra := irTruncamento;
      Prod.vOutro := 2;

      TotalItem := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc, -2);
      TotalGeral := TotalGeral + TotalItem;
      Imposto.vItem12741 := TotalItem * 0.30;

      Imposto.ICMS.orig := oeNacional;
      if Emit.cRegTrib = RTSimplesNacional then
        Imposto.ICMS.CSOSN := csosn400
      else
        Imposto.ICMS.CST := cst40;

      Imposto.PIS.CST := pis49;
      Imposto.PIS.qBCProd := TotalItem;
      Imposto.PIS.vAliqProd := 1.0223;

      Imposto.PISST.qBCProd := TotalItem;
      Imposto.PISST.vAliqProd := 1.0223;

      Imposto.COFINS.CST := cof49;
      Imposto.COFINS.qBCProd := TotalItem;
      Imposto.COFINS.vAliqProd := 1.0223;

      //Imposto.COFINSST.qBCProd := 503.6348;
      //Imposto.COFINSST.vAliqProd := 779.4577;
    end;

    with Det.Add do
    begin
      nItem := 3 + (A * 3);
      Prod.cProd := 'abc123';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'ACBrSAT rules';
      Prod.NCM := '99';
      Prod.CFOP := '5844';
      Prod.uCom := 'un';
      Prod.qCom := 1.1205;
      Prod.vUnCom := 1.210;
      Prod.indRegra := irTruncamento;

      TotalItem := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc, -2);
      TotalGeral := TotalGeral + TotalItem;

      Imposto.ICMS.orig := oeEstrangeiraImportacaoDireta;
      if Emit.cRegTrib = RTSimplesNacional then
        Imposto.ICMS.CSOSN := csosn102
      else
        Imposto.ICMS.CST := cst60;

      Imposto.PIS.CST := pis49;

      Imposto.PISST.qBCProd := TotalItem;
      Imposto.PISST.vAliqProd := 1.1826;

      Imposto.COFINS.CST := cof49;

      infAdProd := 'Informacoes adicionais';
    end;

    end;


    Total.DescAcrEntr.vDescSubtot := 5;
    Total.vCFeLei12741 := 1.23;

    Pagto1 := RoundABNT(TotalGeral/2,-2);
    with Pagto.Add do
    begin
      cMP := mpCartaodeCredito;
      vMP := Pagto1;
    end;

    with Pagto.Add do
    begin
      cMP := mpDinheiro;
      vMP := TotalGeral - Pagto1 + 100;
    end;

    InfAdic.infCpl := 'Acesse www.projetoacbr.com.br para obter mais;informações sobre o componente ACBrSAT;'+
                      'Precisa de um PAF-ECF homologado?;Conheça o DJPDV - www.djpdv.com.br';

   { InfAdic.infCpl := '</linha_simples>;'+
                        '</ce><e><n>SENHA XXX</n></e>;'+
                        '</linha_simples>';}
  end;

  Memo1.Lines.Text := ACBrSAT1.CFe.GerarXML( True );    // True = Gera apenas as TAGs da aplicação


  end;

procedure TtelaConfigSat.EnviarClick(Sender: TObject);
var
  tini, tfim: TDateTime;
begin
{ if Memo1.Text = '' then
    SpeedButton1.Click;}
                       
  tini := now;
  ACBrSAT1.EnviarDadosVenda( Memo1.Text );
  tfim := now;
  Memo1.Lines.Add('------------------------------------------------') ;
  Memo1.Lines.Add('Iniciado em: '+DateTimeToStr(tini)) ;
  Memo1.Lines.Add('Finalizado em: '+DateTimeToStr(tFim)) ;
  Memo1.Lines.Add('') ;                                                                                         {
  Memo1.Lines.Add('Tempo de Envio e Recebimento: '+ FormatFloat('##0.00',SecondSpan(tini,tfim))+' segundos' ) ;  }
  Memo1.Lines.Add('------------------------------------------------') ;
   {
  if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
  begin
    LoadXML( ACBrSAT1.CFe.AsXMLString, Memo1 );
    }
  end;

procedure TtelaConfigSat.SpeedButton2Click(Sender: TObject);
var
  Erro: String;
begin
 ACBrSAT1.Config.XmlSignLib := TSSLXmlSignLib(ComboBox1.ItemIndex);
  ACBrSAT1.Config.ArqSchema := editSchema.Text;

  if ACBrSAT1.ValidarDadosVenda( Memo1.Text, Erro ) then
    Memo1.Lines.Add('XML Gerado pela aplicação, validado com sucesso')
  else
  begin
    Memo1.Lines.Add('Erro na Validação do XML Gerado pela aplicação.');
    Memo1.Lines.Add(Erro);
  end;

end;


procedure TtelaConfigSat.FormShow(Sender: TObject);
var
P: TSSLXmlSignLib;
begin
  ComboBox1.Items.Clear ;
  For P := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
     ComboBox1.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), integer(P) ) ) ;
  end;

procedure TtelaConfigSat.SpeedButton3Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Arquivo XSD|*.xsd';
  OpenDialog1.InitialDir := ExtractFilePath(editSchema.Text);
  OpenDialog1.FileName := editSchema.Text;
  if OpenDialog1.Execute then
    editSchema.Text := OpenDialog1.FileName ;
end;

procedure TtelaConfigSat.FormCreate(Sender: TObject);
begin
AjustarCfe;
end;

end.
