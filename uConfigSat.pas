unit uConfigSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ACBrPosPrinter, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrSAT, ACBrBase,  TypInfo, ACBrSATClass,
  ACBrIntegrador, pcnConversao, Math, ACBrUtil, RLPrinters, Printers, ACBrSATMFe_integrador, pcnVFPe,
  ACBrDFeSSL, ExtCtrls, uConfig, uDados, uLancPedidos, IniFiles,
  ACBrSATExtratoReportClass, ACBrSATExtratoFortesFr, RLFilters, RLPDFFilter, uGerarNfe,
  ComCtrls, uConfigEmit, ACBrValidador;

type
  TtelaConfigSat = class(TForm)
    ACBrIntegrador1: TACBrIntegrador;
    ACBrSAT1: TACBrSAT;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    ACBrPosPrinter1: TACBrPosPrinter;
    Memo1: TMemo;
    SpeedButton6: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    cbxModelo: TComboBox;
    cbxPagCodigo: TComboBox;
    SpeedButton7: TSpeedButton;
    cbxModeloPosPrinter: TComboBox;
    ACBrSATExtratoFortes1: TACBrSATExtratoFortes;
    SpeedButton8: TSpeedButton;
    btnImp: TSpeedButton;
    lImpressora: TLabel;
    PrintDialog1: TPrintDialog;
    RLPDFFilter1: TRLPDFFilter;
    label44: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCol: TEdit;
    edtLin: TEdit;
    edtEsp: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSalvar: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    edtNomeDLL: TEdit;
    Label7: TLabel;
    edtCodAtiv: TEdit;
    lbl: TLabel;
    edtCaixa: TEdit;
    Caixa: TLabel;
    cbxAmbiente: TRadioGroup;
    TabSheet2: TTabSheet;
    edtSwHCNPJ: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    TabSheet3: TTabSheet;
    edtMFEInput: TEdit;
    edtMFEOutput: TEdit;
    edtMFETimeout: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ie: TEdit;
    cnpjemit: TEdit;
    edtSwHAss: TMemo;
    SpeedButton10: TSpeedButton;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Enviar: TSpeedButton;
    procedure At(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure AjustarCfe;
    procedure FormCreate(Sender: TObject);
    procedure gerarVenda;
    procedure LeDadosRedeSat;
    procedure ConfiguraRedeSat;
    procedure PrepararImpressao;
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EnviarClick(Sender: TObject);

  private
    { Private declarations }
    procedure GetsignAC(var Chave: AnsiString);
    procedure GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure GetNumeroSessao(var Chave: Integer);
    procedure lerParams;
    procedure cancelaCfe;
    procedure EnviaPagamento;
  public
    { Public declarations }
    num : integer;
  end;

var
  telaConfigSat: TtelaConfigSat;

implementation

uses pcnCFe, DB;

{$R *.dfm}

procedure TtelaConfigSat.GetsignAC(var Chave: AnsiString);
begin
  Chave := AnsiString(edtSwHAss.Text);
end;

procedure TtelaConfigSat.GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := AnsiString( edtCodAtiv.Text );
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
  AjustarCfe;
  Memo1.Text := ACBrSAT1.ConsultarSAT;
end;

procedure TtelaConfigSat.AjustarCfe;
begin
  telaDados.qryEmitente.Close;
  telaDados.qryEmitente.SQL.Clear;
  telaDados.qryEmitente.SQL.Add('Select * from Emitente where id_login = ');
  telaDados.qryEmitente.SQL.Add(telaDados.tblLoginID.AsString);
  telaDados.qryEmitente.Open;


  with ACBrSAT1 do
  begin
    NomeDLL := edtNomeDLL.Text;
    Modelo := TACBrSATModelo( cbxModelo.ItemIndex ) ;
    Config.ide_CNPJ := edtSwHCNPJ.Text{'11111111111111'};
    {
    Config.ide_CNPJ := '08490295000133';
    Config.ide_CNPJ := '11.111.111/1111-11'; }
    config.ide_numeroCaixa := StrToInt(edtCaixa.Text);
    Config.ide_tpAmb := TpcnTipoAmbiente(cbxAmbiente.ItemIndex); {taHomologacao}


  case telaDados.tblEmitenteREGIME.Value of
  0:begin
      Config.emit_cRegTrib := RTRegimeNormal;
    end;
  1:begin
      Config.emit_cRegTrib := RTSimplesNacional;
    end;
  end;

  case telaDados.tblEmitenteTIPOEMP.Value of
  1:begin
      Config.emit_cRegTribISSQN :=  RTISSMicroempresaMunicipal;
    end;
  2:begin
      Config.emit_cRegTribISSQN :=  RTISSMEI;
    end;
  3:begin
      Config.emit_cRegTribISSQN :=  RTISSMEEPP;
    end;
  end;

  Config.emit_indRatISSQN := irNao;    {
  Config.emit_CNPJ := '14200166000166'; }
  Config.emit_IE := telaDados.qryEmitente.FieldByName('INSCEST').AsString;
  Config.emit_IM := '';
  Config.emit_CNPJ := telaDados.qryEmitente.FieldByName('CNPJ').AsString;
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
  telaDados.qryPedidos.SQL.Add(IntToStr(num));
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
        Prod.CFOP := telaDados.qryProdutos.FieldByName('CFOP').AsString;
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

    Total.DescAcrEntr.vDescSubtot := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsCurrency;
    Total.vCFeLei12741 := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsCurrency;
    {Pagto1 := RoundABNT(TotalGeral/2,-2);
    with Pagto.Add do
    begin
      cMP := mpCartaodeCredito;
      vMP := Pagto1;
    end;}
    if StrToFloat(telaLancPedidos.edtCar.Text) > 0 then begin
      with Pagto.Add do
      begin
        cMP := mpCartaodeCredito;
        vMP := StrToFloat(telaLancPedidos.edtCar.Text);
        cAdmC := 999;
      end;
    end;
    if StrToFloat(telaLancPedidos.edtDin.Text) > 0 then begin
    with Pagto.Add do
      begin
        cMP := mpDinheiro;
        vMP := StrToFloat(telaLancPedidos.edtDin.Text);
      end;
    end;

    InfAdic.infCpl := 'Acesse www.projetoacbr.com.br para obter mais;informações sobre o componente ACBrSAT;'+
                      'Precisa de um PAF-ECF homologado?;Conheça o DJPDV - www.djpdv.com.br';

   { InfAdic.infCpl := '</linha_simples>;'+
                        '</ce><e><n>SENHA XXX</n></e>;'+
                        '</linha_simples>';}
  end;
  {ACBrIntegrador1.EnviarPagamento(); }
  if StrToFloat(telaLancPedidos.edtCar.Text) > 0 then begin
    EnviaPagamento;
  end;
  Memo1.Lines.Text := ACBrSAT1.CFe.GerarXML( True );    // True = Gera apenas as TAGs da aplicação
  {Memo1.Lines.Text := ACBrSAT1.EnviarDadosVenda;}
  ShowMessage(ACBrSAT1.CFe.infCFe.ID);
  
  end;
end;

procedure TtelaConfigSat.SpeedButton5Click(Sender: TObject);
begin
  Memo1.Text := ACBrSAT1.AssociarAssinatura( '11111111111111' + '11111111111111','MD2Nof/O0tQMPKiYeeAydSjYt7YV9kU0nWKZGXHVdYIzR2W9Z6tgXni/Y5bnjmUAk8MkqlBJIiOOIskKCjJ086k7vAP0EU5cBRYj/nzHUiRdu9AVD7WRfVs00BDyb5fsnnKg7gAXXH6SBgCxG9yjAkxJ0l2E2idsWBAJ5peQEBZqtHytRUC+FLaSfd3+'+'66QNxIBlDwQIRzUGPaU6fvErVDSfMUf8WpkwnPz36fCQnyLypqe/5mbox9pt3RCbbXcYqnR/4poYGr9M9Kymj4/PyX9xGeiXwbgzOOHNIU5M/aAs0rulXz948bZla0eXABgEcp6mDkTzweLPZTbmOhX+eA==');
end;

procedure TtelaConfigSat.FormCreate(Sender: TObject);
var I : TACBrSATModelo;
    O : TACBrPosPaginaCodigo;
    N : TACBrPosPrinterModelo;
    z : Integer;
begin
  {AjustarCfe; }
  cbxModelo.Items.Clear ;
  For I := Low(TACBrSATModelo) to High(TACBrSATModelo) do
    cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrSATModelo), integer(I) ) ) ;
  cbxModelo.ItemIndex := 3;

  cbxPagCodigo.Items.Clear ;
  For O := Low(TACBrPosPaginaCodigo) to High(TACBrPosPaginaCodigo) do
    cbxPagCodigo.Items.Add( GetEnumName(TypeInfo(TACBrPosPaginaCodigo), integer(O) ) ) ;
  cbxPagCodigo.ItemIndex := 2;

  cbxModeloPosPrinter.Items.Clear ;
  For N := Low(TACBrPosPrinterModelo) to High(TACBrPosPrinterModelo) do
     cbxModeloPosPrinter.Items.Add( GetEnumName(TypeInfo(TACBrPosPrinterModelo), integer(N) ) ) ;
  cbxModeloPosPrinter.ItemIndex := 1;

  {cbxPorta.Items.Clear;
  ACBrPosPrinter1.Device.AcharPortasSeriais( cbxPorta.Items );
    }
