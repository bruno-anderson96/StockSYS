unit uDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, ACBrBase, ACBrDFe, ACBrNFe, pcnConversao, DB,
  IBDatabase, IBCustomDataSet, IBTable, StdCtrls, IBQuery, DBClient,
  DBLocal, DBLocalI, Provider, Math, ACBrDFeSSL, ACBrNFeDANFEClass,
  ACBrNFeDANFeRLClass, ACBrSocket, ACBrCEP, ACBrIBGE, IBUpdateSQL, FMTBcd,
  SqlExpr, ACBrIntegrador, StrUtils, ACBrDFeReport, ACBrDFeDANFeReport;

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
    esto: TIntegerField;
    tblProdutosSUBGRUPO1: TIntegerField;
    tblProdutosSUBGRUPO2: TIntegerField;
    tblProdutosUNIDADE: TIBStringField;
    tblProdutosQUANT_CAIXA: TIBBCDField;
    tblProdutosALIQUOTA_ICMS: TIBBCDField;
    tblProdutosALIQUOTA_IPI: TIBBCDField;
    tblProdutosCLASSIFICACAO_FISCAL: TIntegerField;
    tblProdutosPRECO_COMPRA: TIBBCDField;
    tblProdutosPRECO_VENDA: TIBBCDField;
    tblProdutosTIPOPROD: TIntegerField;
    tblProdutosPERC_DESC: TIBBCDField;
    tblProdutosPERC_COM: TIBBCDField;
    tblProdutosATIVO: TIBStringField;
    tblProdutosTIPO_PRODUTO: TIntegerField;
    tblProdutosMARGEM_LUCRO: TIBBCDField;
    tblProdutosCONTROLADOR_ESTOQUE: TIBStringField;
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
    trnscTributos: TIBTransaction;
    qryTributos: TIBQuery;
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
    cdsTempItensVRR: TFloatField;
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
    dspCTempItens: TDataSetProvider;
    tblComprasID_FORNECEDOR: TIntegerField;
    tblComprasDATA_COMPRA: TDateTimeField;
    tblComprasDATA_ENTREGA: TDateTimeField;
    tblComprasID_CLASSIFICACAO: TIntegerField;
    tblComprasCONFIRMADA: TIBStringField;
    tblComprasENTREGUE: TIBStringField;
    tblComprasVALOR: TIBBCDField;
    tblComprasDESCONTO: TIBBCDField;
    tblComprasACRESCIMO: TIBBCDField;
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
    Label12: TLabel;
    dsLogin: TDataSource;
    tblLogin: TIBTable;
    dbLogin: TIBDatabase;
    trnscLogin: TIBTransaction;
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
    Label16: TLabel;
    dsEstoque: TDataSource;
    qryEstoque: TIBQuery;
    tblEstoque: TIBTable;
    dbEstoque: TIBDatabase;
    trnscEstoque: TIBTransaction;
    IBDataSet1: TIBDataSet;
    tblEstoqueID: TIntegerField;
    tblEstoqueID_PRODUTO: TIntegerField;
    tblEstoqueQUANTIDADE: TIntegerField;
    tblEstoqueDATA: TDateTimeField;
    tblEstoqueTIPO: TIBStringField;
    qryLogin: TIBQuery;
    qryLoginID: TIntegerField;
    qryLoginLOGIN: TIBStringField;
    qryLoginSENHA: TIBStringField;
    qryLoginADM: TIntegerField;
    tblProdutosESTOQUE: TIntegerField;
    tblCstID: TIntegerField;
    tblCstCODIGO: TIntegerField;
    tblCstDESCRICAO: TIBStringField;
    tblCsosnID: TIntegerField;
    tblCsosnCODIGO: TIntegerField;
    tblCsosnDESCRICAO: TMemoField;
    tblPedidosCHAVECFE: TIBStringField;
    tblPedidosIDPAGAMENTO: TIntegerField;
    CIDADES: TLabel;
    qryPagamentos: TIBQuery;
    dbPagamentos: TIBDatabase;
    tblPagamento: TIBTable;
    trnscPagamento: TIBTransaction;
    dsPagamentos: TDataSource;
    tblPagamentoID: TIntegerField;
    tblPagamentoCODAUT: TIBStringField;
    tblPagamentoINSTFIN: TIBStringField;
    tblPagamentoDONOCARTAO: TIBStringField;
    tblPagamentoPARCELAS: TIntegerField;
    tblPagamentoQTRDIG: TIntegerField;
    tblPagamentoCODPAG: TIBStringField;
    tblPagamentoVRPAG: TIBBCDField;
    tblPagamentoIDRESPFISC: TIntegerField;
    tblPedidosPATH: TIBStringField;
    tblPedidosSTATUS: TIBStringField;
    Label20: TLabel;
    dsContador: TDataSource;
    tblContador: TIBTable;
    qryContador: TIBQuery;
    trnscContador: TIBTransaction;
    dbContador: TIBDatabase;
    tblContadorID: TIntegerField;
    tblContadorNOME: TIBStringField;
    tblContadorENDERECO: TIBStringField;
    tblContadorNUM: TIBStringField;
    tblContadorCOMPL: TIBStringField;
    tblContadorBAIRRO: TIBStringField;
    tblContadorEMAIL: TIBStringField;
    tblContadorCNPJ: TIBStringField;
    tblContadorCEP: TIBStringField;
    tblContadorCOD_MUN: TIBStringField;
    tblContadorCPF: TIBStringField;
    tblContadorCELULAR: TIBStringField;
    tblContadorCELULAR2: TIBStringField;
    ibdsContador: TIBDataSet;
    tblContadorCIDADE: TIBStringField;
    tblContadorUF: TIBStringField;
    tblContadorID_LOGIN: TIntegerField;
    Label21: TLabel;
    dsOrigem: TDataSource;
    tblOrigem: TIBTable;
    qryOrigem: TIBQuery;
    trnscOrigem: TIBTransaction;
    dbOrigem: TIBDatabase;
    tblOrigemID: TIntegerField;
    tblOrigemCODIGO: TIntegerField;
    tblProdutosPRECO_VENDAP: TIBBCDField;
    tblProdutosMARGEM_LUCROP: TIBBCDField;
    tblOrigemDESCRICAO: TIBStringField;
    labelibpt: TLabel;
    dsIbpt: TDataSource;
    tblIbpt: TIBTable;
    qryIbpt: TIBQuery;
    trnscIbpt: TIBTransaction;
    dbIbpt: TIBDatabase;
    tblIbptNCM: TIBStringField;
    tblIbptEXC: TIBStringField;
    tblIbptTABELA: TIntegerField;
    tblIbptDESCRICAO: TIBStringField;
    tblIbptNACIONAL: TFloatField;
    tblIbptIMPORTADO: TFloatField;
    tblIbptESTADUAL: TFloatField;
    tblIbptMUNICIPAL: TFloatField;
    tblProdutosID_ORIGEM: TIntegerField;
    Label22: TLabel;
    dsPos: TDataSource;
    tblPos: TIBTable;
    qryPos: TIBQuery;
    dbPos: TIBDatabase;
    trnscPos: TIBTransaction;
    tblPosID: TIntegerField;
    tblPosDESCRICAO: TIBStringField;
    tblPosSERIAL: TIBStringField;
    ibdsPos: TIBDataSet;
    qryNcm: TIBQuery;
    tblTributos: TIBTable;
    ibdsTributos: TIBDataSet;
    tblProdutosID_TRIB: TIntegerField;
    tblPosCHREQ: TIBStringField;
    tblPagamentoIMPFIS: TMemoField;
    tblPedidosNCFE: TIntegerField;
    tblClientesFANTASIA: TIBStringField;
    tblFornecedoresCONTATO: TIBStringField;
    tblTributosID: TIntegerField;
    tblTributosTIPOTRIB: TIBStringField;
    tblTributosCODCST: TIBStringField;
    tblTributosCODCFOP: TIBStringField;
    tblTributosCODORIGEM: TIBStringField;
    tblTributosCODCSOSN: TIBStringField;
    tblComprasNNOTA: TIBStringField;
    tblComprasNSERIE: TIBStringField;
    tblComprasCFOP: TIBStringField;
    Label23: TLabel;
    Label24: TLabel;
    dsTransportadora: TDataSource;
    dsVeiculo: TDataSource;
    qryTransportadora: TIBQuery;
    qryVeiculo: TIBQuery;
    tblTransportadora: TIBTable;
    tblVeiculo: TIBTable;
    dbTransportadora: TIBDatabase;
    dbVeiculo: TIBDatabase;
    trnscTransportadora: TIBTransaction;
    trnscVeiculo: TIBTransaction;
    tblTransportadoraID: TIntegerField;
    tblTransportadoraENDERECO: TIBStringField;
    tblTransportadoraCIDADE: TIBStringField;
    tblTransportadoraUF: TIBStringField;
    tblTransportadoraBAIRRO: TIBStringField;
    tblTransportadoraTELEFONE: TIBStringField;
    tblTransportadoraTELEFONE2: TIBStringField;
    tblTransportadoraCNPJ_CPF: TIBStringField;
    tblTransportadoraINSC_RG: TIBStringField;
    tblTransportadoraOBS: TBlobField;
    tblVeiculoID: TIntegerField;
    tblVeiculoMODELO: TIBStringField;
    tblVeiculoPLACA: TIBStringField;
    tblVeiculoUF: TIBStringField;
    tblVeiculoANTT: TIBStringField;
    tblVeiculoCHASSI: TIBStringField;
    tblVeiculoRENAVAM: TIBStringField;
    tblVeiculoTIPO_VEIC: TIBStringField;
    tblVeiculoTIPO_ROD: TIBStringField;
    tblVeiculoTIPO_CARROC: TIBStringField;
    tblVeiculoTARA: TIBStringField;
    tblVeiculoCAP_CARGA: TIBStringField;
    tblVeiculoCAP_M3: TIBStringField;
    dsPesTransportadora: TDataSource;
    tblTransportadoraDESCRICAO: TIBStringField;
    tblVeiculoIDT: TIntegerField;
    tblProdutosALIQUOTA_PIS: TIBBCDField;
    tblProdutosVAL_PIS: TIBBCDField;
    tblProdutosALIQUOTA_ICMSSUB: TIBBCDField;
    tblProdutosVAL_ICMSSUB: TIBBCDField;
    tblProdutosALIQUOTA_COFINS: TIBBCDField;
    tblProdutosVAL_COFINS: TIBBCDField;
    tblComprasALIQUOTA_IPI: TIBBCDField;
    tblComprasALIQUOTA_PIS: TIBBCDField;
    tblComprasALIQUOTA_COFINS: TIBBCDField;
    tblComprasALIQUOTA_ICMS: TIBBCDField;
    tblComprasALIQUOTA_ICMSSUB: TIBBCDField;
    tblComprasVAL_IPI: TIBBCDField;
    tblComprasVAL_PIS: TIBBCDField;
    tblComprasVAL_COFINS: TIBBCDField;
    tblComprasVAL_ICMS: TIBBCDField;
    tblComprasVAL_ICMSSUB: TIBBCDField;
    tblComprasIDT: TIntegerField;
    tblComprasIDV: TIntegerField;
    tblComprasnTransportadora: TStringField;
    tblComprasnVeiculo: TStringField;
    tblCompraspVeiculo: TStringField;
    cdsCTempItens: TClientDataSet;
    cdsCTempItensID: TIntegerField;
    cdsCTempItensID_PRODUTO: TIntegerField;
    cdsCTempItensID_COMPRA: TIntegerField;
    cdsCTempItensDESCRICAO: TStringField;
    cdsCTempItensVALOR_TOTAL: TFloatField;
    cdsCTempItensQUANTIDADE: TIntegerField;
    cdsCTempItensVALOR: TFloatField;
    cdsCTempItensEAN13: TStringField;
    cdsCTempItensCFOP: TStringField;
    tblCompraItensBC_PIS: TIBBCDField;
    tblCompraItensBC_COFINS: TIBBCDField;
    tblCompraItensBC_ICMS: TIBBCDField;
    tblCompraItensBC_ICMSSUB: TIBBCDField;
    tblCompraItensBC_IPI: TIBBCDField;
    tblCompraItensVAL_PIS: TIBBCDField;
    tblCompraItensVAL_COFINS: TIBBCDField;
    tblCompraItensVAL_ICMS: TIBBCDField;
    tblCompraItensVAL_ICMSSUB: TIBBCDField;
    tblCompraItensVAL_IPI: TIBBCDField;
    tblCompraItensALIQUOTA_PIS: TIBBCDField;
    tblCompraItensALIQUOTA_COFINS: TIBBCDField;
    tblCompraItensALIQUOTA_ICMS: TIBBCDField;
    tblCompraItensALIQUOTA_ICMSSUB: TIBBCDField;
    tblCompraItensALIQUOTA_IPI: TIBBCDField;
    tblComprasBC_PIS: TIBBCDField;
    tblComprasBC_COFINS: TIBBCDField;
    tblComprasBC_ICMS: TIBBCDField;
    tblComprasBC_ICMSSUB: TIBBCDField;
    tblComprasBC_IPI: TIBBCDField;
    tblProdutosBC_PIS: TIBBCDField;
    tblProdutosBC_COFINS: TIBBCDField;
    tblProdutosBC_ICMS: TIBBCDField;
    tblProdutosBC_ICMSSUB: TIBBCDField;
    tblProdutosBC_IPI: TIBBCDField;
    cdsCTempItensBC_ICMS: TFloatField;
    cdsCTempItensBC_ICMSSUB: TFloatField;
    cdsCTempItensBC_PIS: TFloatField;
    cdsCTempItensBC_COFINS: TFloatField;
    cdsCTempItensBC_IPI: TFloatField;
    cdsCTempItensVAL_ICMS: TFloatField;
    cdsCTempItensVAL_ICMSSUB: TFloatField;
    cdsCTempItensVAL_PIS: TFloatField;
    cdsCTempItensVAL_COFINS: TFloatField;
    cdsCTempItensVAL_IPI: TFloatField;
    cdsCTempItensALIQUOTA_ICMS: TFloatField;
    cdsCTempItensALIQUOTA_ICMSSUB: TFloatField;
    cdsCTempItensALIQUOTA_PIS: TFloatField;
    cdsCTempItensALIQUOTA_COFINS: TFloatField;
    cdsCTempItensALIQUOTA_IPI: TFloatField;
    tblCompraItensCFOP: TIBStringField;
    qryCompraItens2: TIBQuery;
    tblFornecedoresCNAE: TIBStringField;
    tblFornecedoresIM: TIBStringField;
    tblComprasID: TIntegerField;
    tblComprasMODELO: TIBStringField;
    tblPedidosVAL_PIS: TIBBCDField;
    tblPedidosVAL_COFINS: TIBBCDField;
    tblPedidosVAL_ICMS: TIBBCDField;
    tblPedidosVAL_ICMSSUB: TIBBCDField;
    tblPedidosVAL_IPI: TIBBCDField;
    tblPedidosBC_PIS: TIBBCDField;
    tblPedidosBC_COFINS: TIBBCDField;
    tblPedidosBC_ICMS: TIBBCDField;
    tblPedidosBC_ICMSSUB: TIBBCDField;
    tblPedidosBC_IPI: TIBBCDField;
    tblPedidosALIQUOTA_PIS: TIBBCDField;
    tblPedidosALIQUOTA_COFINS: TIBBCDField;
    tblPedidosALIQUOTA_ICMS: TIBBCDField;
    tblPedidosALIQUOTA_ICMSSUB: TIBBCDField;
    tblPedidosALIQUOTA_IPI: TIBBCDField;
    cdsTempItensBC_ICMS: TFloatField;
    cdsTempItensBC_ICMSSUB: TFloatField;
    cdsTempItensBC_PIS: TFloatField;
    cdsTempItensBC_COFINS: TFloatField;
    cdsTempItensBC_IPI: TFloatField;
    cdsTempItensVAL_ICMS: TFloatField;
    cdsTempItensVAL_ICMSSUB: TFloatField;
    cdsTempItensVAL_PIS: TFloatField;
    cdsTempItensVAL_COFINS: TFloatField;
    cdsTempItensVAL_IPI: TFloatField;
    cdsTempItensALIQUOTA_ICMS: TFloatField;
    cdsTempItensALIQUOTA_ICMSSUB: TFloatField;
    cdsTempItensALIQUOTA_PIS: TFloatField;
    cdsTempItensALIQUOTA_IPI: TFloatField;
    cdsTempItensALIQUOTA_COFINS: TFloatField;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrIntegrador1: TACBrIntegrador;
    ACBrIBGE1: TACBrIBGE;
    ACBrNFe1: TACBrNFe;
    procedure cdsTempItensAfterPost(DataSet: TDataSet);
    procedure tblEstoqueAfterPost(DataSet: TDataSet);
    procedure tblClientesBeforePost(DataSet: TDataSet);
    procedure tblProdutosBeforePost(DataSet: TDataSet);
    procedure tblPedidosBeforePost(DataSet: TDataSet);
    procedure tblComprasBeforePost(DataSet: TDataSet);
    procedure tblLoginBeforePost(DataSet: TDataSet);
    procedure tblEstadosBeforePost(DataSet: TDataSet);
    procedure tblBairrosBeforePost(DataSet: TDataSet);
    procedure tblPedidosItensBeforePost(DataSet: TDataSet);
    procedure tblUnidadeBeforePost(DataSet: TDataSet);
    procedure tblTributosBeforePost(DataSet: TDataSet);
    procedure tblCompraItensBeforePost(DataSet: TDataSet);
    procedure tblCsosnBeforePost(DataSet: TDataSet);
    procedure tblRuasBeforePost(DataSet: TDataSet);
    procedure tblEstoqueBeforePost(DataSet: TDataSet);
    procedure tblEmitenteBeforePost(DataSet: TDataSet);
    procedure tblNCMBeforePost(DataSet: TDataSet);
    procedure tblContaBeforePost(DataSet: TDataSet);
    procedure tblFornecedoresBeforePost(DataSet: TDataSet);
    procedure tblCstBeforePost(DataSet: TDataSet);
    procedure tblCidadesBeforePost(DataSet: TDataSet);
    procedure tblPagamentoBeforePost(DataSet: TDataSet);
    procedure tblContadorBeforePost(DataSet: TDataSet);
    procedure tblOrigemBeforePost(DataSet: TDataSet);
    procedure tblIbptBeforePost(DataSet: TDataSet);
    procedure tblPosBeforePost(DataSet: TDataSet);
    procedure cdsCTempItensAfterPost(DataSet: TDataSet);
    
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
    sEHost, sEPorta, sEUsuario, sESenha, sPathServer, sServidor : String;

    procedure LerArquivoIni;
    procedure GravaArquivoIni;
    procedure AtualizaConfigAcbr;
    procedure FormataCampos;
    procedure FormataCamposF;
    procedure FormataCamposJ;
    function verificaCpf(cpf:String) : boolean;
    function verificaCnpj(pCNPJ:String) : boolean;
    function pegaCodMun(cidade, uf:String) : Integer;
    function Mascara(valor: string) : String;

    procedure GravaChaveNFePedido(pChaveNFe, pNumPed : String);

    procedure DesenhaBarras(SequenciaHexa: string; Imagem: TCanvas);
    procedure GeraBarrasEAN13(CodBarras: string; Imagem: TCanvas);
                     
    function BuscarPorCep(cep: String) : retornaEndereco;
    //
  end;

  var
  telaDados: TtelaDados;



