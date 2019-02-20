unit uGerarNfeEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDados, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, pcnConversao, pcnConversaoNFe, pcnAuxiliar;

type
  TtelaGerarNfeEntrada = class(TForm)
    GroupBox1: TGroupBox;
    radOpt: TRadioGroup;
    edtDados: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtInicial: TDateTimePicker;
    dtFinal: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    dsConsultaCompras: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  telaGerarNfeEntrada: TtelaGerarNfeEntrada;

implementation

uses uLancCompras, pcnNFe;

{$R *.dfm}

procedure TtelaGerarNfeEntrada.BitBtn1Click(Sender: TObject);
begin
  telaDados.qryCompras.Close;
  telaDados.qryCompras.SQL.Clear;
  telaDados.qryCompras.SQL.Add('Select * from compra');
  telaDados.qryCompras.SQL.Add('Where cast(compra.data_compra as date) between :pDatai and :pDataf');
    case radOpt.ItemIndex of
      0: telaDados.qryCompras.SQL.Add('and compra.id = :pDados');
      1: telaDados.qryCompras.SQL.Add('and compra.id_fornecedor = :pDados');
      2: telaDados.qryCompras.SQL.Add('and upper(compra.fornecedor) like :pDados');
    end;
    //Parâmetros
    telaDados.qryCompras.Params.ParamByName('pDatai').asDate := dtInicial.Date;
    telaDados.qryCompras.Params.ParamByName('pDataf').asDate := dtFinal.Date;
    case radOpt.ItemIndex of
      0: telaDados.qryCompras.Params.ParamByName('pDados').asString := edtDados.Text;
      1: telaDados.qryCompras.Params.ParamByName('pDados').asInteger := StrToInt(edtDados.Text);
      2: telaDados.qryCompras.Params.ParamByName('pDados').asString := '%' + UpperCase(edtDados.Text) + '%';
    end;
  telaDados.qryCompras.Open;
  DBGrid1.SetFocus;
end;

procedure TtelaGerarNfeEntrada.BitBtn2Click(Sender: TObject);
begin
Close;
end;