lerParams;

  {z := Printer.Printers.Count;
  while z>0 do begin
    cbxPorta.Items.Add(Printer.Printers.ValueFromIndex[z-1]);
    z := z-1;
  end;  }
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
  begin                          }

  ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
  ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
  ACBrPosPrinter1.Porta := btnImp.Caption;
  ACBrPosPrinter1.ColunasFonteNormal := StrToInt(edtCol.Text);
  ACBrPosPrinter1.LinhasEntreCupons := StrToInt(edtLin.Text);
  ACBrPosPrinter1.EspacoEntreLinhas := StrToInt(edtEsp.Text);
  ACBrSATExtratoESCPOS1.ImprimeQRCode := True;
  ACBrSATExtratoESCPOS1.MostrarPreview := true;
  ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha := false;
    {if cbImprimirChaveUmaLinha.Checked then
      ACBrSATExtratoESCPOS1.ImprimeChaveEmUmaLinha := rSim
    else
      ACBrSATExtratoESCPOS1.ImprimeChaveEmUmaLinha := rAuto;
  end
  else
  begin
    ACBrSATExtratoFortes1.LarguraBobina    := 210;
    ACBrSATExtratoFortes1.Margens.Topo     := 3 ;
    ACBrSATExtratoFortes1.Margens.Fundo    := 5 ;
    ACBrSATExtratoFortes1.Margens.Esquerda := 3 ;
    ACBrSATExtratoFortes1.Margens.Direita  := 3 ;
    ACBrSATExtratoFortes1.MostrarPreview   := true;


    ACBrSATExtratoFortes1.PrinterName := lImpressora.Caption;
     }