implementation

uses uLancPedidos, uLancItens, uLancCompras, MaskUtils;

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
var
i:integer;
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
  // Transportadora
  tblTransportadoraTELEFONE.EditMask         := '(00)0000-0000;0';
  tblTransportadoraTELEFONE2.EditMask        := '(00)0-0000-0000;0';
  tblTransportadoraCNPJ_CPF.EditMask         := '000.000.000-00;0';
  tblTransportadoraINSC_RG.EditMask          := '0000000000-0;0';
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
  tblProdutosPRECO_VENDAP.DisplayFormat  := '###,###,##0.00';
  tblProdutosMARGEM_LUCROP.DisplayFormat := '##,##0.00';
  tblProdutosALIQUOTA_ICMS.DisplayFormat := '##,##0.00';
  tblProdutosALIQUOTA_IPI.DisplayFormat  := '##,##0.00';
  tblProdutosMARGEM_LUCRO.DisplayFormat  := '##,##0.00';
  tblProdutosREDUCAO_BASE.DisplayFormat  := '##,##0.00';
  tblProdutosPRECO_VENDA.DisplayFormat   := '##,##0.00';
  tblProdutosPRECO_VENDAP.DisplayFormat  := '##,##0.00';
  //Emitente
  tblEmitenteCEP.EditMask                := '00000-000;0';
  tblEmitenteTelefone.EditMask           := '(00)0000-0000;0';
  tblEmitenteCNPJ.EditMask               := '00.000.000/0000-00;0';
  tblEmitenteINSCEST.EditMask            := '00000000-0;0';
  //Fornecedor
  tblFornecedoresCEP_END.EditMask        := '00000-000;0';
  tblFornecedoresTELEFONE.EditMask       := '(00)0000-0000;0';
  tblFornecedoresTELEFONE2.EditMask      := '(00)0000-0000;0';
  tblFornecedoresCNPJ_CPF.EditMask       := '00.000.000/0000-00;0';
  tblFornecedoresINSC_RG.EditMask        := '00000000-0;0';
  //Contador
  tblContadorCEP.EditMask                := '00000-000;0';
  tblContadorCELULAR.EditMask            := '(00)00000-0000;0';
  tblContadorCELULAR2.EditMask           := '(00)0000-0000;0';
  tblContadorCPF.EditMask                := '000.000.000-00;0';

