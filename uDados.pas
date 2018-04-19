unit uDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ACBrBase, ACBrDFe, ACBrNFe, pcnConversao, DB,
  IBDatabase, IBCustomDataSet, IBTable, StdCtrls, IBQuery, DBClient,
  DBLocal, DBLocalI, Provider, Math, ACBrDFeSSL, ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass, ACBrSocket, ACBrCEP, ACBrIBGE, IBUpdateSQL;

 type
  retornaEndereco = record
  cep : String;
  cidade : String;
  endereco : String;
  bairro : String;
  estado : String;
end;

type
  TtelaDados = class(TForm)
    ACBrNFe1: TACBrNFe;
    dsProdutos: TDataSource;
    tblProdutos: TIBTable;
    trnscProdutos: TIBTransaction;
    dbProdutos: TIBDatabase;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dsClientes: TDataSource;
    dsPedidos: TDataSource;
    tblClientes: TIBTable;
    tblPedidos: TIBTable;
    dbClientes: TIBDatabase;
    dbPedidos: TIBDatabase;
    trnscClientes: TIBTransaction;
    trnscPedidos: TIBTransaction;
    tblProdutosID: TIntegerField;
    tblProdutosDESCRICAO: TIBStringField;
    tblProdutosREFERENCIA: TIBStringField;
    tblProdutosEAN13: TIBStringField;
    tblProdutosDUN14: TIBStringField;
    tblProdutosGRUPO: TIntegerField;
    tblProdutosSUBGRUPO1: TIntegerField;
    tblProdutosSUBGRUPO2: TIntegerField;
    tblProdutosUNIDADE: TIBStringField;
    tblProdutosQUANT_CAIXA: TIBBCDField;
    tblProdutosALIQUOTA_ICMS: TIBBCDField;
    tblProdutosALIQUOTA_IPI: TIBBCDField;
    tblProdutosCLASSIFICACAO_FISCAL: TIntegerField;
    tblProdutosESTOQUE: TIBBCDField;
    tblProdutosPRECO_COMPRA: TIBBCDField;
    tblProdutosPRECO_VENDA: TIBBCDField;
    tblProdutosTIPOPROD: TIntegerField;
    tblProdutosPERC_DESC: TIBBCDField;
    tblProdutosPERC_COM: TIBBCDField;
    tblProdutosATIVO: TIBStringField;
    tblProdutosTIPO_PRODUTO: TIntegerField;
    tblProdutosMARGEM_LUCRO: TIBBCDField;
    tblProdutosCONTROLADOR_ESTOQUE: TIBStringField;
    tblProdutosTRIBUTACAO: TIntegerField;
    tblProdutosFRACIONADO: TIBStringField;
    tblProdutosCODIGO_NCM: TIBStringField;
    tblProdutosREDUCAO_BASE: TIBBCDField;
    tblProdutosBASE_ST: TIBBCDField;
    tblProdutosMVA: TIBBCDField;
    tblClientesID: TIntegerField;
    tblClientesNOME: TIBStringField;
    tblClientesENDERECO: TIBStringField;
    tblClientesNUM_END: TIBStringField;
    tblClientesBAIRRO_END: TIBStringField;
    tblClientesCIDADE_END: TIBStringField;
    tblClientesCEP_END: TIBStringField;
    tblClientesTELEFONE: TIBStringField;
    tblClientesCELULAR: TIBStringField;
    tblClientesCNPJ_CPF: TIBStringField;
    tblClientesINSC_RG: TIBStringField;
    tblClientesEND_ENTREGA: TIBStringField;
    tblClientesNUM_END_ENTREGA: TIBStringField;
    tblClientesBAIRRO_END_ENTREGA: TIBStringField;
    tblClientesCID_END_ENTREGA: TIBStringField;
    tblClientesCEP_END_ENTREGA: TIBStringField;
    tblClientesLOCAL_TRAB: TIBStringField;
    tblClientesEND_LOCAL_TRAB: TIBStringField;
    tblClientesTELEFONE_TRAB: TIBStringField;
    tblClientesFILIACAO_PAI: TIBStringField;
    tblClientesFILIACAO_MAE: TIBStringField;
    tblClientesDATA_CAD: TDateTimeField;
    tblClientesDATA_NASC: TDateTimeField;
    tblClientesLIMITE_CRED: TIBBCDField;
    tblClientesCONTATO: TIBStringField;
    tblClientesTIPO_CONTATO: TIBStringField;
    tblClientesATIVO: TIBStringField;
    tblClientesOBSERVACOES: TMemoField;
    tblClientesCOMPLEMENTO: TIBStringField;
    tblClientesCOMPL_ENT: TIBStringField;
    tblClientesUF_END: TIBStringField;
    tblClientesUF_END_ENT: TIBStringField;
    tblClientesSITE: TIBStringField;
    tblClientesEMAIL: TIBStringField;
    tblPedidosID: TIntegerField;
    tblPedidosID_CLIENTE: TIntegerField;
    tblPedidosID_VENDEDOR: TIntegerField;
    tblPedidosID_CLASSIFICACAO: TIntegerField;
    tblPedidosCONFIRMADA: TIBStringField;
    tblPedidosENTREGUE: TIBStringField;
    tblPedidosVALOR: TIBBCDField;
    tblPedidosDESCONTO: TIBBCDField;
    tblPedidosACRESCIMO: TIBBCDField;
    tblPedidosOUTRAS_DESPESAS: TIBBCDField;
    tblPedidosVALOR_TOTAL: TIBBCDField;
    tblPedidosCANCELADO: TIBStringField;
    tblPedidosID_FORMAPAG: TIntegerField;
    tblPedidosEND_ENTREGA: TIBStringField;
    tblPedidosNUM_END_ENTREGA: TIBStringField;
    tblPedidosCOMPL_END_ENTREGA: TIBStringField;
    tblPedidosBAIRRO_END_ENTREGA: TIBStringField;
    tblPedidosCID_END_ENTREGA: TIBStringField;
    tblPedidosUF_END_ENTREGA: TIBStringField;
    tblPedidosCEP_END_ENTREGA: TIBStringField;
    tblPedidosCLIENTE: TIBStringField;
    tblPedidosTIPODOC: TIntegerField;
    tblPedidosTIPO_PEDIDO: TIntegerField;
    tblPedidosVALOR_REAL: TIBBCDField;
    tblPedidosMARGEM_VENDA: TIBBCDField;
    tblPedidosVALOR_COMISSAO: TIBBCDField;
    tblPedidosTOTAL_GERAL: TIBBCDField;
    tblPedidosCOO: TIntegerField;
    tblPedidosCCF: TIntegerField;
    tblPedidosGNF: TIntegerField;
    tblPedidosDAV: TIBStringField;
    tblPedidosCNPJ_CPF: TIBStringField;
    tblPedidosINSC_EST: TIBStringField;
    tblPedidosVALOR_TROCO: TIBBCDField;
    dsPedidosItens: TDataSource;
    tblPedidosItens: TIBTable;
    trnscPedidosItens: TIBTransaction;
    Label4: TLabel;
    dbPedidosItens: TIBDatabase;
    tblPedidosItensID: TIntegerField;
    tblPedidosItensDESCRICAO: TIBStringField;
    tblPedidosItensQUANTIDADE: TIBBCDField;
    tblPedidosItensVALOR: TIBBCDField;
    tblPedidosItensDESCONTO: TIBBCDField;
    tblPedidosItensACRESCIMO: TIBBCDField;
    tblPedidosItensVALOR_TOTAL: TIBBCDField;
    tblPedidosItensMARGEM: TIBBCDField;
    tblPedidosItensVALOR_REAL: TIBBCDField;
    tblPedidosItensTIPOPROD: TIntegerField;
    tblPedidosItensCANCELADO: TIBStringField;
    tblPedidosItensNUM_ITEM: TIntegerField;
    tblPedidosItensEAN13: TIBStringField;
    qryProdutos: TIBQuery;
    Unidades: TLabel;
    dsUnidade: TDataSource;
    tblUnidade: TIBTable;
    dbUnidade: TIBDatabase;
    trnscUnidade: TIBTransaction;
    qryUnidade: TIBQuery;
    tblUnidadeSIGLA: TIBStringField;
    tblUnidadeNOME: TIBStringField;
    tblUnidadeID: TIntegerField;
    qryPedidosItens: TIBQuery;
    qryPedidos: TIBQuery;
    ibdsUnidade: TIBDataSet;
    ibdsClientes: TIBDataSet;
    ibdsProdutos: TIBDataSet;
    ibdsPedidosItens: TIBDataSet;
    tblPedidosItensID_PEDIDO: TIntegerField;
    tblPedidosItensID_PRODUTO: TIntegerField;
    tblPedidosnCli: TStringField;
    Label5: TLabel;
    dsTributos: TDataSource;
    dbTributos: TIBDatabase;
    tblTributos: TIBTable;
    trnscTributos: TIBTransaction;
    qryTributos: TIBQuery;
    tblTributosTIPOPROD: TIntegerField;
    tblTributosALIQUOTA_ICMS: TIBBCDField;
    tblTributosALIQUOTA_IPI: TIBBCDField;
    tblTributosBASE_ST: TIBBCDField;
    tblTributosREDUCAO_BASE: TIBBCDField;
    tblTributosMVA: TIBBCDField;
    tblTributosQUANT: TIntegerField;
    tblTributosVALOR: TIBBCDField;
    tblTributosVAL_ICMS: TIBBCDField;
    tblEmitente: TIBTable;
    dbEmitente: TIBDatabase;
    trnscEmitente: TIBTransaction;
    qryEmitente: TIBQuery;
    dsEmitente: TDataSource;
    Label6: TLabel;
    tblEmitenteID: TIntegerField;
    tblEmitenteRAZ_SOC: TIBStringField;
    tblEmitenteFANTASIA: TIBStringField;
    tblEmitenteCNPJ: TIBStringField;
    tblEmitenteINSCEST: TIBStringField;
    tblEmitenteENDERECO: TIBStringField;
    tblEmitenteNUMERO: TIBStringField;
    tblEmitenteBAIRRO: TIBStringField;
    tblEmitenteCEP: TIBStringField;
    tblEmitenteCIDADE: TIBStringField;
    tblEmitenteUF: TIBStringField;
    tblEmitenteTELEFONE: TIBStringField;
    tblEmitenteCODMUN: TIBStringField;
    ibdsEmitente: TIBDataSet;
    tblPedidosDATA_PEDIDO: TDateTimeField;
    tblPedidosDATA_ENTREGA: TDateTimeField;
    ibdsPedido: TIBDataSet;
    cdsTempItens: TClientDataSet;
    dspTempItens: TDataSetProvider;
    dsTempItens: TDataSource;
    cdsTempItensID: TIntegerField;
    cdsTempItensIDPROD: TIntegerField;
    cdsTempItensIDPED: TIntegerField;
    cdsTempItensDESC: TStringField;
    cdsTempItensQUANT: TIntegerField;
    cdsTempItensVALOR: TFloatField;
    cdsTempItensDESCONTO: TFloatField;
    cdsTempItensACRESCIMO: TFloatField;
    cdsTempItensVRT: TFloatField;
    cdsTempItensMARGEM: TFloatField;
    cdsTempItensVRR: TFloatField;
    cdsTempItensTIPOPROD: TIntegerField;
    cdsTempItensCANCELADO: TBooleanField;
    cdsTempItensNUM_ITEM: TIntegerField;
    cdsTempItensEAN13: TStringField;
    qryClientes: TIBQuery;
    dsNCMs: TDataSource;
    dspNCM: TDataSetProvider;
    cdsNCM: TClientDataSet;
    cdsNCMCodNCM: TStringField;
    cdsNCMCodCatNCM: TStringField;
    cdsNCMDescCatNCM: TStringField;
    cdsNCMDescNCM: TStringField;
    dsNCM: TDataSource;
    dbNCM: TIBDatabase;
    trnscNCM: TIBTransaction;
    tblNCM: TIBTable;
    tblNCMCODNCM: TIBStringField;
    tblNCMCODCATNCM: TIBStringField;
    tblNCMDESCCATNCM: TMemoField;
    tblNCMDESCNCM: TMemoField;
    dsPesClientes: TDataSource;
    dsPesProdutos: TDataSource;
    Label7: TLabel;
    Label8: TLabel;
    dsConta: TDataSource;
    tblConta: TIBTable;
    trnscConta: TIBTransaction;
    dbConta: TIBDatabase;
    qryConta: TIBQuery;
    tblContaID: TIntegerField;
    tblContaLOGIN: TIBStringField;
    tblContaSENHA: TIBStringField;
    dsPesPedidos: TDataSource;
    tblPedidosCHAVENFE: TIBStringField;
    tblEmitenteEMAIL: TIBStringField;
    tblProdutosVAL_ICMS: TIBBCDField;
    tblProdutosVAL_IPI: TIBBCDField;
    label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dsCompras: TDataSource;
    dsPesCompras: TDataSource;
    dsCompraItens: TDataSource;
    dsFornecedores: TDataSource;
    tblCompras: TIBTable;
    qryCompras: TIBQuery;
    trnscCompras: TIBTransaction;
    dbCompras: TIBDatabase;
    ibdsCompras: TIBDataSet;
    tblCompraItens: TIBTable;
    qryCompraItens: TIBQuery;
    dbCompraItens: TIBDatabase;
    trnscCompraItens: TIBTransaction;
    ibdsCompraItens: TIBDataSet;
    tblFornecedores: TIBTable;
    qryFornecedores: TIBQuery;
    dbFornecedores: TIBDatabase;
    trnscFornecedores: TIBTransaction;
    ibdsFornecedores: TIBDataSet;
    dsCTempItens: TDataSource;
    cdsCTempItens: TClientDataSet;
    dspCTempItens: TDataSetProvider;
    tblComprasID: TIntegerField;
    tblComprasID_FORNECEDOR: TIntegerField;
    tblComprasDATA_COMPRA: TDateTimeField;
    tblComprasDATA_ENTREGA: TDateTimeField;
    tblComprasID_CLASSIFICACAO: TIntegerField;
    tblComprasCONFIRMADA: TIBStringField;
    tblComprasENTREGUE: TIBStringField;
    tblComprasVALOR: TIBBCDField;
    tblComprasDESCONTO: TIBBCDField;
    tblComprasACRESCIO: TIBBCDField;
    tblComprasOUTRAS_DESPESAS: TIBBCDField;
    tblComprasVALOR_TOTAL: TIBBCDField;
    tblComprasCANCELADO: TIBStringField;
    tblComprasID_FORMAPAG: TIntegerField;
    tblComprasNUM_END_ENTREGA: TIBStringField;
    tblComprasCOMPL_END_ENTREGA: TIBStringField;
    tblComprasBAIRRO_END_ENTREGA: TIBStringField;
    tblComprasEND_ENTREGA: TIBStringField;
    tblComprasCID_END_ENTREGA: TIBStringField;
    tblComprasUF_END_ENTREGA: TIBStringField;
    tblComprasCEP_END_ENTREGA: TIBStringField;
    tblComprasFORNECEDOR: TIBStringField;
    tblComprasTIPODOC: TIntegerField;
    tblComprasTIPO_PEDIDO: TIntegerField;
    tblComprasVALOR_REAL: TIBBCDField;
    tblComprasMARGEM_VENDA: TIBBCDField;
    tblComprasVALOR_COMISSAO: TIBBCDField;
    tblComprasTOTAL_GERAL: TIBBCDField;
    tblComprasCOO: TIntegerField;
    tblComprasCCF: TIntegerField;
    tblComprasGNF: TIntegerField;
    tblComprasDAV: TIBStringField;
    tblComprasCNPJ_CPF: TIBStringField;
    tblComprasINSC_EST: TIBStringField;
    tblComprasVALOR_TROCO: TIBBCDField;
    tblComprasCHAVENFE: TIBStringField;
    tblCompraItensID: TIntegerField;
    tblCompraItensID_COMPRA: TIntegerField;
    tblCompraItensID_PRODUTO: TIntegerField;
    tblCompraItensDESCRICAO: TIBStringField;
    tblCompraItensQUANTIDADE: TIBBCDField;
    tblCompraItensVALOR: TIBBCDField;
    tblCompraItensDESCONTO: TIBBCDField;
    tblCompraItensACRESCIMO: TIBBCDField;
    tblCompraItensVALOR_TOTAL: TIBBCDField;
    tblCompraItensMARGEM: TIBBCDField;
    tblCompraItensVALOR_REAL: TIBBCDField;
    tblCompraItensTIPOPROD: TIntegerField;
    tblCompraItensCANCELADO: TIBStringField;
    tblCompraItensNUM_ITEM: TIntegerField;
    tblCompraItensEAN13: TIBStringField;
    tblFornecedoresID: TIntegerField;
    tblFornecedoresNOME: TIBStringField;
    tblFornecedoresENDERECO: TIBStringField;
    tblFornecedoresNUM_END: TIBStringField;
    tblFornecedoresBAIRRO_END: TIBStringField;
    tblFornecedoresCIDADE_END: TIBStringField;
    tblFornecedoresCEP_END: TIBStringField;
    tblFornecedoresTELEFONE: TIBStringField;
    tblFornecedoresTELEFONE2: TIBStringField;
    tblFornecedoresCNPJ_CPF: TIBStringField;
    tblFornecedoresINSC_RG: TIBStringField;
    tblFornecedoresUF_END: TIBStringField;
    tblFornecedoresEMAIL: TIBStringField;
    tblFornecedoresATIVO: TIBStringField;
    tblFornecedoresCOMPLEMENTO: TIBStringField;
    dsPesFor: TDataSource;
    tblEmitenteCOMPLEMENTO: TIBStringField;
    tblComprasnFor: TStringField;
    cdsCTempItensID: TIntegerField;
    cdsCTempItensID_COMPRA: TIntegerField;
    cdsCTempItensID_PRODUTO: TIntegerField;
    cdsCTempItensDESCRICAO: TStringField;
    cdsCTempItensQUANTIDADE: TBCDField;
    cdsCTempItensVALOR: TBCDField;
    cdsCTempItensDESCONTO: TBCDField;
    cdsCTempItensACRESCIMO: TBCDField;
    cdsCTempItensVALOR_TOTAL: TBCDField;
    cdsCTempItensMARGEM: TBCDField;
    cdsCTempItensVALOR_REAL: TBCDField;
    cdsCTempItensTIPOPROD: TIntegerField;
    cdsCTempItensCANCELADO: TStringField;
    cdsCTempItensNUM_ITEM: TIntegerField;
    cdsCTempItensEAN13: TStringField;
    cdsCTempItensibdsCompraItens: TDataSetField;
    cdsCTempItensqryCompraItens: TDataSetField;
    ACBrIBGE1: TACBrIBGE;
    Label12: TLabel;
    dsLogin: TDataSource;
    tblLogin: TIBTable;
    dbLogin: TIBDatabase;
    trnscLogin: TIBTransaction;
    qryLogin: TIBUpdateSQL;
    ibdsLogin: TIBDataSet;
    tblLoginID: TIntegerField;
    tblLoginLOGIN: TIBStringField;
    tblLoginSENHA: TIBStringField;
    tblLoginADM: TIntegerField;
    tblEmitenteID_LOGIN: TIntegerField;
    tblEmitenteREGIME: TIntegerField;
    tblEmitenteTIPOEMP: TIntegerField;
    dsCsosn: TDataSource;
    Label13: TLabel;
    tblCsosn: TIBTable;
    qryCsosn: TIBQuery;
    trnscCsosn: TIBTransaction;
    dbCsosn: TIBDatabase;
    tblProdutosCFOP: TIntegerField;
    tblProdutosID_CSOSN: TIntegerField;
    Label14: TLabel;
    dsCst: TDataSource;
    tblCst: TIBTable;
    trnscCst: TIBTransaction;
    dbCst: TIBDatabase;
    qryCst: TIBQuery;
    tblProdutosID_CST: TIntegerField;
    tblFornecedoresFANTASIA: TIBStringField;
    Label15: TLabel;
    dsEstados: TDataSource;
    trnscEstados: TIBTransaction;
    qryEstados: TIBQuery;
    dbEstados: TIBDatabase;
    tblEstados: TIBTable;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dsRuas: TDataSource;
    dsCidades: TDataSource;
    dsBairros: TDataSource;
    tblBairros: TIBTable;
    tblRuas: TIBTable;
    tblCidades: TIBTable;
    qryRuas: TIBQuery;
    qryBairros: TIBQuery;
    qryCidades: TIBQuery;
    dbCidades: TIBDatabase;
    dbRuas: TIBDatabase;
    dbBairros: TIBDatabase;
    trnscBairros: TIBTransaction;
    trnscRuas: TIBTransaction;
    trnscCidades: TIBTransaction;
    tblEstadosID: TIntegerField;
    tblEstadosESTADO: TIBStringField;
    tblEstadosUF: TIBStringField;
    tblEstadosIBGE_ESTADO: TIntegerField;
    tblRuasID: TIntegerField;
    tblRuasID_BAIRRO: TIntegerField;
    tblRuasRUA: TIBStringField;
    tblRuasCEP: TIntegerField;
    tblRuasTIPO: TIBStringField;
    tblCidadesID: TIntegerField;
    tblCidadesID_ESTADO: TIntegerField;
    tblCidadesCIDADE: TIBStringField;
    tblCidadesIBGE_CIDADE: TIntegerField;
    tblBairrosID: TIntegerField;
    tblBairrosID_CIDADES: TIntegerField;
    tblBairrosBAIRROS: TIBStringField;

  private
    { Private declarations }


  public
    { Public declarations }
    //Campos configurações ACBr
    sFormas, sAmbiente : Integer;
    sSalvarArq : Boolean;
    sCaminhoSchemas, sLogoMarca, sCaminhoArq, sCertificado, sSenha, sSerial,
    sRazSoc, sFantasia, sCnpj, sInscEst, sEndereco, sNum,
    sBairro, sCidade, sCep, sUf, sCodMun, sUfws, sHost,
    sPorta, sUsuario, sSenhaws, sTelefone, sEmailEmitente : String;
    sEHost, sEPorta, sEUsuario, sESenha : String;

    procedure LerArquivoIni;
    procedure GravaArquivoIni;
    procedure AtualizaConfigAcbr;
    procedure FormataCampos;
    procedure FormataCamposF;
    procedure FormataCamposJ;
    function verificaCpf(cpf:String) : boolean;
    function verificaCnpj(pCNPJ:String) : boolean;
    function pegaCodMun(cidade, uf:String) : Integer;

    procedure GravaChaveNFePedido(pChaveNFe, pNumPed : String);

    procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
    procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);

    function BuscarPorCep(cep: String) : retornaEndereco;
    //
  end;

  var
  telaDados: TtelaDados;



