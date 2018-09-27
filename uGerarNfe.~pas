unit uGerarNfe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, uDados,
  DB, IBDatabase, IBCustomDataSet, IBQuery, pcnConversao, pcnConversaoNFe, pcnAuxiliar,
  ACBrBase, ACBrSAT, SHDocVw, ACBrUtil, OleCtrls;

type
  TtelaGerarNfe = class(TForm)
    GroupBox1: TGroupBox;
    radOpt: TRadioGroup;
    edtDados: TEdit;
    GroupBox2: TGroupBox;
    dtInicial: TDateTimePicker;
    dtFinal: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    dsConsultaPedidos: TDataSource;
    btnGeraNfe: TBitBtn;
    btnGeraCfe: TSpeedButton;
    btS: TSpeedButton;
    ACBrSAT1: TACBrSAT;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    mRecebido: TMemo;
    StatusBar1: TStatusBar;
    btnEnviaPagamento: TSpeedButton;
    cbPos: TComboBox;
    SpeedButton3: TSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnGeraNfeClick(Sender: TObject);
    procedure btnGeraCfeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btSClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure btnEnviaPagamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   
  private
    { Private declarations }
    procedure LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
    function InputCombo(const ACaption, APrompt: string; const AList: TStrings): String;
  public
    { Public declarations }

    numN : integer;
    idPg : integer;
  end;

var
  telaGerarNfe: TtelaGerarNfe;


implementation

uses pcnNFe, uConfigSat, uLancPedidos, pcnCFeCanc;

{$R *.dfm}

procedure TtelaGerarNfe.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TtelaGerarNfe.FormShow(Sender: TObject);
begin
  if cbPos.Items.Count < 1 then begin
     with telaDados.tblPos do
     begin
      First;
     while not Eof do
     begin
      cbPos.Items.Add(telaDados.tblPos.FieldByName('DESCRICAO').AsString);
      Next;
     end;
    end;
  end;

  dtInicial.Date := Date;
  dtFinal.Date   := Date;
  telaDados.AtualizaConfigAcbr;
  edtDados.SetFocus;

  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('select * from pedido where id = 0');
  telaDados.qryPedidos.Open;
                                 
  numN := DBGrid1.Columns.Items[1].Field.AsInteger;
  telaDados.tblPedidos.Open;
  telaDados.tblPedidos.Locate('ID', numN , []);

  {telaGerarNfe.Close;             }
end;

procedure TtelaGerarNfe.BitBtn1Click(Sender: TObject);
begin
  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from pedido');
  telaDados.qryPedidos.SQL.Add('Where cast(pedido.data_pedido as date) between :pDatai and :pDataf');
    case radOpt.ItemIndex of
      0: telaDados.qryPedidos.SQL.Add('and pedido.id = :pDados');
      1: telaDados.qryPedidos.SQL.Add('and pedido.id_Cliente = :pDados');
      2: telaDados.qryPedidos.SQL.Add('and upper(pedido.cliente) like :pDados');
    end;
    //Parâmetros
    telaDados.qryPedidos.Params.ParamByName('pDatai').asDate := dtInicial.Date;
    telaDados.qryPedidos.Params.ParamByName('pDataf').asDate := dtFinal.Date;
    case radOpt.ItemIndex of
      0: telaDados.qryPedidos.Params.ParamByName('pDados').asString := edtDados.Text;
      1: telaDados.qryPedidos.Params.ParamByName('pDados').asInteger := StrToInt(edtDados.Text);
      2: telaDados.qryPedidos.Params.ParamByName('pDados').asString := '%' + UpperCase(edtDados.Text) + '%';
    end;
  telaDados.qryPedidos.Open;
  DBGrid1.SetFocus;
end;


procedure TtelaGerarNfe.btnGeraNfeClick(Sender: TObject);
var
aNumItem : integer;