end;

function TtelaDados.Mascara(valor: String): String;
var 
  decimais, centena, milhar, milhoes, bilhoes, trilhoes, quadrilhoes: string; 
  i: Integer; 
begin 
  Result := EmptyStr; 

  for i := 0 to Length(valor) - 1 do 
    if not(valor[i] in ['0' .. '9']) then 
      delete(valor, i, 1); 

  if copy(valor, 1, 1) = '0' then 
    valor := copy(valor, 2, Length(valor)); 

  decimais := RightStr(valor, 2); 
  centena := copy(RightStr(valor, 5), 1, 3); 
  milhar := copy(RightStr(valor, 8), 1, 3); 
  milhoes := copy(RightStr(valor, 11), 1, 3); 
  bilhoes := copy(RightStr(valor, 14), 1, 3); 
  trilhoes := copy(RightStr(valor, 17), 1, 3); 
  quadrilhoes := LeftStr(valor, Length(valor) - 17); 

  case Length(valor) of 
    1: 
      Result := '0,0' + valor; 
    2: 
      Result := '0,' + valor; 
    6 .. 8: 
      begin 
        milhar := LeftStr(valor, Length(valor) - 5); 
        Result := milhar + '.' + centena + ',' + decimais; 
      end; 
    9 .. 11: 
      begin 
        milhoes := LeftStr(valor, Length(valor) - 8); 
        Result := milhoes + '.' + milhar + '.' + centena + ',' + decimais; 
      end; 
    12 .. 14: 
      begin 
        bilhoes := LeftStr(valor, Length(valor) - 11); 
        Result := bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ',' + decimais; 
      end; 
    15 .. 17: 
      begin 
        trilhoes := LeftStr(valor, Length(valor) - 14); 
        Result := trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.' + centena + ',' 
          + decimais; 
      end; 
    18 .. 20: 
      begin 
        quadrilhoes := LeftStr(valor, Length(valor) - 17); 
        Result := quadrilhoes + '.' + trilhoes + '.' + bilhoes + '.' + milhoes + '.' + milhar + '.' 
          + centena + ',' + decimais; 
      end 
  else 
    Result := LeftStr(valor, Length(valor) - 2) + ',' + decimais; 
  end; 
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
  //Servidor
  ArqINI.WriteString('Servidor','Ip', sPathServer);
  ArqINI.WriteString('Servidor','Servidor', sServidor);
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
  //Servidor
  sPathServer      := ArqINI.ReadString('Servidor','Ip', '');
  sServidor      := ArqINI.ReadString('Servidor','Servidor', '');
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