end;


procedure TtelaConfigSat.SpeedButton7Click(Sender: TObject);
var
  tini, tfim: TDateTime;
begin
  AjustarCfe;
  PrepararImpressao;
  ACBrSAT1.ImprimirExtrato;
   {
  tini := now;
  Memo1.Lines.Add(ACBrSATExtratoESCPOS1.GerarImpressaoFiscalMFe);
  tfim := now;
  Memo1.Lines.Add('Inciado em: '+DateTimeToStr(tini)) ;
  Memo1.Lines.Add('Finalizado em: '+DateTimeToStr(tFim)) ;}
end;

procedure TtelaConfigSat.SpeedButton8Click(Sender: TObject);
begin

  PrepararImpressao;
  ACBrSAT1.ImprimirExtrato;

end;

procedure TtelaConfigSat.btnImpClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
    lImpressora.Caption := Printer.Printers[Printer.PrinterIndex] ;
    btnImp.Caption := Printer.Printers[Printer.PrinterIndex];
end;

procedure TtelaConfigSat.btnSalvarClick(Sender: TObject);
Var
  ArqINI : String ;
  INI : TIniFile ;
begin
  ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;
  
  INI := TIniFile.Create(ArqINI);
  try
    INI.WriteInteger('SAT','Modelo',cbxModelo.ItemIndex);
    {INI.WriteString('SAT','ArqLog',edLog.Text);}
    INI.WriteString('SAT','NomeDLL',edtNomeDLL.Text);
    INI.WriteString('SAT','CodigoAtivacao',edtCodAtiv.Text);
    {INI.WriteString('SAT','CodigoUF',edtCodUF.Text);}
    INI.WriteInteger('SAT','NumeroCaixa',StrToInt(edtCaixa.Text));
    INI.WriteInteger('SAT','Ambiente',cbxAmbiente.ItemIndex);
    {INI.WriteInteger('SAT','PaginaDeCodigo',sePagCod.Value);
    INI.WriteFloat('SAT','versaoDadosEnt', StringToFloatDef( sfeVersaoEnt.Text, cversaoDadosEnt) );
    INI.WriteBool('SAT','FormatarXML', cbxFormatXML.Checked);
    INI.WriteBool('SAT','RetirarAcentos', cbxRemoverAcentos.Checked);
    INI.WriteBool('SAT','SalvarCFe', cbxSalvarCFe.Checked);
    INI.WriteBool('SAT','SalvarCFeCanc', cbxSalvarCFeCanc.Checked);
    INI.WriteBool('SAT','SalvarEnvio', cbxSalvarEnvio.Checked);
    INI.WriteBool('SAT','SepararPorCNPJ', cbxSepararPorCNPJ.Checked);
    INI.WriteBool('SAT','SepararPorModelo', cbxSepararPorModelo.Checked);
    INI.WriteBool('SAT','SepararPorDIA', cbxSepararPorDia.Checked);
    INI.WriteBool('SAT','SepararPorMES', cbxSepararPorMes.Checked);
    INI.WriteBool('SAT','SepararPorANO', cbxSepararPorAno.Checked);
    INI.WriteString('SAT','SchemaVendaAPL',edSchemaVendaAPL.Text);
    INI.WriteString('SAT','SchemaVendaSAT',edSchemaVendaSAT.Text);
    INI.WriteInteger('SAT','XMLLib',cbxXmlSignLib.ItemIndex); }

    INI.WriteInteger('PosPrinter','Modelo Impressora',cbxModeloPosPrinter.ItemIndex);
    INI.WriteString('PosPrinter','Porta',lImpressora.Caption);
    INI.WriteInteger('PosPrinter','PaginaDeCodigo',cbxPagCodigo.ItemIndex);
    INI.WriteString('PosPrinter','ParamsString',ACBrPosPrinter1.Device.ParamsString);
    INI.WriteInteger('PosPrinter','Colunas',StrToInt(edtCol.Text));
    INI.WriteInteger('PosPrinter','EspacoLinhas',StrToInt(edtLin.Text));
    INI.WriteInteger('PosPrinter','LinhasEntreCupons',StrToInt(edtEsp.Text));

    {INI.WriteString('Emit','CNPJ',edtEmitCNPJ.Text);
    INI.WriteString('Emit','IE',edtEmitIE.Text);
    INI.WriteString('Emit','IM',edtEmitIM.Text);
    INI.WriteInteger('Emit','RegTributario',cbxRegTributario.ItemIndex);
    INI.WriteInteger('Emit','RegTribISSQN',cbxRegTribISSQN.ItemIndex);
    INI.WriteInteger('Emit','IndRatISSQN',cbxIndRatISSQN.ItemIndex);}

    INI.WriteString('SwH','CNPJ',edtSwHCNPJ.Text);
    INI.WriteString('SwH','Assinatura',edtSwHAss.Text);

    {INI.WriteBool('Fortes','UsarFortes',cbUsarFortes.Checked) ;
    INI.WriteInteger('Fortes','Largura',seLargura.Value);
    INI.WriteInteger('Fortes','MargemTopo',seMargemTopo.Value);
    INI.WriteInteger('Fortes','MargemFundo',seMargemFundo.Value);
    INI.WriteInteger('Fortes','MargemEsquerda',seMargemEsquerda.Value);
    INI.WriteInteger('Fortes','MargemDireita',seMargemDireita.Value);
    INI.WriteBool('Fortes','Preview',cbPreview.Checked);}

    {INI.WriteString('Printer','Name',lImpressora.Caption);
    INI.WriteBool('EscPos','ImprimirItemUmaLinha',cbImprimir1Linha.Checked);
    INI.WriteBool('EscPos','ImprimirChaveUmaLinha',cbImprimirChaveUmaLinha.Checked);}

    {INI.WriteInteger('Rede','tipoInter',rgRedeTipoInter.ItemIndex);
    INI.WriteInteger('Rede','tipoLan',rgRedeTipoLan.ItemIndex);
    INI.WriteString('Rede','SSID',edRedeSSID.Text);
    INI.WriteInteger('Rede','seg',cbxRedeSeg.ItemIndex);
    INI.WriteString('Rede','codigo',edRedeCodigo.Text);
    INI.WriteString('Rede','lanIP',edRedeIP.Text);
    INI.WriteString('Rede','lanMask',edRedeMask.Text);
    INI.WriteString('Rede','lanGW',edRedeGW.Text);
    INI.WriteString('Rede','lanDNS1',edRedeDNS1.Text);
    INI.WriteString('Rede','lanDNS2',edRedeDNS2.Text);
    INI.WriteString('Rede','usuario',edRedeUsuario.Text);
    INI.WriteString('Rede','senha',edRedeSenha.Text);
    INI.WriteInteger('Rede','proxy',cbxRedeProxy.ItemIndex);
    INI.WriteString('Rede','proxy_ip',edRedeProxyIP.Text);
    INI.WriteInteger('Rede','proxy_porta',edRedeProxyPorta.Value);
    INI.WriteString('Rede','proxy_user',edRedeProxyUser.Text);
    INI.WriteString('Rede','proxy_senha',edRedeProxySenha.Text); }

    INI.WriteString('MFE','Input',edtMFEInput.Text);
    INI.WriteString('MFE','Output',edtMFEOutput.Text);
    INI.WriteInteger('MFE','Timeout',StrToInt(edtMFETimeout.Text));
  finally
     INI.Free ;
  end ;
