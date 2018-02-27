object telaCadProdutos: TtelaCadProdutos
  Left = 562
  Top = 161
  Width = 806
  Height = 483
  Caption = 'Cadastro de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 605
    Top = 0
    Width = 185
    Height = 445
    Align = alRight
    TabOrder = 0
    object btnIncluir: TBitBtn
      Left = 0
      Top = 0
      Width = 185
      Height = 25
      Action = Incluir
      Caption = 'F2 - &Incluir'
      TabOrder = 0
    end
    object btnExcluir: TBitBtn
      Left = 0
      Top = 24
      Width = 185
      Height = 25
      Action = Excluir
      Caption = 'F3 - E&xcluir'
      TabOrder = 1
    end
    object btnConfirmar: TBitBtn
      Left = 0
      Top = 48
      Width = 185
      Height = 25
      Action = Confirmar
      Caption = 'F4 - &Confirmar'
      Enabled = False
      TabOrder = 2
    end
    object btnCancelar: TBitBtn
      Left = 0
      Top = 72
      Width = 185
      Height = 25
      Action = Cancelar
      Caption = 'F5 - C&ancelar'
      Enabled = False
      TabOrder = 3
    end
    object btnPesquisar: TBitBtn
      Left = 0
      Top = 96
      Width = 185
      Height = 25
      Action = Pesquisar
      Caption = 'F6 - &Pesquisar'
      TabOrder = 4
    end
    object btnRelatorio: TBitBtn
      Left = 0
      Top = 120
      Width = 185
      Height = 25
      Caption = 'F7 - &Relat'#243'rio'
      TabOrder = 5
    end
    object btnFechar: TBitBtn
      Left = 0
      Top = 168
      Width = 185
      Height = 25
      Caption = 'F10 - &Fechar'
      TabOrder = 6
      OnClick = btnFecharClick
    end
    object btnEditar: TBitBtn
      Left = 0
      Top = 144
      Width = 185
      Height = 25
      Action = Editar
      Caption = 'F8 - E&ditar'
      TabOrder = 7
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 605
    Height = 445
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 26
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = editId
    end
    object Label2: TLabel
      Left = 16
      Top = 53
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = editDesc
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
      FocusControl = editRef
    end
    object Label4: TLabel
      Left = 17
      Top = 105
      Width = 40
      Height = 13
      Caption = 'Unidade'
    end
    object Label5: TLabel
      Left = 253
      Top = 104
      Width = 55
      Height = 13
      Caption = 'Embalagem'
      FocusControl = editEmb
    end
    object Label6: TLabel
      Left = 407
      Top = 102
      Width = 49
      Height = 13
      Caption = 'C'#243'd. NCM'
      FocusControl = editNcm
    end
    object Label7: TLabel
      Left = 16
      Top = 134
      Width = 59
      Height = 13
      Caption = 'C'#243'd. EAN13'
      FocusControl = editEan
    end
    object Label8: TLabel
      Left = 272
      Top = 133
      Width = 36
      Height = 13
      Caption = 'DUN14'
      FocusControl = editDun
    end
    object btnPncm: TSpeedButton
      Left = 576
      Top = 96
      Width = 23
      Height = 22
      Caption = 'P'
      Enabled = False
      OnClick = btnPncmClick
    end
    object Image1: TImage
      Left = 472
      Top = 16
      Width = 121
      Height = 73
    end
    object editId: TDBEdit
      Left = 88
      Top = 24
      Width = 134
      Height = 21
      DataField = 'ID'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 0
    end
    object editDesc: TDBEdit
      Left = 88
      Top = 50
      Width = 289
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 1
    end
    object editRef: TDBEdit
      Left = 88
      Top = 76
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REFERENCIA'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 2
    end
    object editEmb: TDBEdit
      Left = 317
      Top = 102
      Width = 75
      Height = 21
      CharCase = ecUpperCase
      DataField = 'QUANT_CAIXA'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 3
    end
    object editNcm: TDBEdit
      Left = 462
      Top = 98
      Width = 108
      Height = 21
      DataField = 'CODIGO_NCM'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 4
    end
    object editEan: TDBEdit
      Left = 88
      Top = 130
      Width = 173
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EAN13'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 5
      OnExit = editEanExit
      OnKeyPress = editEanKeyPress
    end
    object editDun: TDBEdit
      Left = 317
      Top = 129
      Width = 186
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DUN14'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 6
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 168
      Width = 193
      Height = 153
      Color = clSkyBlue
      Ctl3D = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 7
      object Label9: TLabel
        Left = 8
        Top = 26
        Width = 39
        Height = 13
        Caption = 'Estoque'
        FocusControl = editEstoque
      end
      object Label10: TLabel
        Left = 8
        Top = 54
        Width = 67
        Height = 13
        Caption = 'Desc. M'#225'ximo'
        FocusControl = editDescMax
      end
      object Label11: TLabel
        Left = 8
        Top = 80
        Width = 45
        Height = 13
        Caption = 'Comiss'#227'o'
        FocusControl = editComissao
      end
      object editEstoque: TDBEdit
        Left = 80
        Top = 24
        Width = 107
        Height = 19
        DataField = 'ESTOQUE'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 0
      end
      object editDescMax: TDBEdit
        Left = 80
        Top = 50
        Width = 106
        Height = 19
        DataField = 'PERC_DESC'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 1
      end
      object editComissao: TDBEdit
        Left = 80
        Top = 74
        Width = 106
        Height = 19
        DataField = 'PERC_COM'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 200
      Top = 168
      Width = 201
      Height = 153
      Color = clSkyBlue
      Ctl3D = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 8
      object Label12: TLabel
        Left = 9
        Top = 26
        Width = 26
        Height = 13
        Caption = 'ICMS'
        FocusControl = editIcms
      end
      object Label13: TLabel
        Left = 9
        Top = 49
        Width = 13
        Height = 13
        Caption = 'IPI'
        FocusControl = editIpi
      end
      object Label14: TLabel
        Left = 8
        Top = 73
        Width = 71
        Height = 13
        Caption = 'Redu'#231#227'o Base'
        FocusControl = editRedBas
      end
      object Label15: TLabel
        Left = 8
        Top = 97
        Width = 71
        Height = 13
        Caption = 'Base C'#225'lc. ST.'
        FocusControl = editBaseST
      end
      object Label16: TLabel
        Left = 9
        Top = 121
        Width = 23
        Height = 13
        Caption = 'MVA'
        FocusControl = editMva
      end
      object editIcms: TDBEdit
        Left = 88
        Top = 24
        Width = 102
        Height = 19
        DataField = 'ALIQUOTA_ICMS'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 0
        OnExit = editIcmsExit
      end
      object editIpi: TDBEdit
        Left = 88
        Top = 48
        Width = 102
        Height = 19
        DataField = 'ALIQUOTA_IPI'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 1
        OnExit = editIpiExit
      end
      object editRedBas: TDBEdit
        Left = 88
        Top = 72
        Width = 102
        Height = 19
        DataField = 'REDUCAO_BASE'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 2
        OnExit = editRedBasExit
      end
      object editBaseST: TDBEdit
        Left = 88
        Top = 96
        Width = 102
        Height = 19
        DataField = 'BASE_ST'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 3
        OnExit = editBaseSTExit
      end
      object editMva: TDBEdit
        Left = 88
        Top = 120
        Width = 102
        Height = 19
        DataField = 'MVA'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 4
        OnExit = editMvaExit
      end
    end
    object GroupBox4: TGroupBox
      Left = 400
      Top = 168
      Width = 193
      Height = 153
      Color = clSkyBlue
      Ctl3D = False
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 9
      object Label17: TLabel
        Left = 8
        Top = 26
        Width = 59
        Height = 13
        Caption = '(R$) Compra'
        FocusControl = editCompra
      end
      object Label18: TLabel
        Left = 8
        Top = 79
        Width = 54
        Height = 13
        Caption = '(R$) Venda'
        FocusControl = editVenda
      end
      object Label19: TLabel
        Left = 8
        Top = 52
        Width = 68
        Height = 13
        Caption = 'Margem Lucro'
        FocusControl = editLucro
      end
      object editCompra: TDBEdit
        Left = 80
        Top = 24
        Width = 105
        Height = 19
        DataField = 'PRECO_COMPRA'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 0
        OnExit = editCompraExit
      end
      object editVenda: TDBEdit
        Left = 80
        Top = 76
        Width = 105
        Height = 19
        DataField = 'PRECO_VENDA'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 1
      end
      object editLucro: TDBEdit
        Left = 80
        Top = 50
        Width = 105
        Height = 19
        DataField = 'MARGEM_LUCRO'
        DataSource = telaDados.dsProdutos
        Enabled = False
        TabOrder = 2
        OnExit = editLucroExit
      end
    end
    object cbAtivo: TDBCheckBox
      Left = 8
      Top = 416
      Width = 97
      Height = 17
      Caption = 'Ativo'
      Ctl3D = True
      DataField = 'ATIVO'
      DataSource = telaDados.dsProdutos
      Enabled = False
      ParentCtl3D = False
      TabOrder = 10
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cbCtrlEstoque: TDBCheckBox
      Left = 88
      Top = 416
      Width = 108
      Height = 17
      Caption = 'Controlar Estoque'
      DataField = 'CONTROLADOR_ESTOQUE'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 11
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cbFracionada: TDBCheckBox
      Left = 215
      Top = 416
      Width = 97
      Height = 17
      Caption = 'Fracionada'
      DataField = 'FRACIONADO'
      DataSource = telaDados.dsProdutos
      Enabled = False
      TabOrder = 12
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object radTipoProduto: TRadioGroup
      Left = 8
      Top = 336
      Width = 577
      Height = 65
      Caption = 'Tipo de Produto'
      Columns = 3
      Enabled = False
      Items.Strings = (
        '0 - Tributado'
        '1 - Isento'
        '2 - N'#227'o Tributado'
        '3 - Sub. Tribut'#225'ria'
        '4 - Servi'#231'o')
      TabOrder = 13
    end
    object cbUnidade: TDBComboBox
      Left = 88
      Top = 104
      Width = 153
      Height = 21
      DataField = 'UNIDADE'
      DataSource = telaDados.dsProdutos
      Enabled = False
      ItemHeight = 13
      TabOrder = 14
    end
  end
  object ActionList1: TActionList
    Left = 755
    Top = 272
    object Incluir: TAction
      Caption = 'F2 - &Incluir'
      ShortCut = 113
      OnExecute = IncluirExecute
    end
    object Excluir: TAction
      Caption = 'F3 - &Excluir'
      ShortCut = 114
      OnExecute = ExcluirExecute
    end
    object Confirmar: TAction
      Caption = 'F4 - &Confirmar'
      ShortCut = 115
      OnExecute = ConfirmarExecute
    end
    object Cancelar: TAction
      Caption = 'F5 - C&ancelar'
      ShortCut = 116
      OnExecute = CancelarExecute
    end
    object Pesquisar: TAction
      Caption = 'F6 - &Pesquisar'
      ShortCut = 117
      OnExecute = PesquisarExecute
    end
    object Relatorio: TAction
      Caption = 'F7 - &Relat'#243'rio'
      ShortCut = 118
    end
    object Fechar: TAction
      Caption = 'F10 - &Fechar'
      ShortCut = 121
      OnExecute = FecharExecute
    end
    object Editar: TAction
      Caption = 'F8 - E&ditar'
      ShortCut = 119
      OnExecute = EditarExecute
    end
  end
  object ACBrNCMs1: TACBrNCMs
    ProxyPort = '8080'
    UrlConsulta = 'http://www4.receita.fazenda.gov.br/simulador/PesquisarNCM.jsp?'
    Left = 757
    Top = 304
  end
end