procedure TtelaDados.cdsTempItensAfterPost(DataSet: TDataSet);
begin
  if telaDados.cdsTempItens.RecordCount < 1 then begin
    Abort;
  end else begin
    if tipo = 0 then begin
    telaDados.tblPedidosVALOR.Value := telaDados.cdsTempItens.Aggregates.Items[0].Value;
    telaLancPedidos.calculaPedido;
    end;
    if tipo = 1 then begin
     telaDados.tblComprasVALOR.Value := telaDados.cdsTempItens.Aggregates.Items[0].Value;
     telaLancCompras.calculaPedido;
    end;
  end;
end;

procedure TtelaDados.tblEstoqueAfterPost(DataSet: TDataSet);
begin
  qryProdutos.Close;
  qryProdutos.SQL.Clear;
  qryProdutos.SQL.Add('Select * from PRODUTOS where ID = ');
  qryProdutos.SQL.Add(tblEstoqueID_PRODUTO.AsString);
  qryProdutos.Open;
  telaDados.tblEstoque.Locate('ID', telaDados.qryProdutos.FieldByName('ESTOQUE').AsInteger, []);

  if tblEstoqueTIPO.Value = 'E' then begin
    tblProdutos.Edit;
    tblProdutosESTOQUE.Value := tblProdutosEstoque.Value + tblEstoqueQUANTIDADE.Value;
  end else begin
    tblProdutos.Edit;
    tblProdutosESTOQUE.Value := tblProdutosEstoque.Value - tblEstoqueQUANTIDADE.Value;
  end;
  tblProdutos.Post;
