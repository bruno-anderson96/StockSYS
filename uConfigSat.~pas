unit uConfigSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ACBrPosPrinter, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrSAT, ACBrBase,  TypInfo, ACBrSATClass,
  ACBrIntegrador, pcnConversao, Math, ACBrUtil, RLPrinters, Printers, ACBrSATMFe_integrador, pcnVFPe,
  ACBrDFeSSL, ExtCtrls, uConfig, uDados, uLancPedidos,
  ACBrSATExtratoReportClass, ACBrSATExtratoFortesFr, RLFilters, RLPDFFilter;

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
    Panel1: TPanel;
    cbxModelo: TComboBox;
    cbxPagCodigo: TComboBox;
    SpeedButton7: TSpeedButton;
    cbxPorta: TComboBox;
    cbxModeloPosPrinter: TComboBox;
    ACBrSATExtratoFortes1: TACBrSATExtratoFortes;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    lImpressora: TLabel;
    PrintDialog1: TPrintDialog;
    RLPDFFilter1: TRLPDFFilter;
    procedure At(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure EnviarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AjustarCfe;
    procedure FormCreate(Sender: TObject);
    procedure gerarVenda;
    procedure LeDadosRedeSat;
    procedure ConfiguraRedeSat;
    procedure PrepararImpressao;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);

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

uses pcnCFe, DB;

{$R *.dfm}

procedure TtelaConfigSat.GetsignAC(var Chave: AnsiString);
begin
  Chave := AnsiString('AvKLv0zW5pywUQi/myFzzoJhSLsbx3g0Ro5VwZvngLuzVDVJbLng/pZb4Upstr872qb59DlkAKg54Riv+AoCYSQj7mIiJ8rVPbeiAKrnoekm4XVKZKiAZN/4Fve2n4S/b/N8M0kItwhIWsAUURP0ESJ3LKSTk5RgrUPb8UXRWG7QGZHunmndLJ42vxKf7Wz/74bRZfA36g1AL3'+'/ojB+QwrPx0wqSbTLJCmizmI4o7X9vmP9m+VS0qk3GUBdLII/j2dt6ni9nDYYxofDbpclsK6Y6ZO2E3YgNPSP4DHUwNo3hs0ij3+ROWlYZF2FqAOdFo5pUxL7fmn+/oHV0dHUoCw==' );

end;

procedure TtelaConfigSat.GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := AnsiString( '123123123' );
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
Memo1.Text := ACBrSAT1.ConsultarSAT + ACBrSAT1.ConsultarStatusOperacional;
end;

procedure TtelaConfigSat.AjustarCfe;
begin
 with ACBrSAT1 do
 begin


  Modelo := mfe_Integrador_XML;
  Config.ide_CNPJ := '02709607000170'{'11111111111111'};
  {
  Config.ide_CNPJ := '08490295000133';
  Config.ide_CNPJ := '11.111.111/1111-11'; }
  config.ide_numeroCaixa := 1;
  Config.ide_tpAmb := taHomologacao;
  Config.emit_IE := '064075559'{telaConfig.edtInscEst.Text};
  Config.emit_IM := '';
  Config.emit_cRegTrib := RTSimplesNacional;
  Config.emit_cRegTribISSQN := RTISSMicroempresaMunicipal;
  Config.emit_indRatISSQN := irNao;    {
  Config.emit_CNPJ := '14200166000166'; }
  Config.emit_CNPJ := '12373349000158'{telaConfig.edtCnpj.Text};


  {ACBrSAT1.OnGetNumeroSessao := GetNumeroSessao;}

  end;

  ACBrSAT1.Inicializar;

ACBrSAT1.OnGetcodigoDeAtivacao := GetcodigoDeAtivacao;
ACBrSAT1.OnGetsignAC := GetsignAC;

{'12373349000158'}
end;