begin

  if telaDados.qryPedidos.RecordCount = 0 then
  begin
    MessageDlg('É necessário selecionar o pedido!', mtWarning, [mbOK], 0);
    Abort;
  end;
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  //
  if numN = 0 then begin
  numN := DBGrid1.Columns.Items[1].Field.AsInteger;
  end;

  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from Pedido where ID = ');
  telaDados.qryPedidos.SQL.Add(IntToStr(numN));
  telaDados.qryPedidos.Open;

  telaDados.qryClientes.Close;
  telaDados.qryClientes.SQL.Clear;
  telaDados.qryClientes.SQL.Add('Select * from Cliente where id = ');
  telaDados.qryClientes.SQL.Add(telaDados.qryPedidos.FieldByName('ID_CLIENTE').Value);
  telaDados.qryClientes.Open;  

  telaDados.qryPedidosItens.Close;
  telaDados.qryPedidosItens.SQL.Clear;
  telaDados.qryPedidosItens.SQL.Add('Select * from PEDIDO_ITENS where id = ');
  telaDados.qryPedidosItens.SQL.Add(telaDados.qryPedidos.FieldByName('ID').Value);
  telaDados.qryPedidosItens.Open;


  {ShowMessage(telaDados.qryPedidos.FieldByName('ID').AsString);
  ShowMessage(telaDados.qryClientes.FieldByName('ID').AsString);
  ShowMessage(telaDados.qryClientes.FieldByName('Nome').AsString);}
  
  with telaDados.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    // Dados Principais
    Ide.cNF     := numN;
    Ide.natOp   := '5102';
    Ide.indPag  := ipVista;
    Ide.modelo  := 55; //Indicador de nota fiscal eletrônica;
    Ide.serie   := 1;  //Nfe = 1~999 (900~999 utilizado para emissão nacional)
    Ide.nNF     := numN;
    Ide.dEmi    := Date;
    Ide.dSaiEnt := Date;
    Ide.tpNF    := tnSaida;
    if telaDados.sAmbiente = 0 then
      Ide.tpAmb := taProducao
    else
      Ide.tpAmb := taHomologacao;
    Ide.verProc := '1.0.0.0';
    Ide.cUF     := UFparaCodigo(telaDados.sUf);
    Ide.cMunFG  := StrToInt(telaDados.sCodMun);
    Ide.finNFe  := fnNormal;
    // Emitente
    Emit.CRT     := crtSimplesNacional;
    Emit.CNPJCPF := telaDados.sCnpj;
    Emit.IE      := telaDados.sInscEst;
    Emit.IEST    := '';
    Emit.xNome   := telaDados.sRazSoc;
    Emit.xFant   := telaDados.sFantasia;
    Emit.IM      := '';
    Emit.CNAE    := '';
    Emit.EnderEmit.xLgr    := telaDados.sEndereco;
    Emit.EnderEmit.nro     := telaDados.sNum;
    Emit.EnderEmit.xCpl    := '';
    Emit.EnderEmit.xBairro := telaDados.sBairro;
    Emit.EnderEmit.cMun    := StrToInt(telaDados.sCodMun);
    Emit.EnderEmit.xMun    := telaDados.sCidade;
    Emit.EnderEmit.UF      := telaDados.sUf;
    Emit.EnderEmit.CEP     := StrToInt(telaDados.sCep);
    Emit.EnderEmit.fone    := telaDados.sTelefone;
    Emit.EnderEmit.cPais   := 1058;
    Emit.EnderEmit.xPais   := 'BRASIL';
    // Destinatário
    Dest.CNPJCPF := telaDados.qryClientes.FieldByName('CNPJ_CPF').AsString;
    Dest.IE      := telaDados.qryClientes.FieldByName('INSC_RG').AsString;
    Dest.ISUF    := '';
    Dest.xNome   := telaDados.qryClientes.FieldByName('NOME').AsString;
    Dest.EnderDest.xLgr := telaDados.qryClientes.FieldByName('ENDERECO').AsString;
    Dest.EnderDest.nro  := telaDados.qryClientes.FieldByName('NUM_END').AsString;
    Dest.EnderDest.xCpl := telaDados.qryClientes.FieldByName('COMPLEMENTO').AsString;
    Dest.EnderDest.xBairro := telaDados.qryClientes.FieldByName('BAIRRO_END').AsString;
    Dest.EnderDest.cMun := 0;
    Dest.EnderDest.xMun := telaDados.qryClientes.FieldByName('CIDADE_END').AsString;
    Dest.EnderDest.UF   := telaDados.qryClientes.FieldByName('UF_END').AsString;
    Dest.EnderDest.CEP  := StrTOInt(telaDados.qryClientes.FieldByName('CEP_END').AsString);
    Dest.EnderDest.cPais := 1058;
    Dest.EnderDest.xPais := 'BRASIL';
    Dest.EnderDest.fone  := telaDados.tblClientesTELEFONE.AsString;
    // Entrega
    Entrega.xLgr := telaDados.qryClientes.FieldByName('END_ENTREGA').AsString;
    Entrega.nro  := telaDados.qryClientes.FieldByName('NUM_END_ENTREGA').AsString;
    Entrega.xCpl := telaDados.qryClientes.FieldByName('COMPL_ENT').AsString;
    Entrega.xBairro := telaDados.qryClientes.FieldByName('BAIRRO_END_ENTREGA').AsString;
    Entrega.cMun := telaDados.pegaCodMun(telaDados.qryClientes.FieldByName('CIDADE_END').AsString, telaDados.qryClientes.FieldByName('UF_END_ENT').AsString);
    Entrega.xMun := telaDados.qryClientes.FieldByName('CID_END_ENTREGA').AsString;
    Entrega.UF   := telaDados.qryClientes.FieldByName('UF_END_ENT').AsString;
    // Itens das NFe
    aNumItem := 0;
    telaDados.tblPedidosItens.Open;
    telaDados.qryPedidosItens.First;
      while not telaDados.qryPedidosItens.Eof do
      begin
        Inc(aNumItem);
        with Det.Add do
        begin
          Prod.nItem := aNumItem;
          Prod.cProd := IntToStr(telaDados.qryPedidosItens.FieldByName('ID_PRODUTO').AsInteger);
          Prod.cEAN  := telaDados.qryPedidos.FieldByName('ItensEAN13').AsString;
          Prod.xProd := telaDados.qryPedidos.FieldByName('ItensDESCRICAO').AsString;
          Prod.NCM   := telaDados.qryProdutos.FieldByName('CODIGO_NCM').AsString;
          Prod.EXTIPI := '';
          if (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger = 0) or
             (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger = 1) or
             (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger = 2) or
             (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger = 4) then
            begin
             Prod.CFOP := '5102';
            end
            else if telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger = 3 then
            begin
             Prod.CFOP := '5403';
            end;
          Prod.uCom := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
          Prod.qCom := telaDados.qryPedidosItens.FieldByName('QUANTIDADE').AsFloat;
          Prod.cEANTrib := '';
          Prod.uTrib := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
          if telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger = 0 then
            Prod.qTrib := telaDados.qryPedidosItens.FieldByName('QUANTIDADE').AsFloat
          else
          Prod.qTrib := 0;
          Prod.vFrete  := 0;
          Prod.vSeg    := 0;
          Prod.vDesc   := telaDados.qryPedidosItens.FieldByName('DESCONTO').AsFloat;
          with Imposto do
          begin
            with ICMS do
            begin
              if telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger=0 then
              begin
              CST := cst00; // 0 - Tributado
              CSOSN := csosn101;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').asFloat;
              ICMS.pICMS    := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
              ICMS.vICMS    := (telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := 0;
              ICMS.vICMSST  := 0;
              ICMS.pRedBC   := 0;
              end;
              if telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger=3 then
              begin
              CST := cst60; // 0 - Sub.Tributária
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').asFloat;
              ICMS.pICMS    := 0;
              ICMS.vICMS    := 0;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
              ICMS.vICMSST  := (telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
              ICMS.pRedBC   := 0;
              end;
            end;
            if (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger=1) or
                (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger=2) then
            begin
            with II do
            begin
                vBc := 0;
                vDespAdu := 0;
                vII := telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').asFloat;
                vIOF := 0;
            end;
            end;
            if (telaDados.qryPedidosItens.FieldByName('TIPOPROD').AsInteger=4) then
            begin
            with ISSQN do
            begin
                vBc       := telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').asFloat;
                vAliq     := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
                vISSQN    := (telaDados.qryPedidosItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
                cMunFG    := 0;
                cListServ := '0';
            end;
            end;
         
        end;
        telaDados.qryPedidosItens.Next;
      end;
      // Informações finais de NFe
      Total.ICMSTot.vBC    := telaDados.qryTributos.FieldByName('VALOR').AsFloat;
      Total.ICMSTot.vICMS  := telaDados.qryTributos.FieldByName('VAL_ICMS').AsFloat;
      Total.ICMSTot.vBCST  := telaDados.qryTributos.FieldByName('BASE_ST').AsFloat;
      Total.ICMSTot.vST    := (telaDados.qryTributos.FieldByName('BASE_ST').AsFloat * telaDados.qryTributos.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
      Total.ICMSTot.vProd  := telaDados.qryPedidos.FieldByName('VALOR').asFloat;
      Total.ICMSTot.vFrete := 0;
      Total.ICMSTot.vSeg   := 0;
      Total.ICMSTot.vDesc  := telaDados.qryPedidos.FieldByName('DESCONTO').AsFloat;
      Total.ICMSTot.vII    := 0;
      Total.ICMSTot.vIPI   := 0;
      Total.ICMSTot.vPIS   := 0;
      Total.ICMSTot.vCOFINS:= 0;
      Total.ICMSTot.vOutro := 0;
      Total.ICMSTot.vNF    := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat;
      //
      Total.ISSQNtot.vServ    := 0;
      Total.ISSQNtot.vBC      := 0;
      Total.ISSQNtot.vISS     := 0;
      Total.ISSQNtot.vPIS     := 0;
      Total.ISSQNtot.vCOFINS  := 0;
      //
      Total.retTrib.vRetPIS     := 0;
      Total.retTrib.vRetCOFINS  := 0;
      Total.retTrib.vRetCSLL    := 0;
      Total.retTrib.vBCIRRF     := 0;
      Total.retTrib.vRetPrev    := 0;
      //Transportadora
      {
      Transp.Transporta.CNPJCPF := '';
      Transp.Transporta.xNome   := '';
      Transp.Transporta.IE      := '';
      Transp.Transporta.xEnder  := '';
      Transp.Transporta.xMun    := '';
      Transp.Transporta.UF      := '';
      with Transp.Reboque.Add do
      begin
        placa := '';
        UF    := '';
        RNTC  := '';
      end;
      with Transp.Vol.Add do
      begin
        qVol  := 1;
        esp   := '';
        marca := '';
        nVol  := '';
        pesoL := 0;
        pesoB := 0;
      end;
      }
      //Cobrança
      Cobr.Fat.nFat  := telaDados.qryPedidos.FieldByName('ID').AsString;
      Cobr.Fat.vOrig := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat;
      Cobr.Fat.vDesc := 0;
      Cobr.Fat.vLiq  := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat;
      with Cobr.Dup.Add do
      begin
        nDup  := telaDados.qryPedidos.FieldByName('ID').AsString;
        dVenc := telaDados.qryPedidos.FieldByName('DATA_PEDIDO').AsDateTime + 30;
        vDup  := telaDados.qryPedidos.FieldByName('VALOR_TOTAL').AsFloat;
      end;
      //
      with InfAdic.obsCont.Add do
      begin
        xCampo := '';
        xTexto := '';
      end;
      with InfAdic.obsFisco.Add do
      begin
        xCampo := '';
        xTexto := '';
      end;
        infNFe.Versao := 4.00;
    end;

    // Comandos para gerar arquivo XML
    {
    telaDados.ACBrNFe1.NotasFiscais.GerarNFe;
    telaDados.ACBrNFe1.NotasFiscais.Assinar;
    telaDados.ACBrNFe1.NotasFiscais.Validar;
    }
    telaDados.ACBrNFe1.NotasFiscais.Assinar;                                                      
    telaDados.ACBrNFe1.NotasFiscais.Items[0].GravarXML('Teste.xml', ExtractFilePath(ParamStr(0)));


    telaDados.tblPedidosItens.Close;
  end;
end;

procedure TtelaGerarNfe.btnGeraCfeClick(Sender: TObject);
var
num : integer;
begin
   if telaDados.qryPedidos.RecordCount = 0 then
  begin
    MessageDlg('É necessário selecionar o pedido!', mtWarning, [mbOK], 0);
    Abort;
  end;
  {telaDados.ACBrNFe1.NotasFiscais.Clear;}
  //
  
  num := DBGrid1.Columns.Items[1].Field.AsInteger;

  telaConfigSat.num := num;

  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from PEDIDO where ID =');
  telaDados.qryPedidos.SQL.Add(IntToStr(num));
  telaDados.qryPedidos.Open;

  telaDados.qryPagamentos.Close;
  telaDados.qryPagamentos.SQL.Clear;
  telaDados.qryPagamentos.SQL.Add('Select * from PAGAMENTO where ID =');
  telaDados.qryPagamentos.SQL.Add(telaDados.qryPedidos.FieldByName('IDPAGAMENTO').AsString);
  telaDados.qryPagamentos.Open;

  telaDados.qryClientes.Close;
  telaDados.qryClientes.SQL.Clear;
  telaDados.qryClientes.SQL.Add('Select * from CLIENTE where ID =');
  telaDados.qryClientes.SQL.Add(telaDados.qryPedidos.FieldByName('ID_Cliente').AsString);
  telaDados.qryClientes.Open;

  if telaDados.qryPedidos.FieldByName('STATUS').Value = 'T' then begin
    telaConfigSat.EnviaPagamento;
    telaConfigSat.RespostaFiscal;
  end else begin
    ShowMessage('Pagamento já foi efetuado!');
  end;

end;

procedure TtelaGerarNfe.LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
begin
  WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml',
              AXML, False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml');
end;

procedure TtelaGerarNfe.SpeedButton2Click(Sender: TObject);
var
num : integer;
begin
  telaConfigSat.AjustarCfe;
  //telaConfigSat.AjustarCfeFortes;
  //telaConfigSat.PrepararImpressao;
  telaConfigSat.ACBrSAT1.Inicializar;

  num := DBGrid1.Columns.Items[1].Field.AsInteger;
  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from PEDIDO where id = ');
  telaDados.qryPedidos.SQL.Add(IntToStr(num));
  telaDados.qryPedidos.Open;
  //telaConfigSat.AjustarCfe;
  telaConfigSat.ACBrSAT1.CFe.LoadFromFile(telaDados.qryPedidos.FieldByName('PATH').AsString);
  telaConfigSat.ACBrSAT1.CFe2CFeCanc;
  telaConfigSat.ACBrSAT1.CFeCanc.infCFe.chCanc := telaDados.qryPedidos.FieldByName('CHAVECFE').AsString;
  mRecebido.Text := telaConfigSat.ACBrSAT1.CFeCanc.GerarXML(True);
  telaConfigSat.ACBrSAT1.CancelarUltimaVenda(telaDados.qryPedidos.FieldByName('CHAVECFE').AsString, mRecebido.Lines.Text);

  if telaConfigSat.ACBrSAT1.Resposta.codigoDeRetorno = 07000 then begin
    ShowMessage('Cupom cancelado com sucesso!');
    telaDados.tblPedidos.Open;
    telaDados.tblPedidos.Locate('ID' , num,[loCaseInsensitive]);
    telaDados.tblPedidos.Edit;
    telaDados.tblPedidosSTATUS.AsString := 'F';
    telaDados.tblPedidos.Post;
    {
    telaDados.qryPedidos.Close;
    telaDados.qryPedidos.SQL.Clear;
    telaDados.qryPedidos.SQL.Add('UPDATE PEDIDO');
    telaDados.qryPedidos.SQL.Add(' SET STATUS = '+QuotedStr('F'));
    telaDados.qryPedidos.SQL.Add(' WHERE ID = ');
    telaDados.qryPedidos.SQL.Add(IntToStr(num));
    telaDados.qryPedidos.Open; }
    telaConfigSat.ACBrSAT1.ImprimirExtratoCancelamento;
  end else begin
    ShowMessage('Cupom não pode ser cancelado! ' + ' Verifique se o período já passou do prazo máximo permitido(30 minutos) desde a emissão do cupom.' );
  end;
  
end;

procedure TtelaGerarNfe.btSClick(Sender: TObject);
var
num : integer;
begin
{  OpenDialog1.Filter := 'Arquivo XML|*.xml';
  if OpenDialog1.Execute then
  begin
    {telaConfigSat.ACBrSAT1.CFe.LoadFromFile( OpenDialog1.FileName );}
    {telaConfigSat.ACBrSAT1.CFe2CFeCanc;

    telaConfigSat.Memo1.Lines.Text := telaConfigSat.ACBrSAT1.CFeCanc.GerarXML( True ) ;  // True = Gera apenas as TAGs da aplicação
    telaConfigSat.ACBrSAT1.CancelarUltimaVenda;

  end ;}
    telaConfigSat.AjustarCfe;
  telaConfigSat.ACBrSAT1.Inicializar;

  num := DBGrid1.Columns.Items[1].Field.AsInteger;
  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from PEDIDO where id = ');
  telaDados.qryPedidos.SQL.Add(IntToStr(num));
  telaDados.qryPedidos.Open;
  telaConfigSat.ACBrSAT1.CFe.LoadFromFile(telaDados.qryPedidos.FieldByName('PATH').AsString);
  ShowMessage(telaConfigSat.ACBrSAT1.CFe.infCFe.ID);
  ShowMessage(telaConfigSat.ACBrSAT1.CFe.NomeArquivo);
  ShowMessage(telaConfigSat.ACBrSAT1.CFe.ide.CNPJ);
  ShowMessage(FloatToStr(telaConfigSat.ACBrSAT1.CFe.Total.vCFe));
end;

procedure TtelaGerarNfe.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.Field.FieldName = 'STATUS' then begin
    if (DBGrid1.Columns.Items[4].Field.AsString = 'V') then begin
       DBGrid1.Canvas.Brush.Color := clGreen;
       DBGrid1.Canvas.Font.Color := clGreen;
       DBGrid1.Canvas.FillRect(Rect);
    end;
    if (DBGrid1.Columns.Items[4].Field.AsString = 'F') then begin
       DBGrid1.Canvas.Brush.Color := clRed;
       DBGrid1.Canvas.Font.Color := clRed;
       DBGrid1.Canvas.FillRect(Rect);
    end;
    if (DBGrid1.Columns.Items[4].Field.AsString = 'T') then begin
       DBGrid1.Canvas.Brush.Color := clYellow;
       DBGrid1.Canvas.Font.Color := clYellow;
       DBGrid1.Canvas.FillRect(Rect);
    end;

    DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column, State);
    end;
end;

procedure TtelaGerarNfe.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
 if Panel.Index = 0 then
  begin
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.Brush.Color := clGreen;
    StatusBar1.Canvas.Font.Color := clGreen;
    StatusBar1.Canvas.TextOut(Rect.Left, Rect.Top, Panel.Text);
  end;
   if Panel.Index = 2 then
  begin
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.Brush.Color := clYellow;
    StatusBar1.Canvas.Font.Color := clYellow;
    StatusBar1.Canvas.TextOut(Rect.Left , Rect.Top, Panel.Text);
  end;
  if Panel.Index = 4 then
  begin
    StatusBar1.Canvas.FillRect(Rect);
    StatusBar1.Canvas.Brush.Color := clRed;
    StatusBar1.Canvas.Font.Color := clRed;
    StatusBar1.Canvas.TextOut(Rect.Left , Rect.Top, Panel.Text);
  end;
end;

procedure TtelaGerarNfe.btnEnviaPagamentoClick(Sender: TObject);
var
num : integer;
pos : TStringList;
codAutA : string;
insFinA : string;
donoCartaoA : String;
parcelasA : integer;
qtrDigA : integer;
vrPagA : Double;
impFisA : String;
begin
   if telaDados.qryPedidos.RecordCount = 0 then
  begin
    MessageDlg('É necessário selecionar o pedido!', mtWarning, [mbOK], 0);
    Abort;
  end;
  {telaDados.ACBrNFe1.NotasFiscais.Clear;}
  //
  if cbPos.ItemIndex = -1 then begin
    ShowMessage('Selecione um POS');
    Abort;
  end;
  telaConfigSat.posV := 0;
  num := DBGrid1.Columns.Items[1].Field.AsInteger;
  telaConfigSat.ACBrSATExtratoESCPOS1.ACBrSAT := ACBrSAT1;
  telaConfigSat.num := num;

  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('Select * from PEDIDO where ID =');
  telaDados.qryPedidos.SQL.Add(IntToStr(num));
  telaDados.qryPedidos.Open;

  telaDados.qryPagamentos.Close;
  telaDados.qryPagamentos.SQL.Clear;
  telaDados.qryPagamentos.SQL.Add('Select * from PAGAMENTO where ID =');
  telaDados.qryPagamentos.SQL.Add(telaDados.qryPedidos.FieldByName('IDPAGAMENTO').AsString);
  telaDados.qryPagamentos.Open;

  idPg := telaDados.qryPagamentos.FieldByName('ID').AsInteger;
  impFisA := telaDados.qryPagamentos.FieldByName('IMPFIS').Text;
  codAutA := telaDados.qryPagamentos.FieldByName('CODAUT').AsString;
  vrPagA := telaDados.qryPagamentos.FieldByName('VRPAG').AsCurrency;
  qtrDigA := telaDados.qryPagamentos.FieldByName('QTRDIG').AsInteger;
  insFinA := telaDados.qryPagamentos.FieldByName('INSTFIN').AsString;
  donoCartaoA := telaDados.qryPagamentos.FieldByName('DONOCARTAO').AsString;
  parcelasA := telaDados.qryPagamentos.FieldByName('PARCELAS').AsInteger;

  telaDados.qryClientes.Close;
  telaDados.qryClientes.SQL.Clear;
  telaDados.qryClientes.SQL.Add('Select * from CLIENTE where ID =');
  telaDados.qryClientes.SQL.Add(telaDados.qryPedidos.FieldByName('ID_Cliente').AsString);
  telaDados.qryClientes.Open;

  if telaDados.qryPedidos.FieldByName('STATUS').Value  = 'T' then begin
    telaConfigSat.AjustarCfe;
    telaConfigSat.ACBrSAT1.Inicializar;
    telaConfigSat.ACBrSAT1.CFe.LoadFromFile(telaDados.qryPedidos.FieldByName('PATH').AsString);
    telaConfigSat.ACBrSAT1.CFe.infCFe.ID := telaDados.qryPedidos.FieldByName('CHAVECFE').AsString;
    telaConfigSat.Memo1.Lines.LoadFromFile(telaDados.qryPedidos.FieldByName('PATH').AsString);
    ACBrSAT1.CFe.AsXMLString := telaConfigSat.Memo1.Lines.Text;

      telaLancPedidos.Ddin := telaDados.qryPagamentos.FieldByName('VRPAG').Value;
      try
        telaConfigSat.EnviaPagamento;
        telaDados.tblPagamento.Open;
        telaDados.tblPagamento.Locate('ID', idPg, []);
        telaConfigSat.RespostaFiscal;
      finally
        telaDados.tblPagamento.Open;
        //telaDados.tblPagamento.Locate('ID', idPgN,[loCaseInsensitive]);
        telaDados.tblPagamento.Insert;
        //ShowMessage(IntTOStr(idPg));
        //telaDados.tblPagamento.Edit;
        telaDados.tblPagamentoID.Value := telaConfigSat.idPgN;
        telaDados.tblPagamentoIDRESPFISC.Value := telaConfigSat.repA;
        telaDados.tblPagamentoCODAUT.Value := codAutA;
        telaDados.tblPagamentoIMPFIS.Value := telaConfigSat.impFisS;
        telaDados.tblPagamentoINSTFIN.Value := insFinA;
        telaDados.tblPagamentoDONOCARTAO.Value := donoCartaoA;
        telaDados.tblPagamentoPARCELAS.Value := parcelasA;
        telaDados.tblPagamentoQTRDIG.Value := qtrDigA;
        telaDados.tblPagamentoCODPAG.Value := IntToStr(RANDOM(99999));
        telaDados.tblPagamentoVRPAG.Value := vrPagA;
        //telaDados.tblPagamentoID.Value := telaDados.qryPedidos.FieldByName('IDPAGAMENTO').Value;
        telaDados.tblPagamento.Post;
        //ShowMessage('TEM QUE SER O NOVO ' + telaDados.tblPagamentoID.AsString);
        telaDados.tblPagamento.Close;

        telaDados.tblPedidos.Open;
        telaDados.tblPedidos.Locate('ID', num,[loCaseInsensitive]);
        telaDados.tblPedidos.Edit;
        //telaDados.tblPedidosIDPAGAMENTO.Value := idPg;
        telaDados.tblPedidosSTATUS.Value := 'V';
        try
          telaDados.tblPedidos.Post;
        except
          ShowMessage('Erro na venda');
        end;
        //telaDados.tblPedidos.Close;
        ShowMessage('Pagamento efetuado com sucesso!');
      end;
  end else begin
    ShowMessage('Pagamento já foi efetuado!');
  end;
end;

procedure TtelaGerarNfe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  telaDados.tblPedidos.Close;
  telaDados.tblPedidosItens.Close;
end;

function TtelaGerarNfe.InputCombo(const ACaption, APrompt: string; const AList: TStrings): string;
 
  function GetCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;  
 
var
  Form: TForm;
  Prompt: TLabel;
  Combo: TComboBox;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := '';
  Form   := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption     := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position    := poScreenCenter;
      Prompt      := TLabel.Create(Form);
      with Prompt do
      begin
        Parent   := Form;
        Caption  := APrompt;
        Left     := MulDiv(8, DialogUnits.X, 4);
        Top      := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      Combo := TComboBox.Create(Form);
      with Combo do
      begin
        Parent := Form;
        Style  := csDropDownList; // Caso o item possa ser digitado, altere aqui para csDropDowns
        Items.Assign(AList);
        ItemIndex := 0;
        Left      := Prompt.Left;
        Top       := Prompt.Top + Prompt.Height + 5;
        Width     := MulDiv(164, DialogUnits.X, 4);
      end;
      ButtonTop    := Combo.Top + Combo.Height + 15;
      ButtonWidth  := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent      := Form;
        Caption     := 'OK';
        ModalResult := mrOk;
        default     := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent      := Form;
        Caption     := 'Cancelar';
        ModalResult := mrCancel;
        Cancel      := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Combo.Top + Combo.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Result := Combo.Text;
      end;
    finally
      Form.Free;
    end;
end;

end.