end;

procedure TtelaDados.tblClientesBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblClientes.state = dsInsert then begin
    telaDados.qryClientes.Close;
    telaDados.qryClientes.SQL.Clear;
    telaDados.qryClientes.SQL.Add('Select COUNT(*) from CLIENTE');
    telaDados.qryClientes.Open;
    telaDados.tblClientesID.Value := telaDados.qryClientes.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblProdutosBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblProdutos.state = dsInsert then begin
    telaDados.qryProdutos.Close;
    telaDados.qryProdutos.SQL.Clear;
    telaDados.qryProdutos.SQL.Add('Select COUNT(*) from PRODUTOS');
    telaDados.qryProdutos.Open;
    telaDados.tblProdutosID.Value := telaDados.qryProdutos.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblPedidosBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblPedidos.state = dsInsert then begin
    telaDados.qryPedidos.Close;
    telaDados.qryPedidos.SQL.Clear;
    telaDados.qryPedidos.SQL.Add('Select COUNT(*) from PEDIDO');
    telaDados.qryPedidos.Open;
    telaDados.tblPedidosID.Value := telaDados.qryPedidos.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblComprasBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblCompras.state = dsInsert then begin
    telaDados.qryCompras.Close;
    telaDados.qryCompras.SQL.Clear;
    telaDados.qryCompras.SQL.Add('Select COUNT(*) from COMPRA');
    telaDados.qryCompras.Open;
    telaDados.tblComprasID.Value := telaDados.qryCompras.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblLoginBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblLogin.state = dsInsert then begin
    telaDados.qryLogin.Close;
    telaDados.qryLogin.SQL.Clear;
    telaDados.qryLogin.SQL.Add('Select COUNT(*) from LOGIN');
    telaDados.qryLogin.Open;
    telaDados.tblLoginID.Value := telaDados.qryLogin.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblEstadosBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblEstados.state = dsInsert then begin
    telaDados.qryEstados.Close;
    telaDados.qryEstados.SQL.Clear;
    telaDados.qryEstados.SQL.Add('Select COUNT(*) from ESTADOS');
    telaDados.qryEstados.Open;
    telaDados.tblEstadosID.Value := telaDados.qryEstados.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblBairrosBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblBairros.state = dsInsert then begin
    telaDados.qryBairros.Close;
    telaDados.qryBairros.SQL.Clear;
    telaDados.qryBairros.SQL.Add('Select COUNT(*) from BAIRROS');
    telaDados.qryBairros.Open;
    telaDados.tblBairrosID.Value := telaDados.qryBairros.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblPedidosItensBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblPedidosItens.state = dsInsert then begin
    telaDados.qryPedidosItens.Close;
    telaDados.qryPedidosItens.SQL.Clear;
    telaDados.qryPedidosItens.SQL.Add('Select COUNT(*) from PEDIDO_ITENS');
    telaDados.qryPedidosItens.Open;
    telaDados.tblPedidosItensID.Value := telaDados.qryPedidosItens.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblUnidadeBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblUnidade.state = dsInsert then begin
    telaDados.qryUnidade.Close;
    telaDados.qryUnidade.SQL.Clear;
    telaDados.qryUnidade.SQL.Add('Select COUNT(*) from UNIDADE');
    telaDados.qryUnidade.Open;
    telaDados.tblUnidadeID.Value := telaDados.qryUnidade.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblTributosBeforePost(DataSet: TDataSet);