end;

procedure TtelaConfigSat.lerParams;
Var
  ArqINI: String ;
  INI : TIniFile ;
begin
  ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;

  INI := TIniFile.Create(ArqINI);
  try
    cbxModelo.ItemIndex    := INI.ReadInteger('SAT','Modelo',0);
    {edLog.Text             := INI.ReadString('SAT','ArqLog','ACBrSAT.log');}
    edtNomeDLL.Text         := INI.ReadString('SAT','NomeDLL','C:\SAT\MFE.DLL');
    edtCodAtiv.Text := INI.ReadString('SAT','CodigoAtivacao','123456');
    {edtCodUF.Text          := INI.ReadString('SAT','CodigoUF','323');}
    edtCaixa.Text    := INI.ReadString('SAT','NumeroCaixa','1');
    cbxAmbiente.ItemIndex  := INI.ReadInteger('SAT','Ambiente',1);
    cbxPagCodigo.ItemIndex := INI.ReadInteger('SAT','PaginaDeCodigo',0);
    {sfeVersaoEnt.Text      := FloatToString( INI.ReadFloat('SAT','versaoDadosEnt', cversaoDadosEnt) );
    cbxFormatXML.Checked   := INI.ReadBool('SAT','FormatarXML', True);
    cbxRemoverAcentos.Checked:= INI.ReadBool('SAT','RetirarAcentos', True);
    cbxSalvarCFe.Checked     := INI.ReadBool('SAT','SalvarCFe', True);
    cbxSalvarCFeCanc.Checked := INI.ReadBool('SAT','SalvarCFeCanc', True);
    cbxSalvarEnvio.Checked   := INI.ReadBool('SAT','SalvarEnvio', True);
    cbxSepararPorCNPJ.Checked:= INI.ReadBool('SAT','SepararPorCNPJ', True);
    cbxSepararPorModelo.Checked := INI.ReadBool('SAT','SepararPorModelo', True);
    cbxSepararPorDia.Checked := INI.ReadBool('SAT','SepararPorDIA', True);
    cbxSepararPorMes.Checked := INI.ReadBool('SAT','SepararPorMES', True);
    cbxSepararPorAno.Checked := INI.ReadBool('SAT','SepararPorANO', True);
    edSchemaVendaAPL.Text := INI.ReadString('SAT','SchemaVendaAPL','');
    edSchemaVendaSAT.Text := INI.ReadString('SAT','SchemaVendaSAT','');
    cbxXmlSignLib.ItemIndex := INI.ReadInteger('SAT','XMLLib',Integer(ACBrSAT1.Config.XmlSignLib));
    sePagCodChange(Sender); }

    cbxModeloPosPrinter.ItemIndex := INI.ReadInteger('PosPrinter', 'Modelo', Integer(ACBrPosPrinter1.Modelo));
    btnImp.Caption := INI.ReadString('PosPrinter','Porta',lImpressora.Caption);
    cbxPagCodigo.ItemIndex := INI.ReadInteger('PosPrinter','PaginaDeCodigo',Integer(ACBrPosPrinter1.PaginaDeCodigo));
    ACBrPosPrinter1.Device.ParamsString := INI.ReadString('PosPrinter','ParamsString','');
    edtCol.Text := INI.ReadString('PosPrinter','Colunas',IntToStr(ACBrPosPrinter1.ColunasFonteNormal));
    edtLin.Text := INI.ReadString('PosPrinter','EspacoLinhas',IntToStr(ACBrPosPrinter1.EspacoEntreLinhas));
    edtEsp.Text := INI.ReadString('PosPrinter','LinhasEntreCupons',IntToStr(ACBrPosPrinter1.LinhasEntreCupons));

    {edtEmitCNPJ.Text := INI.ReadString('Emit','CNPJ','');
    edtEmitIE.Text   := INI.ReadString('Emit','IE','');
    edtEmitIM.Text   := INI.ReadString('Emit','IM','');
    cbxRegTributario.ItemIndex := INI.ReadInteger('Emit','RegTributario',0);
    cbxRegTribISSQN.ItemIndex  := INI.ReadInteger('Emit','RegTribISSQN',0);
    cbxIndRatISSQN.ItemIndex   := INI.ReadInteger('Emit','IndRatISSQN',0);}

    edtSwHCNPJ.Text       := INI.ReadString('SwH','CNPJ','11111111111111');
    edtSwHAss.Text := INI.ReadString('SwH','Assinatura','zerado');

    {cbUsarFortes.Checked   := INI.ReadBool('Fortes','UsarFortes', True) ;
    cbUsarEscPos.Checked   := not cbUsarFortes.Checked;
    seLargura.Value        := INI.ReadInteger('Fortes','Largura',ACBrSATExtratoFortes1.LarguraBobina);
    seMargemTopo.Value     := INI.ReadInteger('Fortes','MargemTopo',ACBrSATExtratoFortes1.Margens.Topo);
    seMargemFundo.Value    := INI.ReadInteger('Fortes','MargemFundo',ACBrSATExtratoFortes1.Margens.Fundo);
    seMargemEsquerda.Value := INI.ReadInteger('Fortes','MargemEsquerda',ACBrSATExtratoFortes1.Margens.Esquerda);
    seMargemDireita.Value  := INI.ReadInteger('Fortes','MargemDireita',ACBrSATExtratoFortes1.Margens.Direita);
    cbPreview.Checked      := INI.ReadBool('Fortes','Preview',True);
      }
    lImpressora.Caption    := INI.ReadString('Printer','Name', '');

    {cbImprimir1Linha.Checked := INI.ReadBool('EscPos','ImprimirItemUmaLinha',cbImprimir1Linha.Checked);
    cbImprimirChaveUmaLinha.Checked := INI.ReadBool('EscPos','ImprimirChaveUmaLinha',cbImprimirChaveUmaLinha.Checked);

    rgRedeTipoInter.ItemIndex := INI.ReadInteger('Rede','tipoInter',0);
    rgRedeTipoLan.ItemIndex   := INI.ReadInteger('Rede','tipoLan',0);
    edRedeSSID.Text           := INI.ReadString('Rede','SSID','');
    cbxRedeSeg.ItemIndex      := INI.ReadInteger('Rede','seg',0);
    edRedeCodigo.Text         := INI.ReadString('Rede','codigo','');
    edRedeIP.Text             := INI.ReadString('Rede','lanIP','');
    edRedeMask.Text           := INI.ReadString('Rede','lanMask','');
    edRedeGW.Text             := INI.ReadString('Rede','lanGW','');
    edRedeDNS1.Text           := INI.ReadString('Rede','lanDNS1','');
    edRedeDNS2.Text           := INI.ReadString('Rede','lanDNS2','');
    edRedeUsuario.Text        := INI.ReadString('Rede','usuario','');
    edRedeSenha.Text          := INI.ReadString('Rede','senha','');
    cbxRedeProxy.ItemIndex    := INI.ReadInteger('Rede','proxy',0);
    edRedeProxyIP.Text        := INI.ReadString('Rede','proxy_ip','');
    edRedeProxyPorta.Value    := INI.ReadInteger('Rede','proxy_porta',0);
    edRedeProxyUser.Text      := INI.ReadString('Rede','proxy_user','');
    edRedeProxySenha.Text     := INI.ReadString('Rede','proxy_senha','');
                }
    edtMFEInput.Text    :=  INI.ReadString('MFE','Input','c:\Integrador\Input\');
    edtMFEOutput.Text   :=  INI.ReadString('MFE','Output','c:\Integrador\Output\');
    edtMFETimeout.Text :=  INI.ReadString('MFE','Timeout','30');
  finally
     INI.Free ;
  end;
end;

procedure TtelaConfigSat.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtNomeDLL.Text := OpenDialog1.FileName;
end;

procedure TtelaConfigSat.SpeedButton2Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtMFEInput.Text := OpenDialog1.FileName;
end;

procedure TtelaConfigSat.SpeedButton3Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtMFEOutput.Text := OpenDialog1.FileName;
end;

procedure TtelaConfigSat.FormShow(Sender: TObject);
begin
cancelaCfe;
  {edtSwHCNPJ.Clear;
  edtSwHCNPJ.DisplayFormat        := '00.000.000/0000-00;0';}
end;

procedure TtelaConfigSat.cancelaCfe;
begin
{
 OpenDialog1.Filter := 'Arquivo XML|*.xml';
  if OpenDialog1.Execute then
    begin

    ACBrSAT1.CFe.LoadFromFile( OpenDialog1.FileName );
    ACBrSAT1.CFe2CFeCanc;

    mCancelamentoEnviar.Lines.Text := ACBrSAT1.CFeCanc.GerarXML( True ) ;  // True = Gera apenas as TAGs da aplicação
    edChaveCancelamento.Text := ACBrSAT1.CFeCanc.infCFe.chCanc;
    PageControl1.ActivePage := tsCancelamento;


    end; }
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

procedure TtelaCOnfigSat.EnviaPagamento;
var
  PagamentoMFe : TEnviarPagamento;
  RespostaPagamentoMFe : TRespostaPagamento;
begin
  telaDados.tblEmitente.Open;
  telaDados.tblEmitente.Last;
  telaDados.tblPedidos.ApplyUpdates;
  telaDados.tblPedidos.Close;
  PagamentoMFe := TEnviarPagamento.Create;
  try
    with PagamentoMFe do
    begin
      Clear;
      ChaveAcessoValidador := '25CFE38D-3B92-46C0-91CA-CFF751A82D3D';
      ChaveRequisicao := '26359854-5698-1365-9856-965478231456';
      Estabelecimento := '10';
      SerialPOS := InputBox('SerialPOS','Informe o Serial do POS','ACBr-'+RandomName(8));
      CNPJ := telaDados.tblEmitenteCNPJ.Text;
      IcmsBase := 0.18;
      ValorTotalVenda := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsCurrency;;
      HabilitarMultiplosPagamentos := True;
      HabilitarControleAntiFraude := False;
      CodigoMoeda := 'BRL';
      EmitirCupomNFCE := False;
      OrigemPagamento := 'Caixa 1';
    end;
    ACBrIntegrador1.EnviarPagamento(PagamentoMFe);
    RespostaPagamentoMFe := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).EnviarPagamento(PagamentoMFe);
    {Memo1.Lines.Text := RespostaPagamentoMFe.StatusPagamento + ' ' + RespostaPagamentoMFe.IntegradorResposta.Codigo;}
    telaDados.tblPedidos.Open;
    telaDados.tblPedidos.Last;
    telaDados.tblPedidos.Edit;
    telaDados.tblPedidos.FieldByName('IDPagamento').Value := RespostaPagamentoMFe.IDPagamento;
    telaDados.tblPedidos.Post;
    telaDados.tblPedidos.Close;
  finally
    PagamentoMFe.Free;
    telaDados.tblEmitente.Close;
  end;
end;

end.
