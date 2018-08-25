unit uConfigSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ACBrPosPrinter, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrSAT, ACBrBase,  TypInfo, ACBrSATClass,
  ACBrIntegrador, pcnConversao, Math, ACBrUtil, RLPrinters, Printers, ACBrSATMFe_integrador, pcnVFPe,
  ACBrDFeSSL, ExtCtrls, uConfig, uDados, uLancPedidos, IniFiles,
  ACBrSATExtratoReportClass, ACBrSATExtratoFortesFr, RLFilters, RLPDFFilter, uGerarNfe,
  ComCtrls, uConfigEmit, ACBrValidador,
  ACBrSocket, ACBrIBPTax, DB;

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
    edtChReq: TEdit;
    SpeedButton4: TSpeedButton;
    Label13: TLabel;
    ACBrIBPTax1: TACBrIBPTax;
    edtChAv: TEdit;
    btnEdChAv: TSpeedButton;
    Label14: TLabel;
    procedure At(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
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
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnEdChAvClick(Sender: TObject);
    procedure edtChAvExit(Sender: TObject);

  private
    { Private declarations }
    procedure GetsignAC(var Chave: AnsiString);
    procedure GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure lerParams;
    procedure cancelaCfe;
    procedure cancelaVenda;
    function GuidCreate: string;
    procedure cadastraPagamento;
  public
    { Public declarations }
    num : integer;
    Spos : Boolean;
    procedure GetNumeroSessao(var Chave: Integer);
    procedure EnviaPagamento;
    procedure VerificaStatusValidador;
    procedure RespostaFiscal;
  end;

var
  telaConfigSat: TtelaConfigSat;

implementation

uses pcnCFe;

{$R *.dfm}

procedure TtelaConfigSat.cancelaVenda;
var idD: integer;
begin
  telaDados.tblPedidos.Close;
  telaDados.tblPedidos.Open;
  telaDados.tblPedidos.Last;
  idD := telaDados.tblPedidosID.AsInteger;
  telaDados.tblPedidos.Delete;
  telaDados.tblPedidosItens.Last;
  telaDados.qryPedidosItens.Close;
  telaDados.qryPedidosItens.SQL.Clear;
  telaDados.qryPedidosItens.SQL.Add('Delete from PEDIDO_ITENS where ID_PEDIDO =');
  telaDados.qryPedidosItens.SQL.Add(IntToStr(idD));
  telaDados.qryPedidosItens.Open;
  telaLancPedidos.PanelCalc.Visible := false;
end;

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
  Chave := ACBrSAT1.numeroSessao;
end;

procedure TtelaConfigSat.At(Sender: TObject);
begin
  memo1.Text := acbrSat1.AtivarSAT(1,'11.111.111/1111-11',23);
end;

function TtelaConfigSat.GuidCreate: string;
var
  ID: TGUID;
  IDn : String;

begin

  Result := '';
  if CreateGuid(ID) = S_OK then
    IDn := GUIDToString(ID);

  while Pos('{', IDn) > 0 do
    IDn[Pos('{', IDn)] := ' ';
  while Pos('}', IDn) > 0 do
    IDn[Pos('}', IDn)] := ' ';

  Result := Trim(IDn);
end;

procedure TtelaConfigSat.SpeedButton6Click(Sender: TObject);
begin
  AjustarCfe;
  //Memo1.Text := ACBrSAT1.ConsultarSAT;
  Memo1.Text := IntToStr(ACBrSAT1.numeroSessao);
  //ACBrSAT1.ConsultarNumeroSessao( ACBrSAT1.numeroSessao );
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

  ACBrSAT1.OnGetcodigoDeAtivacao := GetcodigoDeAtivacao;
  ACBrSAT1.OnGetsignAC := GetsignAC;
  ACBrSAT1.OnGetNumeroSessao := telaConfigSat.GetNumeroSessao;

  {if ACBrSAT1.numeroSessao = 0 then begin
    ACBrSAT1.GerarnumeroSessao;
  end;}
     {ShowMessage(IntToStr(ACBrSAT1.numeroSessao));
     if ACBrSAT1.numeroSessao < 1 then begin
      ACBrSAT1.GerarnumeroSessao;
     end;  }
 { ACBrSAT1.OnGetNumeroSessao := GetNumeroSessao;
   ShowMessage(IntToStr(ACBrSAT1.numeroSessao)); }
  {'12373349000158'}
end;

procedure TtelaConfigSat.gerarVenda;
var
TotalItem, TotalGeral, Pagto1: Double;
A, aNumItem: Integer;
Loops: Integer;
tEstadual, tFederal, tMunicipal: Double;
ex, descricao: String;
tabela: Integer;
aliqFedNac, aliqFedImp, aliqEst, aliqMun: Double;
idD : integer;
begin
  tEstadual := 0;
  tFederal  := 0;
  tMunicipal:= 0;
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
  ACBrSAT1.Inicializar;
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

        ACBrIBPTax1.AbrirTabela('C:\Users\Bruno\Documents\IBPT\18.1.A\TabelaIBPTaxCE18.1.A.csv');     //LEMBRAR DE ALTERAR
        ACBrIBPTax1.Procurar(telaDados.qryProdutos.FieldByName('CODIGO_NCM').AsString, ex, descricao, tabela, aliqFedNac, aliqFedImp, aliqEst, aliqMun);
        tEstadual :=  (telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat * telaDados.qryPedidosItens.FieldByName('QUANTIDADE').AsInteger * (aliqEst/100)) +tEstadual;
        tMunicipal :=  (telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat * telaDados.qryPedidosItens.FieldByName('QUANTIDADE').AsInteger * (aliqMun/100)) +tMunicipal;
        tFederal :=  (telaDados.qryProdutos.FieldByName('PRECO_VENDA').AsFloat * telaDados.qryPedidosItens.FieldByName('QUANTIDADE').AsInteger * (aliqFedNac/100)) +tFederal;

      with Det.Add do
        begin
        nItem := telaDados.qryPedidosItens.RecordCount;
        {nItem := 1 + (A * 3);}
        Prod.cProd := telaDados.qryProdutos.FieldByName('DESCRICAO').AsString;
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
          xCampoDet := 'Campo';
          xTextoDet := 'Texto';
        end;

        TotalItem := RoundABNT((Prod.qCom * Prod.vUnCom) + Prod.vOutro - Prod.vDesc, -2);
        TotalGeral := TotalGeral + TotalItem;
        Imposto.vItem12741 := tEstadual + tFederal + tMunicipal;

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
    end;

    Total.DescAcrEntr.vDescSubtot := telaDados.qryPedidos.FieldByName('DESCONTO').AsCurrency;
    Total.vCFeLei12741 := tEstadual + tFederal + tMunicipal; //clocar aqui valor do imposto}
    {Pagto1 := RoundABNT(TotalGeral/2,-2);
    with Pagto.Add do
    begin
      cMP := mpCartaodeCredito;
      vMP := Pagto1;
    end;}

    if (telaLancPedidos.cbPagamento.ItemIndex = 1) or (telaLancPedidos.cbPagamento.ItemIndex = 2) then begin
      try
        //telaDados.qryPedidos.Last;
        EnviaPagamento;
        if Spos then begin
          VerificaStatusValidador;
        end;
      except
        ShowMessage('Erro na venda');
        cancelaVenda;
        Abort;
      end;
    end;

    if telaLancPedidos.cbPagamento.ItemIndex = 0 then begin
      with Pagto.Add do
      begin
        cMP := mpDinheiro;
        vMP := StrToFloat(telaLancPedidos.edtDin.Text);
      end;
    end;
    if telaLancPedidos.cbPagamento.ItemIndex = 1 then begin
    with Pagto.Add do
      begin
        cMP := mpCartaodeCredito;
        vMP := StrToFloat(telaLancPedidos.edtDin.Text);
        cAdmC := 999;
      end;
    end;
    if telaLancPedidos.cbPagamento.ItemIndex = 2 then begin
    with Pagto.Add do
      begin
        cMP := mpCartaodeDebito;
        vMP := StrToFloat(telaLancPedidos.edtDin.Text);
        cAdmC := 999;
      end;
    end;
    if telaLancPedidos.cbPagamento.ItemIndex = 3 then begin
    with Pagto.Add do
      begin
        cMP := mpCheque;
        vMP := StrToFloat(telaLancPedidos.edtDin.Text);
      end;
    end;

    InfAdic.infCpl := 'Tributos Federais '+ FloatToStr(tFederal) + #13+
                      'Tributos Estaduais '+ FloatToStr(tEstadual)+ #13+
                      'Tributos Municipais '+ FloatToStr(tMunicipal);

  end;

 { if (telaLancPedidos.cbPagamento.ItemIndex = 1) or (telaLancPedidos.cbPagamento.ItemIndex = 2) then begin
    EnviaPagamento;
    VerificaStatusValidador;
  end; }

  Memo1.Lines.Text := ACBrSAT1.CFe.GerarXML( True );    // True = Gera apenas as TAGs da aplicação
  try
  Memo1.Lines.Text := ACBrSAT1.EnviarDadosVenda;
  except
    ShowMessage('integrador offline!');
    {telaDados.tblPedidos.Close;
    telaDados.tblPedidos.Open;
    telaDados.tblPedidos.Last;
    telaDados.tblPedidos.Edit;
    telaDados.tblPedidosPATH.Value := ACBrSAT1.NomeBancoCfe;
    telaDados.tblPedidosCHAVECFE.Value := 'CFe' + ACBrSAT1.CFe.infCFe.ID;
    telaDados.tblPedidosSTATUS.Value := 'T';
    telaDados.tblPedidos.Post; } //Caso queira transmitir depois a cfe
    cancelaVenda;
    Abort;
  end;


  if (telaLancPedidos.cbPagamento.ItemIndex = 1) or (telaLancPedidos.cbPagamento.ItemIndex =2) then begin
    if Spos then begin
       RespostaFiscal;
    end;
  end;
  telaDados.tblPedidos.Close;
  telaDados.tblPedidos.Open;
  telaDados.tblPedidos.Last;
  telaDados.tblPedidos.Edit;
  {telaDados.tblPedidosPATH.Value := ExtractFilePath(Application.ExeName) + 'Enviado\CFe\20' + FormatDateTime('yy',Date)+ '\' + FormatDateTime('mm', Date) +'\'+ FormatDateTime('dd', Date)+ '\' + ACBrSAT1.CFe.infCFe.ID +'.xml';
  }
  telaDados.tblPedidosPATH.Value := ACBrSAT1.NomeBancoCfe;
  telaDados.tblPedidosCHAVECFE.Value := 'CFe' + ACBrSAT1.CFe.infCFe.ID;
  if telaDados.tblPedidosSTATUS.Value = '' then begin
    telaDados.tblPedidosSTATUS.Value := 'V';
  end;
  telaDados.tblPedidos.Post;
  Spos := False;

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
{begin
  if ACBrSAT1.Extrato = ACBrSATExtratoESCPOS1 then
  begin                          }

  {ACBrPosPrinter1.Modelo := TACBrPosPrinterModelo( cbxModeloPosPrinter.ItemIndex );
  ACBrPosPrinter1.PaginaDeCodigo := TACBrPosPaginaCodigo( cbxPagCodigo.ItemIndex );
  ACBrPosPrinter1.Porta := btnImp.Caption;
  ACBrPosPrinter1.ColunasFonteNormal := StrToInt(edtCol.Text);
  ACBrPosPrinter1.LinhasEntreCupons := StrToInt(edtLin.Text);
  ACBrPosPrinter1.EspacoEntreLinhas := StrToInt(edtEsp.Text);
  ACBrSATExtratoESCPOS1.ImprimeQRCode := True;
  ACBrSATExtratoESCPOS1.MostrarPreview := true;
  ACBrSATExtratoESCPOS1.ImprimeEmUmaLinha := false; }  //aqui pra impressora
    {if cbImprimirChaveUmaLinha.Checked then
      ACBrSATExtratoESCPOS1.ImprimeChaveEmUmaLinha := rSim
    else
      ACBrSATExtratoESCPOS1.ImprimeChaveEmUmaLinha := rAuto;
  end
  else }
  begin
    ACBrSATExtratoFortes1.LarguraBobina    := 200;
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
    INI.WriteString('SAT', 'ChaveReq', edtChReq.Text);
    INI.WriteString('SAT', 'ChaveAv', edtChAv.Text);
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
    {edLog.Text            := INI.ReadString('SAT','ArqLog','ACBrSAT.log');}
    edtNomeDLL.Text        := INI.ReadString('SAT','NomeDLL','C:\SAT\MFE.DLL');
    edtCodAtiv.Text        := INI.ReadString('SAT','CodigoAtivacao','123456');
    edtChReq.Text          := INI.ReadString('SAT','ChaveReq','');
    edtChAv.Text          := INI.ReadString('SAT','ChaveAv','');
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

procedure TtelaConfigSat.EnviaPagamento;
var
  PagamentoMFe : TEnviarPagamento;
  RespostaPagamentoMFe : TRespostaPagamento;
  nv : Double;
  idR : integer;
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
      ValorTotalVenda := telaLancPedidos.Ddin {telaDados.qryPedidos.FieldByName('VALOR_TOTAL').Value};
      ChaveAcessoValidador := edtChAv.Text;
      ChaveRequisicao := edtChReq.Text;
      Estabelecimento := '1';
      SerialPOS := InputBox('SerialPOS','Informe o Serial do POS','ACBr-'+RandomName(8)); //Serial da maquineta
      CNPJ := telaDados.tblEmitenteCNPJ.Text;
      IcmsBase := 0.18;

      HabilitarMultiplosPagamentos := True; //FALSE?
      HabilitarControleAntiFraude := False;
      CodigoMoeda := 'BRL';
      EmitirCupomNFCE := False;
      OrigemPagamento := edtCaixa.Text;
    end;
    {ACBrIntegrador1.EnviarPagamento(PagamentoMFe);}
    RespostaPagamentoMFe := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).EnviarPagamento(PagamentoMFe);
    {Memo1.Lines.Text := RespostaPagamentoMFe.StatusPagamento + ' ' + RespostaPagamentoMFe.IntegradorResposta.Codigo;}

      telaDados.tblPedidos.Open;
      telaDados.tblPedidos.Last;
      telaDados.tblPedidos.Edit;
      telaDados.tblPedidos.FieldByName('IDPagamento').Value := RespostaPagamentoMFe.IDPagamento;
      telaDados.tblPedidos.Post;
      telaDados.tblPedidos.ApplyUpdates;
      telaDados.tblPedidos.Close;

      telaGerarNfe.idPg := RespostaPagamentoMFe.IDPagamento;


    ShowMessage('ID PAGAMENTO: ' +IntToStr(RespostaPagamentoMfe.IDPagamento));

    Spos := true;
    except
      idR := RANDOM(99999999);
      telaDados.tblPedidos.Open;
      telaDados.tblPedidos.Locate('IDPagamento', idR,[loCaseInsensitive]);

     while telaDados.tblPedidos.RecordCount > 0 do begin
      idR := RANDOM(99999999);
      telaDados.tblPedidos.Locate('IDPagamento', idR,[loCaseInsensitive]);
     end;

    telaDados.tblPedidos.Last;
    telaDados.tblPedidos.Edit;
    telaDados.tblPedidos.FieldByName('IDPagamento').Value := idR;
    telaDados.tblPedidosSTATUS.Value := 'T';
    telaDados.tblPedidos.Post;
    telaDados.tblPedidos.ApplyUpdates;
    telaDados.tblPedidos.Close;

    Spos := False;

  end;

  PagamentoMFe.Free;
  telaDados.tblEmitente.Close;