implementation

{$R *.dfm}

Function TtelaDados.verificaCnpj(pCNPJ:string):boolean;
var
  v: array[1..2] of Word;
  cnpj: array[1..14] of Byte;
  I: Byte;
begin
 try
    for I := 1 to 14 do
      cnpj[i] := StrToInt(pCNPJ[i]);
    //Nota: Calcula o primeiro dígito de verificação.
    v[1] := 5*cnpj[1] + 4*cnpj[2]  + 3*cnpj[3]  + 2*cnpj[4];
    v[1] := v[1] + 9*cnpj[5] + 8*cnpj[6]  + 7*cnpj[7]  + 6*cnpj[8];
    v[1] := v[1] + 5*cnpj[9] + 4*cnpj[10] + 3*cnpj[11] + 2*cnpj[12];
    v[1] := 11 - v[1] mod 11;
    v[1] := IfThen(v[1] >= 10, 0, v[1]);
    //Nota: Calcula o segundo dígito de verificação.
    v[2] := 6*cnpj[1] + 5*cnpj[2]  + 4*cnpj[3]  + 3*cnpj[4];
    v[2] := v[2] + 2*cnpj[5] + 9*cnpj[6]  + 8*cnpj[7]  + 7*cnpj[8];
    v[2] := v[2] + 6*cnpj[9] + 5*cnpj[10] + 4*cnpj[11] + 3*cnpj[12];
    v[2] := v[2] + 2*v[1];
    v[2] := 11 - v[2] mod 11;
    v[2] := IfThen(v[2] >= 10, 0, v[2]);
    //Nota: Verdadeiro se os dígitos de verificação são os esperados.
    Result := ((v[1] = cnpj[13]) and (v[2] = cnpj[14]));
  except on E: Exception do
    Result := False;
  end;

