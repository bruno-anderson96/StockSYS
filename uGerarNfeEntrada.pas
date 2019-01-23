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
    //Par�metros
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
    MessageDlg('� necess�rio selecionar a compra!', mtWarning, [mbOK], 0);
    Abort;
  end;
  telaDados.ACBrNFe1.NotasFiscais.Clear;
  //
  num := DBGrid1.Columns.Items[1].Field.AsInteger;
 
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
  telaDados.qryCompraItens.SQL.Add('Select * from COMPRA_ITENS where id = ');
  telaDados.qryCompraItens.SQL.Add(telaDados.qryCompras.FieldByName('ID').Value);
  telaDados.qryCompraItens.Open;


  {ShowMessage(telaDados.qryPedidos.FieldByName('ID').AsString);
  ShowMessage(telaDados.qryClientes.FieldByName('ID').AsString);
  ShowMessage(telaDados.qryClientes.FieldByName('Nome').AsString);}

  with telaDados.ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    // Dados Principais
    Ide.cNF     := num;
    Ide.natOp   := '1102';
    Ide.indPag  := ipVista;
    Ide.modelo  := 55; //Indicador de nota fiscal eletr�nica;
    Ide.serie   := 1;  //Nfe = 1~999 (900~999 utilizado para emiss�o nacional)
    Ide.nNF     := num;
    Ide.dEmi    := Date;
    Ide.dSaiEnt := Date;
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
    Emit.xFant   := '';
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
    // Destinat�rio
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
    Entrega.xLgr := telaDados.qryEmitente.FieldByName('ENDERECO').AsString;
    Entrega.nro  := telaDados.qryEmitente.FieldByName('NUMERO').AsString;
    Entrega.xCpl := telaDados.qryEmitente.FieldByName('COMPLEMENTO').AsString;
    Entrega.xBairro := telaDados.qryEmitente.FieldByName('BAIRRO').AsString;
    Entrega.cMun := telaDados.qryEmitente.FieldByName('CODMUN').AsInteger;
    Entrega.xMun := telaDados.qryEmitente.FieldByName('CIDADE').AsString;
    Entrega.UF   := telaDados.qryEmitente.FieldByName('UF').AsString;
    // Itens das NFe
    aNumItem := 0;
    telaDados.tblCompraItens.Open;
    telaDados.tblCompraItens.First;
      while not telaDados.qryCompraItens.Eof do
      begin
        Inc(aNumItem);
        with Det.Add do
        begin
          Prod.nItem := aNumItem;
          Prod.cProd := IntToStr(telaDados.qryCompraItens.FieldByName('ID_PRODUTO').AsInteger);
          Prod.cEAN  := telaDados.qryCompraItens.FieldByName('EAN13').AsString;
          Prod.xProd := telaDados.qryCompraItens.FieldByName('DESCRICAO').AsString;
          Prod.NCM   := telaDados.qryProdutos.FIeldByName('CODIGO_NCM').AsString;
          Prod.EXTIPI := '';
          if (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 0) or
             (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 1) or
             (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 2) or
             (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 4) then
            begin
             Prod.CFOP := '1102';
            end
            else if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 3 then
            begin
             Prod.CFOP := '1403';
            end;
          Prod.uCom := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
          Prod.qCom := telaDados.qryCompraItens.FieldByName('QUANTIDADE').AsFloat;
          Prod.cEANTrib := '';
          Prod.uTrib := telaDados.qryProdutos.FieldByName('UNIDADE').AsString;
          if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger = 0 then
            Prod.qTrib := telaDados.qryCompraItens.FieldByName('QUANTIDADE').AsFloat
          else
          Prod.qTrib := 0;
          Prod.vFrete  := 0;
          Prod.vSeg    := 0;
          Prod.vDesc   := telaDados.qryCompraItens.FieldByName('DESCONTO').AsFloat;
          with Imposto do
          begin
            with ICMS do
            begin
              if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=0 then
              begin
              CST := cst00; // 0 - Tributado
              CSOSN := csosn101;
              ICMS.orig     := oeNacional;
              ICMS.modBC    := dbiValorOperacao;
              ICMS.vBC      := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').asFloat;
              ICMS.pICMS    := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
              ICMS.vICMS    := (telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
              ICMS.modBCST  := dbisMargemValorAgregado;
              ICMS.pMVAST   := 0;
              ICMS.pRedBCST := 0;
              ICMS.vBCST    := 0;
              ICMS.pICMSST  := 0;
              ICMS.vICMSST  := 0;
              ICMS.pRedBC   := 0;
              end;
              if telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=3 then
              begin
              CST := cst60; // 0 - Sub.Tribut�ria
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
              end;
            end;
            if (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=1) or
                (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=2) then
            begin
            with II do
            begin
                vBc := 0;
                vDespAdu := 0;
                vII := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').asFloat;
                vIOF := 0;
            end;
            end;
            if (telaDados.qryCompraItens.FieldByName('TIPOPROD').AsInteger=4) then
            begin
            with ISSQN do
            begin
                vBc       := telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').asFloat;
                vAliq     := telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat;
                vISSQN    := (telaDados.qryCompraItens.FieldByName('VALOR_TOTAL').AsFloat * telaDados.qryProdutos.FieldByName('ALIQUOTA_ICMS').AsFloat)/ 100;
                cMunFG    := 0;
                cListServ := '0';
            end;
            end;
         
        end;
        telaDados.qryCompraItens.Next;
      end;
      // Informa��es finais de NFe
      Total.ICMSTot.vBC    := telaDados.qryTributos.FieldByName('VALOR').AsFloat;
      Total.ICMSTot.vICMS  := telaDados.qryTributos.FieldByName('VAL_ICMS').AsFloat;
      Total.ICMSTot.vBCST  := telaDados.qryTributos.FieldByName('BASE_ST').AsFloat;
      Total.ICMSTot.vST    := (telaDados.qryTributos.FieldByName('BASE_ST').AsFloat * telaDados.qryTributos.FieldByName('ALIQUOTA_ICMS').AsFloat) / 100;
      Total.ICMSTot.vProd  := telaDados.qryCompras.FieldByName('Valor').asFloat;
      Total.ICMSTot.vFrete := 0;
      Total.ICMSTot.vSeg   := 0;
      Total.ICMSTot.vDesc  := telaDados.qryCompras.FieldByName('DESCONTO').AsFloat;
      Total.ICMSTot.vII    := 0;
      Total.ICMSTot.vIPI   := 0;
      Total.ICMSTot.vPIS   := 0;
      Total.ICMSTot.vCOFINS:= 0;
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
      //Cobran�a
      Cobr.Fat.nFat  := telaDados.qryCompras.FieldByName('ID').AsString;
      Cobr.Fat.vOrig := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
      Cobr.Fat.vDesc := 0;
      Cobr.Fat.vLiq  := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
      with Cobr.Dup.Add do
      begin
        nDup  := telaDados.qryCompras.FieldByName('ID').AsString;
        dVenc := telaDados.qryCompras.FieldByName('DATA_COMPRA').AsDateTime + 30;
        vDup  := telaDados.qryCompras.FieldByName('VALOR_TOTAL').AsFloat;
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
 num := DBGrid1.Columns.Items[1].Field.AsInteger;

  telaDados.tblCompras.Locate('ID', num , []);
  telaDados.tblFornecedores.Locate('ID', telaDados.tblComprasID_FORNECEDOR.Value, []);

  telaDados.tblCompraItens.Locate('ID', telaDados.tblCompraItensID_COMPRA.Value,[]);

  telaDados.tblCompraItens.First;
  while not (telaDados.tblCompraItens.Eof) do
  begin

    telaDados.cdsCTempItens.Append;

    telaDados.cdsCTempItens.FieldByName('DESCRICAO').Value :=
      telaDados.tblCompraItens.FieldByName('DESCRICAO').Value;

    telaDados.cdsCTempItens.FieldByName('ID_PRODUTO').Value :=
      telaDados.tblCompraItens.FieldByName('ID_PRODUTO').Value;

    telaDados.cdsCTempItens.FieldByName('ID_COMPRA').Value :=
      telaDados.tblCompraItens.FieldByName('ID_COMPRA').Value;

    telaDados.cdsCTempItens.FieldByName('VALOR').Value :=
      telaDados.tblCompraItens.FieldByName('VALOR').Value;

    telaDados.cdsCTempItens.FieldByName('QUANTIDADE').Value :=
      telaDados.tblCompraItens.FieldByName('QUANTIDADE').Value;

    {telaDados.cdsCTempItens.FieldByName('BC_ICMS').Value :=
      telaDados.tblCompraItens.FieldByName('BC_ICMS').Value;

    telaDados.cdsCTempItens.FieldByName('BC_ICMSSUB').Value :=
      telaDados.tblCompraItens.FieldByName('BC_ICMSSUB').Value;

    telaDados.cdsCTempItens.FieldByName('BC_PIS').Value :=
      telaDados.tblCompraItens.FieldByName('BC_PIS').Value;

    telaDados.cdsCTempItens.FieldByName('BC_COFINS').Value :=
      telaDados.tblCompraItens.FieldByName('BC_COFINS').Value;

    telaDados.cdsCTempItens.FieldByName('BC_IPI').Value :=
      telaDados.tblCompraItens.FieldByName('BC_IPI').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_ICMS').Value :=
      telaDados.tblCompraItens.FieldByName('VAL_ICMS').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_ICMSSUB').Value :=
      telaDados.tblCompraItens.FieldByName('VAL_ICMSSUB').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_PIS').Value :=
      telaDados.tblCompraItens.FieldByName('VAL_PIS').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_COFINS').Value :=
      telaDados.tblCompraItens.FieldByName('VAL_COFINS').Value;

    telaDados.cdsCTempItens.FieldByName('VAL_IPI').Value :=
      telaDados.tblCompraItens.FieldByName('VAL_IPI').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_ICMS').Value :=
      telaDados.tblCompraItens.FieldByName('ALIQUOTA_ICMS').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_ICMSSUB').Value :=
      telaDados.tblCompraItens.FieldByName('ALIQUOTA_ICMSSUB').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_PIS').Value :=
      telaDados.tblCompraItens.FieldByName('ALIQUOTA_PIS').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_COFINS').Value :=
      telaDados.tblCompraItens.FieldByName('ALIQUOTA_COFINS').Value;

    telaDados.cdsCTempItens.FieldByName('ALIQUOTA_IPI').Value :=
      telaDados.tblCompraItens.FieldByName('ALIQUOTA_IPI').Value;
      }
   telaDados.cdsCTempItens.Post;
   telaDados.tblCompraItens.Next;

   end;


end;

end.