end;

procedure TtelaConfigSat.VerificaStatusValidador;
var
  VerificarStatusValidador : TVerificarStatusValidador;
  RespostaVerificarStatusValidador : TRespostaVerificarStatusValidador;
  nv: Double;
begin
  VerificarStatusValidador := TVerificarStatusValidador.Create;
  telaDados.tblPedidos.Open;
  telaDados.tblPedidos.Last;
  telaDados.tblEmitente.Open;
  telaDados.tblEmitente.Last;
  try
    with VerificarStatusValidador do
    begin
      Clear;
      ChaveAcessoValidador := edtChAv.Text;
      IDFila := telaDados.tblPedidosIDPAGAMENTO.AsInteger;
      CNPJ:= telaDados.tblEmitenteCNPJ.Text;
    end;

    ACBrIntegrador1.VerificarStatusValidador(VerificarStatusValidador);
    RespostaVerificarStatusValidador := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).VerificarStatusValidador(VerificarStatusValidador) ;

    telaDados.tblPagamento.Open;
    telaDados.tblPagamento.Insert;
    telaDados.tblPagamentoID.Value := RespostaVerificarStatusValidador.IDFila;
    telaDados.tblPagamentoCODAUT.Value := RespostaVerificarStatusValidador.CodigoAutorizacao;
    telaDados.tblPagamentoINSTFIN.Value := RespostaVerificarStatusValidador.InstituicaoFinanceira;
    telaDados.tblPagamentoDONOCARTAO.Value := RespostaVerificarStatusValidador.DonoCartao;
    telaDados.tblPagamentoPARCELAS.Value := RespostaVerificarStatusValidador.Parcelas;
    telaDados.tblPagamentoQTRDIG.Value := RespostaVerificarStatusValidador.UltimosQuatroDigitos;
    telaDados.tblPagamentoCODPAG.Value := RespostaVerificarStatusValidador.CodigoPagamento;
    {if RespostaVerificarStatusValidador.ValorPagamento > telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat then begin
      inputbox('Valor incorreto', 'Digite o valor corretamente', FloatToStr(nv));
      if nv <> telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat then begin
        ShowMessage('Venda cancelada, valores incorretos, por favor refaça a venda');
        cancelaVenda;
        ACBrSAT1.CFe.Clear;
        Abort;
      end;
      RespostaVerificarStatusValidador.ValorPagamento := nv;
    end else}
    if RespostaVerificarStatusValidador.InstituicaoFinanceira = '' then begin
      ShowMessage('Pagamento cancelado');
      Spos := false;
      telaDados.tblPagamento.Cancel;
      cadastraPagamento;
    end;


    if RespostaVerificarStatusValidador.ValorPagamento > 0 then begin
    if RespostaVerificarStatusValidador.ValorPagamento < telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat then begin
      nv := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat - RespostaVerificarStatusValidador.ValorPagamento;
      if MessageBox(Handle,pansichar('Valor Pago está diferente do valor total da nota, deseja completar o valor da nota com pagamento em dinheiro? Faltando: R$ ' + FloatToStr(nv)), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
        RespostaVerificarStatusValidador.ValorPagamento := StrToFloat(telaLancPedidos.edtDin.Text);
        with ACBrSAT1.CFe.Pagto.Add do
        begin
          cMP := mpDinheiro;
          vMP := nv;
        end;
      end;
     end;

    telaDados.tblPagamentoVRPAG.Value := RespostaVerificarStatusValidador.ValorPagamento;

    ShowMessage(IntToStr(RespostaVerificarStatusValidador.IDFila));
    ShowMessage('Codigo autorizacao: ' + RespostaVerificarStatusValidador.CodigoAutorizacao);
    ShowMessage('Instituicao: ' +RespostaVerificarStatusValidador.InstituicaoFinanceira);
    ShowMessage('Dono do cartao: ' +RespostaVerificarStatusValidador.DonoCartao);
    ShowMessage('Parcelas: ' + intToStr(RespostaVerificarStatusValidador.Parcelas));
    ShowMessage('4 dig: ' + intToStr(RespostaVerificarStatusValidador.UltimosQuatroDigitos));
    ShowMessage('codigo pagamento: ' + RespostaVerificarStatusValidador.CodigoPagamento);
    ShowMessage('Valor Pagamento: ' + FloatToStr(RespostaVerificarStatusValidador.ValorPagamento));
    end;

  finally
    VerificarStatusValidador.Free;
  end;
  telaDados.tblEmitente.Close;
  telaDados.tblPedidos.Close;

end;

procedure TtelaConfigSat.RespostaFiscal;
var
 RespostaFiscal : TRespostaFiscal;
 RetornoRespostaFiscal : TRetornoRespostaFiscal;
Begin
  RespostaFiscal := TRespostaFiscal.Create;
    try

      with RespostaFiscal do
      begin
        Clear;
        ChaveAcessoValidador := edtChAv.Text;
        IDFila := 0;
        ChaveAcesso := telaDados.tblPedidosCHAVECFE.AsString;
        telaDados.tblPagamento.Open;
        Nsu := telaDados.tblPagamentoID.AsString; {telaDados.qryPagamentos.FieldByName('ID').Value};
        NumerodeAprovacao := '1234';
        Bandeira := telaDados.tblPagamentoID.AsString {telaDados.qryPagamentos.FieldByName('INSTFIN').Value}; //DIGITADA PELO CAIXA
        Adquirente := telaDados.qryClientes.FieldByName('NOME').Value;
        {if Assigned(ACBrSAT1.CFe) then
          ImpressaoFiscal := '<![CDATA['+ACBrSATExtratoESCPOS1.GerarImpressaoFiscalMFe+']]>';}
        NumeroDocumento := IntToStr(ACBrSAT1.CFe.ide.nCFe) {'1674068'};
        CNPJ:= telaDados.tblEmitenteCNPJ.Text;
      end;
      RetornoRespostaFiscal := TACBrSATMFe_integrador_XML(ACBrSAT1.SAT).RespostaFiscal(RespostaFiscal);
      if not (telaDados.tblPagamento.State = dsInsert) then begin
        telaDados.tblPagamento.Open;
        telaDados.tblPagamento.Locate('ID', telaGerarNfe.idPg,[loCaseInsensitive]);
        telaDados.tblPagamento.Edit;
      end;
      telaDados.tblPagamentoIDRESPFISC.Value := StrToInt(RetornoRespostaFiscal.IdRespostaFiscal);
      telaDados.tblPagamento.Post;
      telaDados.tblPagamento.Close;
      ShowMessage('IDUNICO: '+RetornoRespostaFiscal.IdRespostaFiscal);
    finally
      RespostaFiscal.Free;
    end;
end;



procedure TtelaConfigSat.SpeedButton4Click(Sender: TObject);
begin
  edtChReq.Text := GuidCreate;
end;

procedure TtelaConfigSat.cadastraPagamento;
var nv : double;
begin
    telaDados.tblPagamento.Open;
    telaDados.tblPagamento.Insert;
    telaDados.tblPagamentoID.Value := telaDados.qryPedidos.FieldByName('IDPAGAMENTO').AsInteger;
    telaDados.tblPagamentoCODAUT.Value := inputbox('Código de autorização', 'Digite o Código de autorização(3 dig.)', '');
    telaDados.tblPagamentoINSTFIN.Value := inputbox('Instituição Financeira', 'Digite a Operadora do cartão', '');;
    telaDados.tblPagamentoDONOCARTAO.Value := inputbox('Dono do cartão', 'Digite o nome do proprietário do cartão', '');;
    telaDados.tblPagamentoPARCELAS.Value := 1;
    telaDados.tblPagamentoQTRDIG.AsString := inputbox('Quatro dígitos', 'Digite os últimos quatro dígitos do cartão', '');
    telaDados.tblPagamentoCODPAG.Value := IntToStr(RANDOM(99999));
    telaDados.tblPagamentoVRPAG.Value := telaLancPedidos.Ddin;
    if telaDados.tblPagamentoVRPAG.Value < telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat then begin
      nv := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat - telaDados.tblPagamentoVRPAG.Value;
      if MessageBox(Handle,pansichar('Valor Pago está diferente do valor total da nota, deseja completar o valor da nota com pagamento em dinheiro? Faltando: R$ ' + FloatToStr(nv)), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then begin
        with ACBrSAT1.CFe.Pagto.Add do
        begin
          cMP := mpDinheiro;
          vMP := nv;
        end;
      end;
    end;

    telaDados.tblPagamento.Post;
    telaDados.tblPagamento.Close;

    telaDados.tblPedidos.Close;
    telaDados.tblPedidos.Open;
    telaDados.tblPedidos.Last;
    telaDados.tblPedidos.Edit;
    telaDados.tblPedidosPATH.Value := ACBrSAT1.NomeBancoCfe;
    telaDados.tblPedidosCHAVECFE.Value := 'CFe' + ACBrSAT1.CFe.infCFe.ID;
    telaDados.tblPedidosSTATUS.Value := 'T';
    telaDados.tblPedidos.Post;  //Caso queira transmitir depois a cfe

    Spos := false;

end;

procedure TtelaConfigSat.btnEdChAvClick(Sender: TObject);
begin
  edtChAv.Enabled := true;
end;

procedure TtelaConfigSat.edtChAvExit(Sender: TObject);
begin
  edtChAv.Enabled := False;
end;

end.