end;

Function TtelaDados.verificaCpf(cpf:string):boolean;
var i:integer;
    Want:char;
    Wvalid:boolean;
    Wdigit1,Wdigit2:integer;
begin
    Wdigit1:=0;
    Wdigit2:=0;
    Want:=cpf[1];//variavel para testar se o cpf é repetido como 111.111.111-11
   { Delete(cpf,ansipos('.',cpf),1);  //retira as mascaras se houver
    Delete(cpf,ansipos('.',cpf),1);
    Delete(cpf,ansipos('-',cpf),1); }

   //testar se o cpf é repetido como 111.111.111-11
   for i:=1 to length(cpf) do
     begin
       if cpf[i] <> Want then
         begin
            Wvalid:=true;  // se o cpf possui um digito diferente ele passou no primeiro teste
            break
         end;
     end;
       // se o cpf é composto por numeros repetido retorna falso
     if not Wvalid then
       begin
          result:=false;
          exit;
       end;

     //executa o calculo para o primeiro verificador
     for i:=1 to 9 do
       begin
          wdigit1:=Wdigit1+(strtoint(cpf[10-i])*(I+1));
       end;
        Wdigit1:= ((11 - (Wdigit1 mod 11))mod 11) mod 10;
        {formula do primeiro verificador
            soma=1°*2+2°*3+3°*4.. até 9°*10
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

         //verifica se o 1° digito confere
        if IntToStr(Wdigit1) <> cpf[10] then
          begin
             result:=false;
             exit;
          end;


         for i:=1 to 10 do
       begin
          wdigit2:=Wdigit2+(strtoint(cpf[11-i])*(I+1));
       end;
       Wdigit2:= ((11 - (Wdigit2 mod 11))mod 11) mod 10;
         {formula do segundo verificador
            soma=1°*2+2°*3+3°*4.. até 10°*11
            digito1 = 11 - soma mod 11
            se digito > 10 digito1 =0
          }

       // confere o 2° digito verificador
       if IntToStr(Wdigit2) <> cpf[11] then
          begin
             result:=false;
             exit;
          end;

   //se chegar até aqui o cpf é valido
   result:=true;
end;

procedure TtelaDados.GravaChaveNFePedido(pChaveNfe, pNumPed :String);
begin
    qryPedidos.Close;
    qryPedidos.SQL.Clear;
    qryPedidos.SQL.Add('update pedido set');
    qryPedidos.SQL.Add('CHAVENFE = :pChave');
    qryPedidos.SQL.Add('where PEDIDO_NUM = :pNumPed');
    qryPedidos.Params.ParamByName('pChave').AsString := pChaveNfe;
    qryPedidos.Params.ParamByName('pNumPed').AsString := pNumPed;
    qryPedidos.Open;
end;

procedure TtelaDados.FormataCamposF;
begin
  //Clientes
  tblClientesCNPJ_CPF.Clear;
  tblClientesINSC_RG.Clear;
  tblClientesCNPJ_CPF.EditMask         := '000.000.000-00;0';
  tblClientesINSC_RG.EditMask          := '0000000000-0;0';
end;

procedure TtelaDados.FormataCamposJ;
begin

  tblClientesCNPJ_CPF.Clear;
  tblClientesINSC_RG.Clear;
  tblClientesCNPJ_CPF.EditMask         := '00.000.000/0000-00;0';
  tblClientesINSC_RG.EditMask          := '00000000-0;0';

end;



procedure TtelaDados.FormataCampos;
begin
  // Clientes
  tblClientesDATA_CAD.DisplayFormat               := 'dd/mm/yyyy hh:mm:ss';
  tblClientes.FieldByName('DATA_CAD').EditMask    := '!99/99/0000 00:00:00;1; ';
  tblClientesDATA_NASC.DisplayFormat              := 'dd/mm/yyyy hh:mm:ss';
  tblClientes.FieldByName('DATA_NASC').EditMask   := '!99/99/0000 00:00:00;1; ';
  tblClientesLIMITE_CRED.DisplayFormat := 'R$ ,###,###,##0.00';
  tblClientesLIMITE_CRED.EditFormat    := 'R$ ,###,###,##0.00';
  tblClientesCNPJ_CPF.EditMask         := '000.000.000-00;0';
  tblClientesINSC_RG.EditMask          := '0000000000-0;0';
  tblClientesTELEFONE.EditMask         := '(00)0000-0000;0';
  tblClientesCELULAR.EditMask          := '(00)0-0000-0000;0';
  tblClientesTELEFONE_TRAB.EditMask    := '(00)0000-0000;0';
  tblClientesCEP_END.EditMask          := '00000-000;0';
  tblClientesCEP_END_ENTREGA.EditMask  := '00000-000;0';
  // Pedidos
  tblPedidosDATA_PEDIDO.DisplayFormat             := 'dd/mm/yyyy hh:mm:ss';
  tblPedidos.FieldByName('DATA_PEDIDO').EditMask  := '!99/99/0000 00:00:00;1; ';
  tblPedidosDATA_ENTREGA.DisplayFormat            := 'dd/mm/yyyy hh:mm:ss';
  tblPedidos.FieldByName('DATA_ENTREGA').EditMask := '!99/99/0000 00:00:00;1; ';
  {tblPedidosHORA_PEDIDO.DisplayFormat             := 'hh:mm';
  tblPedidosHORA_PEDIDO.EditMask                  := '';
  tblPedidosHORA_ENTREGA.DisplayFormat            := 'hh:mm';
  tblPedidosHORA_ENTREGA.EditMask                 := '';}
  tblPedidosVALOR.DisplayFormat           := '###,###,##0.00';
  tblPedidosVALOR.EditFormat              := '###,###,##0.00';
  tblPedidosDESCONTO.DisplayFormat        := '###,###,##0.00';
  tblPedidosDESCONTO.EditFormat           := '###,###,##0.00';
  tblPedidosACRESCIMO.DisplayFormat       := '###,###,##0.00';
  tblPedidosACRESCIMO.EditFormat          := '###,###,##0.00';
  tblPedidosOUTRAS_DESPESAS.DisplayFormat := '###,###,##0.00';
  tblPedidosOUTRAS_DESPESAS.EditFormat    := '###,###,##0.00';
  tblPedidosVALOR_TOTAL.DisplayFormat     := '###,###,##0.00';
  tblPedidosVALOR_TOTAL.EditFormat        := '###,###,##0.00';
  // Itens de pedido
  tblPedidosItensVALOR.DisplayFormat       := '###,###,##0.00';
  tblPedidosItensDESCONTO.DisplayFormat    := '###,###,##0.00';
  tblPedidosItensACRESCIMO.DisplayFormat   := '###,###,##0.00';
  tblPedidosItensVALOR_TOTAL.DisplayFormat := '###,###,##0.00';
  // produtos
  tblProdutosPRECO_COMPRA.DisplayFormat  := '###,###,##0.00';
  tblProdutosPRECO_VENDA.DisplayFormat   := '###,###,##0.00';
  tblProdutosBASE_ST.DisplayFormat       := '###,###,##0.00';
  tblProdutosALIQUOTA_ICMS.DisplayFormat := '##,##0.00';
  tblProdutosALIQUOTA_IPI.DisplayFormat  := '##,##0.00';
  tblProdutosMARGEM_LUCRO.DisplayFormat  := '##,##0.00';
  tblProdutosREDUCAO_BASE.DisplayFormat  := '##,##0.00';
  //Emitente
  tblEmitenteCEP.EditMask                := '00000-000;0';
  tblEmitenteTelefone.EditMask           := '(00)0000-0000;0';
  tblEmitenteCNPJ.EditMask               := '000.000.000-00;0';
  tblEmitenteINSCEST.EditMask            := '0000000000-0;0';
  //Fornecedor
  tblFornecedoresCEP_END.EditMask        := '00000-000;0';
  tblFornecedoresTELEFONE.EditMask       := '(00)0000-0000;0';
  tblFornecedoresTELEFONE2.EditMask      := '(00)0000-0000;0';
  tblFornecedoresCNPJ_CPF.EditMask       := '00.000.000/0000-00;0';
  tblFornecedoresINSC_RG.EditMask        := '00000000-0;0';
end;

procedure TtelaDados.AtualizaConfigAcbr;
var OK : Boolean;
begin

  LerArquivoIni;

  //Repassa dados para componente ACBrNFe
  {$IFDEF AcBrNFeOpenSSL}
    ACBrNFe1.configuracoes.Certificados.Certificado := sCertificado;
    ACBrNFe1.configuracoes.Certificados.Senha       := sSenha;
  {$ELSE}
    ACBrNFe1.configuracoes.Certificados.NumeroSerie := sSerial;
  {$ENDIF}
  //Geral
    ACBrNFe1.configuracoes.Geral.FormaEmissao       := StrToTpEmis(OK,IntToStr(sFormas));
    ACBrNFe1.Configuracoes.Geral.SSLLib             := libCapicom;
    ACBrNFe1.Configuracoes.Geral.SSLHttpLib         := httpOpenSSL;
  //Arquivos
    ACBrNFe1.configuracoes.Arquivos.Salvar          := sSalvarArq;
    ACBrNFe1.Configuracoes.Arquivos.PathSalvar      := sCaminhoArq;
    ACBrNFe1.Configuracoes.Arquivos.PathSchemas     := sCaminhoSchemas;
  //WebService
    ACBrNFe1.configuracoes.WebServices.UF           := sUfws;
    ACBrNFe1.configuracoes.WebServices.Ambiente     := StrToTpAmb(OK,IntToStr(sAmbiente));
    ACBrNFe1.configuracoes.WebServices.Visualizar   := true;
    ACBrNFe1.configuracoes.WebServices.ProxyHost    := sHost;
    ACBrNFe1.configuracoes.WebServices.ProxyPort    := sPorta;
    ACBrNFe1.configuracoes.WebServices.ProxyUser    := sUsuario;
    ACBrNFe1.configuracoes.WebServices.ProxyPass    := sSenhaws;
  //
    if ACBrNFe1.DANFE <> nil then
    begin
      ACBrNFe1.DANFE.TipoDANFE := StrToTpImp(OK,'1');
      ACBrNFe1.DANFE.Logo      := sLogoMarca;
    end;


end;

procedure TtelaDados.GravaArquivoIni;
var ArqINI : TIniFile;
begin

  ArqINI := TInifile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
  //GERAL
  ArqINI.WriteInteger('GERAL', 'FORMA_EMISSAO',sFormas);
  ArqINI.WriteString('GERAL', 'LOGOMARCA',sLogomarca);
  ArqINI.WriteBool('GERAL','SALVA_ARQUIVO',sSalvarArq);
  ArqINI.WriteString('GERAL','PATH_ARQUIVO',sCaminhoArq);
  ArqINI.WriteString('GERAL','PATH_SCHEMAS',sCaminhoSchemas);
  //
  //CERTIFICADO
  ArqINI.WriteString('CERTIFICADO','PATH_CERTIFICADO',sCertificado);
  ArqINI.WriteString('CERTIFICADO','SENHA', sSenha);
  ArqINI.WriteString('CERTIFICADO','NÚMERO DE SÉRIE', sSerial);
  //
  //EMITENTE
  if tblEmitente.State in [dsInsert] then begin
  tblEmitente.Post;
  end;
  ArqINI.WriteString('EMITENTE','RAZAO_SOCIAL',sRazSoc);
  ArqINI.WriteString('EMITENTE','NOME_FANTASIA',sFantasia);
  ArqINI.WriteString('EMITENTE','CNPJ', sCnpj);
  ArqINI.WriteString('EMITENTE','INSC_ESTADUAL', sInscEst);
  ArqINI.WriteString('EMITENTE','ENDERECO', sEndereco);
  ArqINI.WriteString('EMITENTE','NUMERO', sNum);
  ArqINI.WriteString('EMITENTE','BAIRRO', sBairro);
  ArqINI.WriteString('EMITENTE','CEP', sCep);
  ArqINI.WriteString('EMITENTE','CIDADE', sCidade);
  ArqINI.WriteString('EMITENTE','UF', sUf);
  ArqINI.WriteString('EMITENTE','TELEFONE', sTelefone);
  ArqINI.WriteString('EMITENTE','COD_MUNICIPIO', sCodMun);
  ArqINI.WriteString('EMITENTE','EMAIL', sEmailEmitente);
  //
  //WEBSERVICE
  ArqINI.WriteString('WS','UF', sUfws);
  ArqINI.WriteInteger('WS','AMBIENTE_DESTINO', sAmbiente);
  ArqINI.WriteString('WS','HOST', sHost);
  ArqINI.WriteString('WS','PORTA', sPorta);
  ArqINI.WriteString('WS','USUARIO', sUsuario);
  ArqINI.WriteString('WS','SENHA', sSenhaws);
  //Email
  ArqINI.WriteString('Email','Host', sEHost);
  ArqINI.WriteString('Email','Porta', sEPorta);
  ArqINI.WriteString('Email','Usuário', sEUsuario);
  ArqINI.WriteString('Email','Senha', sESenha);
  //
  ArqINI.Free;


end;

procedure TtelaDados.LerArquivoIni;
var ArqINI : TIniFile;
begin
  ArqINI := TInifile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
 //GERAL
  sFormas          := ArqINI.ReadInteger('GERAL', 'FORMA_EMISSAO',0);
  sLogomarca       := ArqINI.ReadString('GERAL', 'LOGOMARCA','C:\logo.jpg');
  sSalvarArq       := ArqINI.ReadBool('GERAL','SALVA_ARQUIVO', true);
  sCaminhoArq      := ArqINI.ReadString('GERAL','PATH_ARQUIVO','C:\');
  sCaminhoSchemas  := ArqINI.ReadString('GERAL','PATH_SCHEMAS','C:\');
  //CERTIFICADO
  sCertificado     := ArqINI.ReadString('CERTIFICADO','PATH_CERTIFICADO','C:\');
  sSenha           := ArqINI.ReadString('CERTIFICADO','SENHA', '');
  sSerial          := ArqINI.ReadString('CERTIFICADO','NÚMERO DE SÉRIE', '');
  //EMITENTE
  tblEmitente.Open;
  tblEmitente.Last;
  sRazSoc          := telaDados.tblEmitenteRAZ_SOC.AsString;
  sFantasia        := telaDados.tblEmitenteFANTASIA.AsString;
  sCnpj            := telaDados.tblEmitenteCNPJ.AsString;
  sInscEst         := telaDados.tblEmitenteINSCEST.AsString;
  sEndereco        := telaDados.tblEmitenteENDERECO.AsString;
  sNum             := telaDados.tblEmitenteNUMERO.AsString;
  sBairro          := telaDados.tblEmitenteBAIRRO.AsString;
  sCep             := telaDados.tblEmitenteCEP.AsString;
  sCidade          := telaDados.tblEmitenteCIDADE.AsString;
  sUf              := telaDados.tblEmitenteUF.AsString;
  sTelefone        := telaDados.tblEmitenteTELEFONE.AsString;
  sCodMun          := telaDados.tblEmitenteCODMUN.AsString;
  sEmailEmitente   := telaDados.tblEmitenteEMAIL.AsString;
  tblEmitente.Close;
  //WEBSERVICE
  sUfws            := ArqINI.ReadString('WS','UF', '');
  sAmbiente        := ArqINI.ReadInteger('WS','AMBIENTE_DESTINO', 0);
  sHost            := ArqINI.ReadString('WS','HOST', '');
  sPorta           := ArqINI.ReadString('WS','PORTA', '');
  sUsuario         := ArqINI.ReadString('WS','USUARIO', '');
  sSenhaws         := ArqINI.ReadString('WS','SENHA', '');
  //Email
  sEHost           := ArqINI.ReadString('Email','Host', '');
  sEPorta          := ArqINI.ReadString('Email','Porta', '');
  sEUsuario        := ArqINI.ReadString('Email','Usuário', '');
  sESenha          := ArqINI.ReadString('Email','Senha', '');
  //
  ArqINI.Free;

end;

procedure TtelaDados.GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
const
  TabelaA: array[0..9] of string[7] = ('0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011');
  TabelaB: array[0..9] of string[7] = ('0100111', '0110011', '0011011', '0011011', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111');
  TabelaC: array[0..9] of string[7] = ('1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100');
  TabAux: array[0..9] of string[6] = ('AAAAAA', 'AABABB', 'AABBAB', 'AABBBA', 'ABAABB', 'ABBAAB', 'ABBBAA', 'ABABAB', 'ABABBA', 'ABBABA');
var
  Codigo: string;
  Formato: string;
  PegaDaTabela: string;
  DecimoTerceiroDig: Byte;
  Cont: Byte;
begin
  Formato := '';
  Codigo := CodBarras;
  DecimoTerceiroDig := StrToIntDef(CodBarras[1], 0);
  {----------------------------------------------------------------------------}
  { Tendo o 13º dígito definido, posso definir o padrão de impressão das barras}
  { no primeiro conjunto de 6 dígitos baseado na tabela Auxiliar. }
  {----------------------------------------------------------------------------}
  PegaDaTabela := TabAux[DecimoTerceiroDig] + 'CCCCCC';
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Esquerda'
  for Cont := 1 to Length(PegaDaTabela) do
  begin

    case PegaDaTabela[Cont] of
      'A': Formato := Formato + TabelaA[StrToInt(Codigo[Cont + 1])];
      'B': Formato := Formato + TabelaB[StrToInt(Codigo[Cont + 1])];
      'C': Formato := Formato + TabelaC[StrToInt(Codigo[Cont + 1])];
    end;

    if Cont = 6 then
      Formato := Formato + '01010'; //--> Barra Auxiliar de Guarda 'Central'

  end;
  Formato := Formato + '101'; //--> Barra Auxiliar de Guarda 'Direita'

  //------ Desenha o código alfa-numérico na imagem
  Imagem.Font.Size := 10;
  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  Imagem.TextOut(02, 51, Copy(CodBarras, 01, 01));
  Imagem.TextOut(13, 51, Copy(CodBarras, 02, 06));
  Imagem.TextOut(60, 51, Copy(CodBarras, 08, 06));
  //------ Desenha as barras na imagem
  DesenhaBarras(Formato, Imagem);
end;

procedure TtelaDados.DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
var
  X, Y, H: LongInt;
  A, B, C, D: TPoint;
  I: Boolean;
begin

  Imagem.Brush.Color := ClWhite;
  Imagem.Pen.Color := ClBlack;
  x := 10;
  i := True;
  for y := 1 to Length(SequenciaHexa) do
  begin
    if SequenciaHexa[y] = '0' then
      Imagem.Pen.Color := ClWhite
    else
      Imagem.Pen.Color := ClBlack;
    h := 1;
    a.x := x;
    a.y := 0;
    b.x := x;
    b.y := 50;
    c.x := x + h - 1;
    c.y := 50;
    d.x := x + h - 1;
    d.y := 0;
    case Y of
      1..3, 46..50, 93..95:
        begin
          b.y := 55;
          c.y := 55;
        end;
    end;
    Imagem.Polygon([A, B, C, D]);
    i := not (i);
    x := x + h;
  end;

end;





{ TtelaDados }




function TtelaDados.pegaCodMun(cidade, uf: String): Integer;
begin
ACBrIBGE1.BuscarPorNome(cidade,uf,true);

result := ACBrIBGE1.Cidades[0].CodMunicipio;

end;

function TtelaDados.BuscarPorCep(cep: String): retornaEndereco;
begin
    qryRuas.Close;
    qryRuas.SQL.Clear;
    qryRuas.SQL.Add('Select * from RUAS where cep like :pDados');
    qryRuas.Params.ParamByName('pDados').asString := cep;
    qryRuas.Open;

    qryBairros.Close;
    qryBairros.SQL.Clear;
    qryBairros.SQL.Add('Select * from BAIRROS where ID = ');
    qryBairros.SQL.Add(qryRuas.FieldByName('ID_BAIRRO').Value);
    qryBairros.Open;

    qryCidades.Close;
    qryCidades.SQL.Clear;
    qryCidades.SQL.Add('Select * from CIDADES where ID = ');
    qryCidades.SQL.Add(qryBairros.FieldByName('ID_CIDADES').Value);
    qryCidades.Open;

    qryEstados.Close;
    qryEstados.SQL.Clear;
    qryEstados.SQL.Add('Select * from ESTADOS where ID = ');
    qryEstados.SQL.Add(qryCidades.FieldByName('ID_ESTADO').Value);
    qryEstados.Open;

Result.cep := qryRuas.FieldByName('CEP').AsString;
Result.endereco := Utf8ToAnsi(qryRuas.FieldByName('RUA').AsString);
Result.cidade := qryCidades.FieldByName('CIDADE').AsString;
Result.bairro := qryBairros.FieldByName('BAIRROS').AsString;
Result.estado := qryEstados.FieldByName('ESTADO').AsString;


end;


end.