procedure TtelaConfigSat.gerarVenda;
var
  TotalItem, TotalGeral, Pagto1: Double;
  A, aNumItem: Integer;
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

  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from Pedido where ID = ');
  telaDados.qryPedidos.SQL.Add(telaLancPedidos.editId.Text);
  telaDados.qryPedidos.Open;

  telaDados.qryClientes.Close;
  telaDados.qryClientes.SQL.Clear;
  telaDados.qryClientes.SQL.Add('Select * from CLIENTE where id =');
  telaDados.qryClientes.SQL.Add(telaDados.qryPedidos.FieldByName('ID_CLIENTE').Value);
  telaDados.qryClientes.Open;

  telaDados.qryPedidosItens.Close;
  telaDados.qryPedidosItens.SQL.Clear;
  telaDados.qryPedidosItens.SQL.Add('Select * from PEDIDO_ITENS where ID_PEDIDO = ');
  telaDados.qryPedidosItens.SQL.Add(telaDados.qryPedidos.FieldByName('ID').Value);
  telaDados.qryPedidosItens.Open;

  // Montando uma Venda //
  with ACBrSAT1.CFe do
  begin

    ide.numeroCaixa := 1;
    ide.cNF := Random(999999);

    Dest.CNPJCPF := telaDados.qryClientes.FieldByName('CNPJ_CPF').AsString;
    Dest.xNome := telaDados.qryClientes.FieldByName('NOME').AsString;

    Entrega.xLgr := telaDados.qryClientes.FieldByName('ENDERECO').AsString;
    Entrega.nro := telaDados.qryClientes.FieldByName('NUM_END').AsString;
    Entrega.xCpl := telaDados.qryClientes.FieldByName('COMPLEMENTO').AsString;
    Entrega.xBairro := telaDados.qryClientes.FieldByName('BAIRRO_END').AsString;
    Entrega.xMun := telaDados.qryClientes.FieldByName('CIDADE_END').AsString;
    Entrega.UF := telaDados.qryClientes.FieldByName('UF_END').AsString;


    telaDados.tblPedidosItens.Open;
    telaDados.qryPedidosItens.First;
    {Loops := telaDados.qryPedidosItens.RecordCount;  // Ajuste aqui para vender mais itens
    For A := 1 to Loops do}
     while not telaDados.qryPedidosItens.Eof do
      begin
        
        telaDados.qryProdutos.Close;
        telaDados.qryProdutos.SQL.Clear;
        telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS where ID =');
        telaDados.qryProdutos.SQL.Add(telaDados.qryPedidosItens.FieldByName('ID_PRODUTO').Value);
        telaDados.qryProdutos.Open;
      with Det.Add do
        begin
        nItem := telaDados.qryPedidosItens.RecordCount;
        {nItem := 1 + (A * 3);}
        Prod.cProd := telaDados.qryProdutos.FieldByName('EAN13').AsString;
        {Prod.cEAN := telaDados.qryProdutos.FieldByName('EAN13').AsString; }
        Prod.xProd := telaDados.qryProdutos.FieldByName('DESCRICAO').AsString;
        prod.NCM := telaDados.qryProdutos.FieldByName('CODIGO_NCM').AsString;
        Prod.CFOP := '5102';
        Prod.uCom := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
        Prod.qCom := telaDados.qryPedidosItens.FieldByName('QUANTIDADE').AsInteger;
        Prod.vUnCom := telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat;
        Prod.indRegra := irTruncamento;
        Prod.vDesc := telaDados.qryPedidos.FieldByName('DESCONTO').AsFloat;

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

        Imposto.ICMS.pICMS := telaDados.qryProdutos.FieldByName('VAL_ICMS').AsInteger;

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
    telaDados.qryPedidosItens.Next;
     {
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
      }

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
  Memo1.Lines.Text := ACBrSAT1.EnviarDadosVenda; 
  
  
  end;
end;

procedure TtelaConfigSat.SpeedButton5Click(Sender: TObject);
begin
  
  Memo1.Text := ACBrSAT1.AssociarAssinatura( '11111111111111' + '11111111111111','MD2Nof/O0tQMPKiYeeAydSjYt7YV9kU0nWKZGXHVdYIzR2W9Z6tgXni/Y5bnjmUAk8MkqlBJIiOOIskKCjJ086k7vAP0EU5cBRYj/nzHUiRdu9AVD7WRfVs00BDyb5fsnnKg7gAXXH6SBgCxG9yjAkxJ0l2E2idsWBAJ5peQEBZqtHytRUC+FLaSfd3+'+'66QNxIBlDwQIRzUGPaU6fvErVDSfMUf8WpkwnPz36fCQnyLypqe/5mbox9pt3RCbbXcYqnR/4poYGr9M9Kymj4/PyX9xGeiXwbgzOOHNIU5M/aAs0rulXz948bZla0eXABgEcp6mDkTzweLPZTbmOhX+eA==');
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
var I : TACBrSATModelo;
    O : TACBrPosPaginaCodigo;
    N : TACBrPosPrinterModelo;
begin
AjustarCfe;
  cbxModelo.Items.Clear ;
  For I := Low(TACBrSATModelo) to High(TACBrSATModelo) do
     cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrSATModelo), integer(I) ) ) ;

  cbxPagCodigo.Items.Clear ;
  For O := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
     cbxPagCodigo.Items.Add( GetEnumName(TypeInfo(TACBrPosPaginaCodigo), integer(O) ) ) ;

  cbxModeloPosPrinter.Items.Clear ;
  For N := Low(TACBrPosPrinterModelo) to High(TACBrPosPrinterModelo) do
     cbxModeloPosPrinter.Items.Add( GetEnumName(TypeInfo(TACBrPosPrinterModelo), integer(N) ) ) ;

  cbxPorta.Items.Clear;
  ACBrPosPrinter1.Device.AcharPortasSeriais( cbxPorta.Items );
  cbxPorta.Items.Add('LPT1') ;
  cbxPorta.Items.Add('LPT2') ;
  cbxPorta.Items.Add('/dev/ttyS0') ;
  cbxPorta.Items.Add('/dev/ttyS1') ;
  cbxPorta.Items.Add('/dev/ttyUSB0') ;
  cbxPorta.Items.Add('/dev/ttyUSB1') ;
  cbxPorta.Items.Add('\\localhost\Epson') ;
  cbxPorta.Items.Add('c:\temp\ecf.txt') ;
  cbxPorta.Items.Add('/tmp/ecf.txt') ;