begin
  {if telaDados.tblTributos.state = dsInsert then begin
    telaDados.qryTributos.Close;
    telaDados.qryTributos.SQL.Clear;
    telaDados.qryTributos.SQL.Add('Select COUNT(*) from TRIBUTO');
    telaDados.qryTributos.Open;
    telaDados.tblTributosID.Value := telaDados.qryTributos.FieldByName('COUNT').AsInteger + 1;
  end;
  }
end;

procedure TtelaDados.tblCompraItensBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblCompraItens.state = dsInsert then begin
    telaDados.qryCompraItens.Close;
    telaDados.qryCompraItens.SQL.Clear;
    telaDados.qryCompraItens.SQL.Add('Select COUNT(*) from COMPRA_ITENS');
    telaDados.qryCompraItens.Open;
    telaDados.tblCompraItensID.Value := telaDados.qryCompraItens.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblCsosnBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblCsosn.state = dsInsert then begin
    telaDados.qryCsosn.Close;
    telaDados.qryCsosn.SQL.Clear;
    telaDados.qryCsosn.SQL.Add('Select COUNT(*) from CSOSN');
    telaDados.qryCsosn.Open;
    telaDados.tblCsosnID.Value := telaDados.qryCsosn.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblRuasBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblRuas.state = dsInsert then begin
    telaDados.qryRuas.Close;
    telaDados.qryRuas.SQL.Clear;
    telaDados.qryRuas.SQL.Add('Select COUNT(*) from RUAS');
    telaDados.qryRuas.Open;
    telaDados.tblRuasID.Value := telaDados.qryRuas.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblEstoqueBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblEstoque.state = dsInsert then begin
    telaDados.qryEstoque.Close;
    telaDados.qryEstoque.SQL.Clear;
    telaDados.qryEstoque.SQL.Add('Select COUNT(*) from ESTOQUE');
    telaDados.qryEstoque.Open;
    telaDados.tblEstoqueID.Value := telaDados.qryEstoque.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblEmitenteBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblEmitente.state = dsInsert then begin
    telaDados.qryEmitente.Close;
    telaDados.qryEmitente.SQL.Clear;
    telaDados.qryEmitente.SQL.Add('Select COUNT(*) from EMITENTE');
    telaDados.qryEmitente.Open;
    telaDados.tblEmitenteID.Value := telaDados.qryEmitente.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblNCMBeforePost(DataSet: TDataSet);