procedure TtelaGerarNfeEntrada.BitBtn3Click(Sender: TObject);
var
aNumItem,num : integer;
begin
 if telaDados.qryCompras.RecordCount = 0 then
  begin
    MessageDlg('É necessário selecionar a compra!', mtWarning, [mbOK], 0);
    Abort;
  end;
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  //
  num := DBGrid1.Columns.Items[0].Field.AsInteger;
 
  telaDados.qryCompras.Close;
  telaDados.qryCompras.SQL.Clear;
  telaDados.qryCompras.SQL.Add('Select * from Compra where ID = ');
  telaDados.qryCompras.SQL.Add(IntToStr(num));
  telaDados.qryCompras.Open;

  telaDados.qryFornecedores.Close;
  telaDados.qryFornecedores.SQL.Clear;
  telaDados.qryFornecedores.SQL.Add('Select * from Fornecedor where id = ');
  telaDados.qryFornecedores.SQL.Add(telaDados.qryCompras.FieldByName('ID_FORNECEDOR').Value);
  telaDados.qryFornecedores.Open;

  telaDados.qryCompraItens.Close;
  telaDados.qryCompraItens.SQL.Clear;
  telaDados.qryCompraItens.SQL.Add('Select * from COMPRA_ITENS where ID_COMPRA = ');
  telaDados.qryCompraItens.SQL.Add(telaDados.qryCompras.FieldByName('ID').Value);
  telaDados.qryCompraItens.Open;


  {ShowMessage(telaDados.qryPedidos.FieldByName('ID').AsString);
  ShowMessage(telaDados.qryClientes.FieldByName('ID').AsString);
  ShowMessage(telaDados.qryClientes.FieldByName('Nome').AsString);}

  with telaDados.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    // Dados Principais
    Ide.cNF     := num;
    Ide.natOp   := telaDados.qryCompras.FieldByName('CFOP').AsString;
    Ide.indPag  := ipVista;
    Ide.modelo  := telaDados.qryCompras.FieldByName('MODELO').AsInteger; //Indicador de nota fiscal eletrônica;
    Ide.serie   := telaDados.qryCompras.FieldByName('NSERIE').AsInteger;  //Nfe = 1~999 (900~999 utilizado para emissão nacional)
    Ide.nNF     := telaDados.qryCompras.FieldByName('NNOTA').AsInteger;
    Ide.dEmi    := telaDados.qryCompras.FieldByName('DATA_COMPRA').AsDateTime;
    Ide.dSaiEnt := telaDados.qryCompras.FieldByName('DATA_ENTREGA').AsDateTime;
    Ide.tpNF    := tnEntrada;
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
    Emit.CNPJCPF := teladados.qryFornecedores.FieldByName('CNPJ_CPF').AsString;
    Emit.IE      := teladados.qryFornecedores.FieldByName('INSC_RG').AsString;
    Emit.IEST    := '';
    Emit.xNome   := teladados.qryFornecedores.FieldByName('NOME').AsString;
    Emit.xFant   := teladados.qryFornecedores.FieldByName('FANTASIA').AsString;
    Emit.IM      := '';
    Emit.CNAE    := '';
    Emit.EnderEmit.xLgr    := teladados.qryFornecedores.FieldByName('ENDERECO').AsString;
    Emit.EnderEmit.nro     := teladados.qryFornecedores.FieldByName('NUM_END').AsString;
    Emit.EnderEmit.xCpl    := teladados.qryFornecedores.FieldByName('COMPLEMENTO').AsString;
    Emit.EnderEmit.xBairro := teladados.qryFornecedores.FieldByName('BAIRRO_END').AsString;
    Emit.EnderEmit.cMun    := telaDados.pegaCodMun(telaDados.qryFornecedores.FieldByName('CIDADE_END').AsString,telaDados.qryFornecedores.FieldByName('UF_END').AsString);
    Emit.EnderEmit.xMun    := teladados.qryFornecedores.FieldByName('CIDADE_END').AsString;
    Emit.EnderEmit.UF      := teladados.qryFornecedores.FieldByName('UF_END').AsString;
    Emit.EnderEmit.CEP     := StrTOInt(teladados.qryFornecedores.FieldByName('CEP_END').AsString);
    Emit.EnderEmit.fone    := teladados.qryFornecedores.FieldByName('TELEFONE').AsString;
    Emit.EnderEmit.cPais   := 1058;
    Emit.EnderEmit.xPais   := 'BRASIL';
    // Destinatário
    Dest.CNPJCPF := telaDados.sCnpj;
    Dest.IE      := telaDados.sInscEst;
    Dest.ISUF    := '';
    Dest.xNome   := telaDados.sRazSoc;
    Dest.EnderDest.xLgr := telaDados.sEndereco;
    Dest.EnderDest.nro  := telaDados.sNum;
    Dest.EnderDest.xCpl := '';
    Dest.EnderDest.xBairro := telaDados.sBairro;
    Dest.EnderDest.cMun := StrToInt(telaDados.sCodMun);
    Dest.EnderDest.xMun := telaDados.sCidade;
    Dest.EnderDest.UF   := telaDados.sUf;
    Dest.EnderDest.CEP  := StrToInt(telaDados.sCep);
    Dest.EnderDest.cPais := 1058;
    Dest.EnderDest.xPais := 'BRASIL';
    Dest.EnderDest.fone  :=  telaDados.sTelefone;
    // Entrega
    Entrega.xLgr := telaDados.sEndereco;
    Entrega.nro  := telaDados.sNum;
    Entrega.xCpl := '';
    Entrega.xBairro := telaDados.sBairro;
    Entrega.cMun := StrToInt(telaDados.sCodMun);
    Entrega.xMun := telaDados.sCidade;
    Entrega.UF   := telaDados.sUf;
    // Itens das NFe
    aNumItem := 0;
    telaDados.tblCompraItens.Open;
    telaDados.tblCompraItens.First;
      while not telaDados.qryCompraItens.Eof do
      begin
        Inc(aNumItem);
        with Det.Add do
        begin
           
            telaDados.qryProdutos.Close;
            telaDados.qryProdutos.SQL.Clear;
            telaDados.qryProdutos.SQL.Add('Select * from PRODUTOS where ID =');
            telaDados.qryProdutos.SQL.Add(telaDados.qryCompraItens.FieldByName('ID_PRODUTO').AsString);
            telaDados.qryProdutos.Open;

          Prod.nItem := aNumItem;
          Prod.cProd := IntToStr(telaDados.qryCompraItens.FieldByName('ID_PRODUTO').AsInteger);
          Prod.cEAN  := telaDados.qryProdutos.FieldByName('EAN13').AsString;
          Prod.xProd := telaDados.qryCompraItens.FieldByName('DESCRICAO').AsString;
          Prod.NCM   := telaDados.qryProdutos.FieldByName('CODIGO_NCM').AsString;
          Prod.vProd := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsCurrency;
          Prod.EXTIPI := '';
          {if (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 0) or
             (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 1) or
             (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 2) or
             (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 4) then
            begin
             Prod.CFOP := '1102';
            end
            else if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 3 then
            begin
             Prod.CFOP := '1403';
            end; }
          Prod.vUnCom := telaDados.qryCompraItens.FieldByName('VALOR').AsCurrency;
          Prod.vUnTrib := telaDados.qryCompraItens.FieldByName('VALOR').AsCurrency;
          Prod.CFOP := telaDados.qryCompraItens.FieldByName('CFOP').AsString;
          Prod.uCom := telaDados.qryCompraItens.FieldByName('VALOR').AsString;
          Prod.qCom := telaDados.qryCompraItens.FieldByName('QUANTIDADE').AsFloat;
          Prod.cEANTrib := telaDados.qryProdutos.FieldByName('EAN13').AsString;
          Prod.uTrib := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
          Prod.vProd := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsCurrency;
          if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 0 then
            Prod.qTrib := telaDados.qryCompraItens.FieldByName('QUANTIDADE').AsFloat
          else
          Prod.uTrib := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
          Prod.qTrib := telaDados.qryCompraItens.FieldByName('QUANTIDADE').AsFloat;
          Prod.vFrete  := 0;
          Prod.vSeg    := 0;
          Prod.vDesc   := telaDados.qryCompraItens.FieldByName('DESCONTO').AsFloat;
          with Imposto do
          begin
            with ICMS do
            begin
              //if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=0 then
              //begin
            telaDados.qryCst.Close;
            telaDados.qryCst.SQL.Clear;
            telaDados.qryCst.SQL.Add('Select * from CST where ID=');
            telaDados.qryCst.SQL.Add(telaDados.qryProdutos.FieldByName('ID_CST').AsString);
            telaDados.qryCst.Open;

            telaDados.qryCSOSN.Close;
            telaDados.qryCSOSN.SQL.Clear;
            telaDados.qryCSOSN.SQL.Add('Select * from CSOSN where ID=');
            telaDados.qryCSOSN.SQL.Add(telaDados.qryProdutos.FieldByName('ID_CSOSN').AsString);
            telaDados.qryCSOSN.Open;

            case telaDados.qryCst.FieldByName('CODIGO').AsInteger of
            0 : CST := cst00;
            10 : CST := cst10;
            20 : CST := cst20;
            30 : CST := cst30;
            40 : CST := cst40;
            41 : CST := cst41;
            50 : CST := cst50;
            51 : CST := cst51;
            60 : CST := cst60;
            70 : CST := cst70;
            90 : CST := cst90;
            end;

            case telaDados.qryCsosn.FieldByName('CODIGO').AsInteger of
            101 : CSOSN := csosn101;
            102 : CSOSN := csosn102;
            103 : CSOSN := csosn103;
            201 : CSOSN := csosn201;
            202 : CSOSN := csosn202;
            203 : CSOSN := csosn203;
            300 : CSOSN := csosn300;
            400 : CSOSN := csosn400;
            500 : CSOSN := csosn500;
            900 : CSOSN := csosn900;
            end;
              //CST := cst00; // 0 - Tributado
              //CSOSN := csosn101;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := telaDados.qryCompraItens.FieldByName('BC_ICMS').asFloat;
              ICMS.pICMS    := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
              ICMS.vICMS    := (telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := telaDados.qryProdutos.FieldByName('BC_ICMSSUB').AsFloat;
              ICMS.pICMSST  := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMSSUB').AsFloat;
              ICMS.vICMSST  := telaDados.qryProdutos.FieldByName('VAL_ICMSSUB').AsFloat;
              ICMS.pRedBC   := 0;
              //end;
              {if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=3 then
              begin
              CST := cst60; // 0 - Sub.Tributária
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').asFloat;
              ICMS.pICMS    := 0;
              ICMS.vICMS    := 0;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := telaDados.tblProdutosALIQUOTA_ICMS.AsFloat;
              ICMS.vICMSST  := (telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
              ICMS.pRedBC   := 0;
              end;}
            end;
            //if (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=1) or
              //  (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=2) then
            //begin
            {with II do
            begin
                vBc := 0;
                vDespAdu := 0;
                vII := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').asFloat;
                vIOF := 0;
            end;}
            //end;
            //if (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=4) then
            //begin
            {with ISSQN do
            begin
                vBc       := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').asFloat;
                vAliq     := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
                vISSQN    := (telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
                cMunFG    := telaDados.pegaCodMun(telaDados.qryFornecedores.FieldByName('CIDADE_END').AsString, telaDados.qryFornecedores.FieldByName('UF_END').AsString);
                cListServ := '07.02';}
            //end;
            //end;

        end;
        telaDados.qryCompraItens.Next;
      end;
      // Informações finais de NFe
      Total.ICMSTot.vBC    := telaDados.qryCompras.FieldByName('BC_ICMS').AsFloat;
      Total.ICMSTot.vICMS  := telaDados.qryCompras.FieldByName('VAL_ICMS').AsFloat;
      Total.ICMSTot.vBCST  := telaDados.qryCompras.FieldByName('BC_ICMSSUB').AsFloat;
      //Total.ICMSTot.vST    := (telaDados.qryCompras.FieldByName('VAL_ICMSSUB').AsFloat * telaDados.qryCompras.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
      Total.ICMSTot.vST    := telaDados.qryCompras.FieldByName('VAL_ICMSSUB').AsFloat;
      Total.ICMSTot.vProd  := telaDados.qryCompras.FieldByName('Valor').asFloat;
      Total.ICMSTot.vFrete := 0;
      Total.ICMSTot.vSeg   := 0;
      Total.ICMSTot.vDesc  := telaDados.qryCompras.FieldByName('DESCONTO').AsFloat;
      Total.ICMSTot.vII    := 0;
      Total.ICMSTot.vIPI   := telaDados.qryCompras.FieldByName('VAL_IPI').AsFloat;
      Total.ICMSTot.vPIS   := telaDados.qryCompras.FieldByName('VAL_PIS').AsFloat;
      Total.ICMSTot.vCOFINS:= telaDados.qryCompras.FieldByName('VAL_COFINS').AsFloat;
      Total.ICMSTot.vOutro := 0;
      Total.ICMSTot.vNF    := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
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
      //Pagamento
      Pag.Add.tPag := fpDinheiro;
      Pag.Add.vPag := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
      //Cobrança
      Cobr.Fat.nFat  := telaDados.qryCompras.FieldByName('ID').AsString;
      Cobr.Fat.vOrig := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
      Cobr.Fat.vDesc := 0;
      Cobr.Fat.vLiq  := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
      {with Cobr.Dup.Add do
      begin
        nDup  := telaDados.qryCompras.FieldByName('ID').AsString;
        dVenc := telaDados.qryCompras.FieldByName('DATA_COMPRA').AsDateTime + 30;
        vDup  := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
      end;}
      //
      {with InfAdic.obsCont.Add do
      begin
        xCampo := '';
        xTexto := '';
      end;
      with InfAdic.obsFisco.Add do
      begin
        xCampo := '';
        xTexto := '';
      end;}
        infNFe.Versao := 4.00;
    end;

    // Comandos para gerar arquivo XML


    telaDados.ACBrNFe1.NotasFiscais.GerarNFe;
    telaDados.ACBrNFe1.NotasFiscais.Assinar;
    telaDados.ACBrNFe1.NotasFiscais.Validar;

    //telaDados.ACBrNFe1.Enviar(1,False,False,False); <- HABILITAR SEPARADAMENTE
    //ShowMessage('Mensagem: '+ telaDados.ACBrNFe1.WebServices.Retorno.xMsg);

    telaDados.ACBrNFe1.NotasFiscais.Items[0].GravarXML(telaDados.qryCompras.FieldByName('CHAVENFE').AsString+'.xml', ExtractFilePath(ParamStr(0))+'NFe\Entrada');
    //telaDados.ACBrNFe1.NotasFiscais.Assinar;
    ShowMessage('Arquivo Gerado em: '+ telaDados.ACBrNFe1.NotasFiscais.Items[0].NomeArq);
    if telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpEmis = TeDPEC then
    begin
    telaDados.ACBrNFe1.WebServices.Consulta.NFeChave := telaDados.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID;
    telaDados.ACBrNFe1.WebServices.Consulta.Executar;

    telaDados.ACBrNFe1.DANFE.Protocolo := telaDados.ACBrNFe1.WebServices.Consulta.Protocolo+''+
                                             DateTimeToStr(telaDados.ACBrNFe1.WebServices.Consulta.protNFe.dhRecbto)
  end;
  telaDados.ACBrNFe1.NotasFiscais.Imprimir;

  //telaDados.tblPedidosItens.Close;
  end;
end;

procedure TtelaGerarNfeEntrada.FormShow(Sender: TObject);
begin
  dtInicial.Date := Date;
  dtFinal.Date   := Date;
  telaDados.AtualizaConfigAcbr;
  edtDados.SetFocus;

  telaDados.qryCompras.Close;
  telaDados.qryCompras.SQL.Clear;
  telaDados.qryCompras.SQL.Add('select * from pedido where id = 0');
  telaDados.qryCompras.Open;
end;

procedure TtelaGerarNfeEntrada.DBGrid1DblClick(Sender: TObject);
var
num: integer;
begin

 num := DBGrid1.Columns.Items[0].Field.AsInteger;

  telaDados.tblCompras.Locate('ID', num , []);
  telaDados.tblFornecedores.Locate('ID', telaDados.tblComprasID_FORNECEDOR.Value, []);

  //telaDados.tblCompraItens.Locate('ID_COMPRA', telaDados.tblComprasID.Value,[]);
    telaDados.qryCompraItens.Close;
    telaDados.qryCompraItens.SQL.Clear;
    telaDados.qryCompraItens.SQL.Add('Select * from COMPRA_ITENS where ID_COMPRA =');
    telaDados.qryCompraItens.SQL.Add(telaDados.tblComprasID.AsString);
    telaDados.qryCompraItens.Open;

   telaDados.tblFornecedores.Edit;
   telaDados.tblCompras.Edit;
   telaDados.tblCompraItens.Edit;
   //telaDados.tblProdutos.Edit;
   //telaDados.cdsCTempItens.Edit;
   //telaDados.tblTransportadora.Edit;
   telaDados.qryCompraItens.First;
  while not (telaDados.qryCompraItens.Eof) do
  begin

    telaDados.cdsCTempItens.Append;

    telaDados.cdsCTempItens.FieldByName('DESCRICAO').Value :=
      telaDados.qryCompraItens.FieldByName('DESCRICAO').Value;

    telaDados.cdsCTempItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.qryCompraItens.FieldByName('ID_PRODUTO').Value;

    telaDados.cdsCTempItens.FieldByName('EAN13').Value :=
      telaDados.qryCompraItens.FieldByName('EAN13').Value;

    telaDados.cdsCTempItens.FieldByName('ID_COMPRA').Value :=
      telaDados.qryCompraItens.FieldByName('ID_COMPRA').Value;

    telaDados.cdsCTempItens.FieldByName('VALOR').Value :=
      telaDados.qryCompraItens.FieldByName('VALOR').Value;

    telaDados.cdsCTempItens.FieldByName('VALOR_TOTAL').Value :=
      telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').Value;

    telaDados.cdsCTempItens.FieldByName('QUANTIDADE').Value :=
      telaDados.qryCompraItens.FieldByName('QUANTIDADE').Value;

      telaDados.cdsCTempItens.FieldByName('CFOP').Value :=
    telaDados.qryCompraItens.FieldByName('CFOP').Value;

    telaDados.cdsCTempItens.FieldByName('BC_ICMS').Value :=
      telaDados.qryCompraItens.FieldByName('BC_ICMS').Value;

    telaDados.cdsCTempItens.FieldByName('BC_ICMSSUB').Value :=
      telaDados.qryCompraItens.FieldByName('BC_ICMSSUB').Value;

    telaDados.cdsCTempItens.FieldByName('BC_PIS').Value :=
      telaDados.qryCompraItens.FieldByName('BC_PIS').Value;

    telaDados.cdsCTempItens.FieldByName('BC_COFINS').Value :=
      telaDados.qryCompraItens.FieldByName('BC_COFINS').Value;

    telaDados.cdsCTempItens.FieldByName('BC_IPI').Value :=
      telaDados.qryCompraItens.FieldByName('BC_IPI').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_ICMS').Value :=
      telaDados.qryCompraItens.FieldByName('VAL_ICMS').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_ICMSSUB').Value :=
      telaDados.qryCompraItens.FieldByName('VAL_ICMSSUB').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_PIS').Value :=
      telaDados.qryCompraItens.FieldByName('VAL_PIS').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_COFINS').Value :=
      telaDados.qryCompraItens.FieldByName('VAL_COFINS').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_IPI').Value :=
      telaDados.qryCompraItens.FieldByName('VAL_IPI').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_ICMS').Value :=
      telaDados.qryCompraItens.FieldByName('ALIQUOTA_ICMS').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_ICMSSUB').Value :=
      telaDados.qryCompraItens.FieldByName('ALIQUOTA_ICMSSUB').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_PIS').Value :=
      telaDados.qryCompraItens.FieldByName('ALIQUOTA_PIS').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_COFINS').Value :=
      telaDados.qryCompraItens.FieldByName('ALIQUOTA_COFINS').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_IPI').Value :=
      telaDados.qryCompraItens.FieldByName('ALIQUOTA_IPI').Value;


    telaDados.tblProdutos.Locate('ID',telaDados.cdsTempItensIDPROD.Value,[]);
    telaDados.tblProdutos.Edit;
    telaDados.tblProdutosESTOQUE.Value := telaDados.tblProdutosEstoque.Value - telaDados.cdsCTempItensQUANTIDADE.Value;
    //telaDados.tblProdutos.Post;

   telaDados.cdsCTempItens.Post;
   telaDados.qryCompraItens.Next;

   end;

telaLancCompras.DBGrid1.Enabled := true;

telaLancCompras.editDtCad.Enabled := true;
telaLancCompras.editDtEmissao.Enabled := true;
telaLancCompras.editIdFornecedor.Enabled := true;
telaLancCompras.cbFornecedor.Enabled := true;

telaLancCompras.editDesc.Enabled := true;
telaLancCompras.editAsc.Enabled := true;
telaLancCompras.editOutrasDesp.Enabled := true;

telaLancCompras.editEemitente.Enabled := true;
telaLancCompras.editEendereco.Enabled := true;
telaLancCompras.editEnum.Enabled := true;
telaLancCompras.editEcompl.Enabled := true;
telaLancCompras.editEbairro.Enabled := true;
telaLancCompras.editEcidade.Enabled := true;
telaLancCompras.editEuf.Enabled := true;
telaLancCompras.editEcep.Enabled := true;
telaLancCompras.edtItem.Enabled := true;

telaLancCompras.edtIDesc.Enabled := true;
telaLancCompras.edtnNota.Enabled := true;
telaLancCompras.edtnSerie.Enabled := true;
telaLancCompras.edtCfop.Enabled := true;
telaLancCompras.edtChaveNfe.Enabled := true;
telaLancCompras.edtICfop.Enabled := true;
telaLancCompras.edtIEan.Enabled := true;
telaLancCompras.edtIVrUnit.Enabled := true;
telaLancCompras.edtIPcusto.Enabled := true;
telaLancCompras.edtIQtd.Enabled := true;
telaLancCompras.edtIMargem.Enabled := true;
telaLancCompras.edtIMargemP.Enabled := true;
telaLancCompras.edtIVenda.Enabled := true;
telaLancCompras.edtIVendaP.Enabled := true;
telaLancCompras.edtIBICMS.Enabled := true;
telaLancCompras.edtIBIpi.Enabled := true;
telaLancCompras.edtIBPis.Enabled := true;
telaLancCompras.edtIBIcmsSub.Enabled := true;
telaLancCompras.edtIBCofins.Enabled := true;
telaLancCompras.edtIVICMS.Enabled := true;
telaLancCompras.edtIVIpi.Enabled := true;
telaLancCompras.edtIVPis.Enabled := true;
telaLancCompras.edtIVIcmsSub.Enabled := true;
telaLancCompras.edtIVCofins.Enabled := true;
telaLancCompras.cbModelo.Enabled := true;
telaLancCompras.cbTDesc.Enabled := true;
telaLancCompras.cbVDesc.Enabled := true;

telaLancCompras.btnAddTransp.Enabled := true;
telaLancCompras.btnIncItem.Enabled := true;
telaLancCompras.btnExcItem.Enabled := true;
telaLancCompras.btnRetPed.Enabled := true;
telaLancCompras.btnFinPed.Enabled := true;

telaLancCompras.btnIncluir.Enabled := false;
telaLancCompras.btnConfirmar.Enabled := true;
telaLancCompras.btnCancelar.Enabled := true;
telaLancCompras.btnPesquisar.Enabled := false;

telaLancCompras.btnAddFor.Enabled := true;
telaLancCompras.btnConfirmProd.Enabled := true;

telaLancCompras.Incluir.Enabled := false;
telaLancCompras.Confirmar.Enabled := true;
telaLancCompras.Cancelar.Enabled := true;
telaLancCOmpras.Pesquisar.Enabled := false;

telaDados.tblProdutos.ClearFields;

telaGerarNfeEntrada.Hide;

end;

end.
