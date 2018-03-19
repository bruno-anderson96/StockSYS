object telaConfigSat: TtelaConfigSat
  Left = 197
  Top = 122
  Width = 928
  Height = 576
  Caption = 'Configura'#231#227'o SAT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton4: TSpeedButton
    Left = 608
    Top = 112
    Width = 113
    Height = 30
    Caption = 'Ativar Sat'
    OnClick = At
  end
  object SpeedButton5: TSpeedButton
    Left = 608
    Top = 144
    Width = 114
    Height = 38
    Caption = 'Associar Ass.'
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 608
    Top = 192
    Width = 114
    Height = 38
    Caption = 'Consultar SAT'
    OnClick = SpeedButton6Click
  end
  object SpeedButton1: TSpeedButton
    Left = 632
    Top = 272
    Width = 49
    Height = 41
  end
  object Memo1: TMemo
    Left = 40
    Top = 240
    Width = 489
    Height = 145
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object ACBrIntegrador1: TACBrIntegrador
    PastaInput = 'C:\Integrador\Input\'
    PastaOutput = 'C:\Integrador\Output\'
    Left = 272
    Top = 96
  end
  object ACBrSAT1: TACBrSAT
    Integrador = ACBrIntegrador1
    NomeDLL = 'C:\SAT\SAT.dll'
    ValidarNumeroSessaoResposta = True
    NumeroTentativasValidarSessao = 2
    Config.infCFe_versaoDadosEnt = 0.070000000000000010
    Config.ide_numeroCaixa = 0
    Config.ide_tpAmb = taHomologacao
    Config.emit_cRegTrib = RTSimplesNacional
    Config.emit_cRegTribISSQN = RTISSMicroempresaMunicipal
    Config.emit_indRatISSQN = irSim
    Config.EhUTF8 = True
    Config.PaginaDeCodigo = 65001
    Config.XmlSignLib = xsMsXml
    ConfigArquivos.SalvarEnvio = True
    ConfigArquivos.SepararPorCNPJ = True
    ConfigArquivos.SepararPorModelo = True
    ConfigArquivos.SepararPorAno = True
    ConfigArquivos.SepararPorMes = True
    ConfigArquivos.SepararPorDia = True
    ConfigArquivos.PrefixoArqCFe = 'AD'
    ConfigArquivos.PrefixoArqCFeCanc = 'ADC'
    Rede.tipoInter = infETHE
    Rede.seg = segNONE
    Rede.tipoLan = lanDHCP
    Rede.lanIP = '192.168.1.1'
    Rede.lanMask = '255.255.255.0'
    Rede.lanGW = '192.168.1.1'
    Rede.lanDNS1 = '192.168.1.1'
    Rede.lanDNS2 = '192.168.1.1'
    Rede.proxy = 0
    Rede.proxy_porta = 0
    Left = 304
    Top = 96
  end
  object ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS
    Mask_qCom = ',0.0000'
    Mask_vUnCom = ',0.000'
    SoftwareHouse = 'Projeto ACBr'
    Site = 'http://www.projetoacbr.com.br'
    MsgAppQRCode = 
      'Consulte o QR Code pelo aplicativo  "De olho na nota", dispon'#237've' +
      'l na AppStore (Apple) e PlayStore (Android)'
    Left = 336
    Top = 96
  end
  object ACBrPosPrinter1: TACBrPosPrinter
    ConfigBarras.MostrarCodigo = False
    ConfigBarras.LarguraLinha = 0
    ConfigBarras.Altura = 0
    ConfigBarras.Margem = 0
    ConfigQRCode.Tipo = 2
    ConfigQRCode.LarguraModulo = 4
    ConfigQRCode.ErrorLevel = 0
    LinhasEntreCupons = 0
    Left = 368
    Top = 96
  end
end