begin
  {if telaDados.tblNCM.state = dsInsert then begin
    telaDados.qryNcm.Close;
    telaDados.qryNcm.SQL.Clear;
    telaDados.qryNcm.SQL.Add('Select COUNT(*) from NCM');
    telaDados.qryNcm.Open;
    telaDados.tblNCMCODNCM.Value := telaDados.qryNcm.FieldByName('COUNT').AsInteger + 1;
  end;  }
end;

procedure TtelaDados.tblContaBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblConta.state = dsInsert then begin
    telaDados.qryConta.Close;
    telaDados.qryConta.SQL.Clear;
    telaDados.qryConta.SQL.Add('Select COUNT(*) from CONTA');
    telaDados.qryConta.Open;
    telaDados.tblContaID.Value := telaDados.qryConta.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblFornecedoresBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblFornecedores.state = dsInsert then begin
    telaDados.qryFornecedores.Close;
    telaDados.qryFornecedores.SQL.Clear;
    telaDados.qryFornecedores.SQL.Add('Select COUNT(*) from FORNECEDOR');
    telaDados.qryFornecedores.Open;
    telaDados.tblFornecedoresID.Value := telaDados.qryFornecedores.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblCstBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblCst.state = dsInsert then begin
    telaDados.qryCst.Close;
    telaDados.qryCst.SQL.Clear;
    telaDados.qryCst.SQL.Add('Select COUNT(*) from CST');
    telaDados.qryCst.Open;
    telaDados.tblCstID.Value := telaDados.qryCst.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblCidadesBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblCidades.state = dsInsert then begin
    telaDados.qryCidades.Close;
    telaDados.qryCidades.SQL.Clear;
    telaDados.qryCidades.SQL.Add('Select COUNT(*) from CIDADES');
    telaDados.qryCidades.Open;
    telaDados.tblCidadesID.Value := telaDados.qryCidades.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblPagamentoBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblPagamento.state = dsInsert then begin
    telaDados.qryPagamentos.Close;
    telaDados.qryPagamentos.SQL.Clear;
    telaDados.qryPagamentos.SQL.Add('Select COUNT(*) from PAGAMENTO');
    telaDados.qryPagamentos.Open;
    telaDados.tblPagamentoID.Value := telaDados.qryPagamentos.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblContadorBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblContador.state = dsInsert then begin
    telaDados.qryContador.Close;
    telaDados.qryContador.SQL.Clear;
    telaDados.qryContador.SQL.Add('Select COUNT(*) from CONTADOR');
    telaDados.qryContador.Open;
    telaDados.tblContadorID.Value := telaDados.qryContador.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblOrigemBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblOrigem.state = dsInsert then begin
    telaDados.qryOrigem.Close;
    telaDados.qryOrigem.SQL.Clear;
    telaDados.qryOrigem.SQL.Add('Select COUNT(*) from ORIGEM');
    telaDados.qryOrigem.Open;
    telaDados.tblOrigemID.Value := telaDados.qryOrigem.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.tblIbptBeforePost(DataSet: TDataSet);