end;


procedure TtelaConfigSat.ConfiguraRedeSAT;
begin{
  with ACBrSAT1.Rede do
  begin
    tipoInter   := TTipoInterface( rgRedeTipoInter.ItemIndex );
    SSID        := edRedeSSID.Text ;
    seg         := TSegSemFio( cbxRedeSeg.ItemIndex ) ;
    codigo      := edRedeCodigo.Text ;
    tipoLan     := TTipoLan( rgRedeTipoLan.ItemIndex ) ;
    lanIP       := edRedeIP.Text ;
    lanMask     := edRedeMask.Text ;
    lanGW       := edRedeGW.Text ;
    lanDNS1     := edRedeDNS1.Text ;
    lanDNS2     := edRedeDNS2.Text ;
    usuario     := edRedeUsuario.Text ;
    senha       := edRedeSenha.Text ;
    proxy       := cbxRedeProxy.ItemIndex ;
    proxy_ip    := edRedeProxyIP.Text ;
    proxy_porta := edRedeProxyPorta.Value ;
    proxy_user  := edRedeProxyUser.Text ;
    proxy_senha := edRedeProxySenha.Text ;
  end;}
end;

procedure TtelaConfigSat.LeDadosRedeSAT;
begin {
  with ACBrSAT1.Rede do
  begin
    rgRedeTipoInter.ItemIndex := Integer(tipoInter);
    edRedeSSID.Text           := SSID ;
    cbxRedeSeg.ItemIndex      := Integer(seg) ;
    edRedeCodigo.Text         := codigo ;
    rgRedeTipoLan.ItemIndex   := Integer(tipoLan);
    edRedeIP.Text             := lanIP;
    edRedeMask.Text           := lanMask;
    edRedeGW.Text             := lanGW;
    edRedeDNS1.Text           := lanDNS1;
    edRedeDNS2.Text           := lanDNS2;
    edRedeUsuario.Text        := usuario;
    edRedeSenha.Text          := senha;
    cbxRedeProxy.ItemIndex    := proxy;
    edRedeProxyIP.Text        := proxy_ip;
    edRedeProxyPorta.Value    := proxy_porta;
    edRedeProxyUser.Text      := proxy_user;
    edRedeProxySenha.Text     := proxy_senha;
  end;}
end;

procedure TtelaConfigSat.PrepararImpressao;
begin
  {if ACBrSAT1.Extrato = ACBrSATExtratoESCPOS1 then
  begin
    ACBrPosPrinter1.Desativar;
    ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
    ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
    ACBrPosPrinter1.Porta := cbxPorta.Text;
    ACBrPosPrinter1.ColunasFonteNormal := 58;
    ACBrPosPrinter1.LinhasEntreCupons := 58;
    ACBrPosPrinter1.EspacoEntreLinhas := 2;
    ACBrSATExtratoESCPOS1.ImprimeQRCode := True;
    ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha := false;
    {if cbImprimirChaveUmaLinha.Checked then
      ACBrSATExtratoESCPOS1.ImprimeChaveEmUmaLinha := rSim
    else
      ACBrSATExtratoESCPOS1.ImprimeChaveEmUmaLinha := rAuto;
  end
  else
  begin}
    ACBrSATExtratoFortes1.LarguraBobina    := 150;
    ACBrSATExtratoFortes1.Margens.Topo     := 3 ;
    ACBrSATExtratoFortes1.Margens.Fundo    := 5 ;
    ACBrSATExtratoFortes1.Margens.Esquerda := 3 ;
    ACBrSATExtratoFortes1.Margens.Direita  := 3 ;
    ACBrSATExtratoFortes1.MostrarPreview   := true;


    ACBrSATExtratoFortes1.PrinterName := lImpressora.Caption;

  
end;


procedure TtelaConfigSat.SpeedButton7Click(Sender: TObject);
var
  tini, tfim: TDateTime;
begin
  PrepararImpressao;
  
  tini := now;
  Memo1.Lines.Add(ACBrSATExtratoESCPOS1.GerarImpressaoFiscalMFe);
  tfim := now;
  Memo1.Lines.Add('Inciado em: '+DateTimeToStr(tini)) ;
  Memo1.Lines.Add('Finalizado em: '+DateTimeToStr(tFim)) ;
end;

procedure TtelaConfigSat.SpeedButton8Click(Sender: TObject);
begin
 PrepararImpressao;
 ACBrSAT1.ImprimirExtrato;

end;

procedure TtelaConfigSat.SpeedButton9Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    lImpressora.Caption := Printer.Printers[Printer.PrinterIndex] ;
end;

end.
