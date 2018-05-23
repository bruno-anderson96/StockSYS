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
    SpeedButton1: TSpeedButton;
    ACBrSAT1: TACBrSAT;
    edChaveCancelamento: TEdit;
    OpenDialog1: TOpenDialog;
    mRecebido: TWebBrowser;
    SpeedButton2: TSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnGeraNfeClick(Sender: TObject);
    procedure btnGeraCfeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
   
  private
    { Private declarations }
    procedure LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
  public
    { Public declarations }

    numN : integer;
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
  dtInicial.Date := Date;
  dtFinal.Date   := Date;
  telaDados.AtualizaConfigAcbr;
  edtDados.SetFocus;

  telaDados.qryPedidos.Close;
  telaDados.qryPedidos.SQL.Clear;
  telaDados.qryPedidos.SQL.Add('select * from pedido where id = 0');
  telaDados.qryPedidos.Open;
                                 
  numN := DBGrid1.Columns.Items[1].Field.AsInteger;

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
      1: telaDados.qryPedidos.SQL.Add('and pedido.idCliente = :pDados');
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
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  //
  num := DBGrid1.Columns.Items[1].Field.AsInteger;

  telaConfigSat.num := num;
  telaConfigSat.gerarVenda;
end;

procedure TtelaGerarNfe.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Arquivo XML|*.xml';
  if OpenDialog1.Execute then
  begin
    ACBrSAT1.CFe.LoadFromFile( OpenDialog1.FileName );
    ACBrSAT1.CFe2CFeCanc;

    telaConfigSat.Memo1.Lines.Text := ACBrSAT1.CFeCanc.GerarXML( False ) ;  // True = Gera apenas as TAGs da aplicação
    edChaveCancelamento.Text := ACBrSAT1.CFeCanc.infCFe.chCanc;
  end;
end;

procedure TtelaGerarNfe.LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
begin
  WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml',
              AXML, False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml');
end;

procedure TtelaGerarNfe.SpeedButton2Click(Sender: TObject);
begin
if telaConfigSat.Memo1.Lines.Count < 1 then
  begin
    ACBrSAT1.CancelarUltimaVenda;
    telaConfigSat.Memo1.Lines.Text := ACBrSAT1.CFeCanc.GerarXML(True);
  end
  else
  begin
    if edChaveCancelamento.Text = '' then
    begin
      ACBrSAT1.CFeCanc.AsXMLString := telaConfigSat.Memo1.Lines.Text;
      edChaveCancelamento.Text := ACBrSAT1.CFeCanc.infCFe.chCanc;
    end;
    ACBrSAT1.CancelarUltimaVenda( edChaveCancelamento.Text, telaConfigSat.Memo1.Lines.Text );
  end ;

  if ACBrSAT1.Resposta.codigoDeRetorno = 7000 then
  begin
    LoadXML( ACBrSAT1.CFeCanc.AsXMLString, mRecebido );
    ShowMessage('Recebido');
  end;
end;

end.