begin
 { if telaDados.tblIbpt.state = dsInsert then begin
    telaDados.qryIbpt.Close;
    telaDados.qryIbpt.SQL.Clear;
    telaDados.qryIbpt.SQL.Add('Select COUNT(*) from IBPT');
    telaDados.qryIbpt.Open;
    telaDados.tblIbptID.Value := telaDados.qryIbpt.FieldByName('COUNT').AsInteger + 1;
  end; }
end;

procedure TtelaDados.tblPosBeforePost(DataSet: TDataSet);
begin
  if telaDados.tblPos.state = dsInsert then begin
    telaDados.qryPos.Close;
    telaDados.qryPos.SQL.Clear;
    telaDados.qryPos.SQL.Add('Select COUNT(*) from POS');
    telaDados.qryPos.Open;
    telaDados.tblPosID.Value := telaDados.qryPos.FieldByName('COUNT').AsInteger + 1;
  end;
end;

procedure TtelaDados.cdsCTempItensAfterPost(DataSet: TDataSet);
begin
  if telaDados.cdsCTempItens.RecordCount < 1 then begin
    Abort;
  end else begin

     telaDados.tblComprasVALOR.Value := telaDados.cdsCTempItens.Aggregates.Items[0].Value;


     telaDados.tblComprasBC_ICMS.Value := telaDados.cdsCTempItens.Aggregates.Items[1].Value;
     telaDados.tblComprasBC_ICMSSUB.Value := telaDados.cdsCTempItens.Aggregates.Items[2].Value;
     telaDados.tblComprasBC_IPI.Value := telaDados.cdsCTempItens.Aggregates.Items[3].Value;
     telaDados.tblComprasBC_PIS.Value := telaDados.cdsCTempItens.Aggregates.Items[4].Value;
     telaDados.tblComprasBC_COFINS.Value := telaDados.cdsCTempItens.Aggregates.Items[5].Value;

     telaDados.tblComprasVAL_ICMS.Value := telaDados.cdsCTempItens.Aggregates.Items[6].Value;
     telaDados.tblComprasVAL_ICMSSUB.Value := telaDados.cdsCTempItens.Aggregates.Items[7].Value;
     telaDados.tblComprasVAL_IPI.Value := telaDados.cdsCTempItens.Aggregates.Items[8].Value;
     telaDados.tblComprasVAL_PIS.Value := telaDados.cdsCTempItens.Aggregates.Items[9].Value;
     telaDados.tblComprasVAL_COFINS.Value := telaDados.cdsCTempItens.Aggregates.Items[10].Value;

       
      telaLancCompras.calculaPedido;
  end;
end;

end.
