object telaCadFor: TtelaCadFor
  Left = 288
  Top = 261
  Width = 756
  Height = 384
  Caption = 'Cadastro de Fornecedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 740
    Height = 280
    Align = alClient
    Caption = 'Informa'#231#245'es de Cadastro'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 36
      Height = 13
      Caption = #180'C'#243'digo'
      FocusControl = editId
    end
    object Label2: TLabel
      Left = 12
      Top = 47
      Width = 28
      Height = 13
      Caption = 'Nome'
      FocusControl = editNome
    end
    object Label3: TLabel
      Left = 12
      Top = 95
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
      FocusControl = editEndereco
    end
    object Label4: TLabel
      Left = 488
      Top = 95
      Width = 25
      Height = 13
      Caption = 'Num.'
      FocusControl = editNum
    end
    object Label5: TLabel
      Left = 12
      Top = 119
      Width = 27
      Height = 13
      Caption = 'Bairro'
      FocusControl = editBairro
    end
    object Label6: TLabel
      Left = 12
      Top = 143
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = editCidade
    end
    object Label7: TLabel
      Left = 11
      Top = 71
      Width = 21
      Height = 13
      Caption = 'CEP'
      FocusControl = editCep
    end
    object Label8: TLabel
      Left = 11
      Top = 168
      Width = 57
      Height = 13
      Caption = 'Telefone 1.:'
      FocusControl = editTel1
    end
    object Label9: TLabel
      Left = 240
      Top = 168
      Width = 57
      Height = 13
      Caption = 'Telefone 2.:'
      FocusControl = editTel2
    end
    object Label10: TLabel
      Left = 13
      Top = 191
      Width = 27
      Height = 13
      Caption = 'CNPJ'
      FocusControl = editCnpj
    end
    object Label11: TLabel
      Left = 13
      Top = 215
      Width = 67
      Height = 13
      Caption = 'Insc. Estadual'
      FocusControl = editInsc
    end
    object Label12: TLabel
      Left = 360
      Top = 143
      Width = 14
      Height = 13
      Caption = 'UF'
      FocusControl = editUf
    end
    object Label13: TLabel
      Left = 13
      Top = 239
      Width = 32
      Height = 13
      Caption = 'EMAIL'
      FocusControl = editEmail
    end
    object btnCep: TSpeedButton
      Left = 232
      Top = 71
      Width = 23
      Height = 22
      Caption = 'P'
      Enabled = False
      OnClick = btnCepClick
    end
    object labelCompl: TLabel
      Left = 360
      Top = 119
      Width = 64
      Height = 13
      Caption = 'Complemento'
      FocusControl = editCompl
    end
    object editId: TDBEdit
      Left = 88
      Top = 23
      Width = 134
      Height = 21
      DataField = 'ID'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 0
    end
    object editNome: TDBEdit
      Left = 88
      Top = 47
      Width = 641
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 1
    end
    object editEndereco: TDBEdit
      Left = 88
      Top = 95
      Width = 394
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 3
    end
    object editNum: TDBEdit
      Left = 520
      Top = 95
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NUM_END'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 4
    end
    object editBairro: TDBEdit
      Left = 88
      Top = 119
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      DataField = 'BAIRRO_END'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 5
    end
    object editCidade: TDBEdit
      Left = 88
      Top = 143
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CIDADE_END'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 7
    end
    object editCep: TDBEdit
      Left = 88
      Top = 71
      Width = 134
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CEP_END'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 2
    end
    object editTel1: TDBEdit
      Left = 88
      Top = 167
      Width = 147
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TELEFONE'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 9
    end
    object editTel2: TDBEdit
      Left = 304
      Top = 167
      Width = 147
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TELEFONE2'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 10
    end
    object editCnpj: TDBEdit
      Left = 88
      Top = 191
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CNPJ_CPF'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 11
    end
    object editInsc: TDBEdit
      Left = 88
      Top = 215
      Width = 264
      Height = 21
      CharCase = ecUpperCase
      DataField = 'INSC_RG'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 12
    end
    object editUf: TDBEdit
      Left = 384
      Top = 143
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'UF_END'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 8
    end
    object editEmail: TDBEdit
      Left = 88
      Top = 239
      Width = 642
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EMAIL'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 13
    end
    object editCompl: TDBEdit
      Left = 432
      Top = 119
      Width = 289
      Height = 21
      CharCase = ecUpperCase
      DataField = 'COMPLEMENTO'
      DataSource = telaDados.dsFornecedores
      Enabled = False
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 280
    Width = 740
    Height = 66
    Align = alBottom
    TabOrder = 1
    object btnIncluir: TBitBtn
      Left = 0
      Top = 0
      Width = 75
      Height = 65
      Action = actIncluir
      Caption = 'F2 - &Incluir'
      TabOrder = 0
    end
    object btnExcluir: TBitBtn
      Left = 74
      Top = 0
      Width = 75
      Height = 65
      Action = actExcluir
      Caption = 'F3 - &Excluir'
      Enabled = False
      TabOrder = 1
    end
    object btnConfirmar: TBitBtn
      Left = 148
      Top = 0
      Width = 75
      Height = 65
      Action = actConfirmar
      Caption = 'F4 - &Confirmar'
      Enabled = False
      TabOrder = 2
    end
    object btnCancelar: TBitBtn
      Left = 222
      Top = 0
      Width = 75
      Height = 65
      Action = actCancelar
      Caption = 'F5 - C&ancelar'
      Enabled = False
      TabOrder = 3
    end
    object btnPesquisar: TBitBtn
      Left = 296
      Top = 0
      Width = 75
      Height = 65
      Action = actPesquisar
      Caption = 'F6 - &Pesquisar'
      TabOrder = 4
    end
    object btnFechar: TBitBtn
      Left = 444
      Top = -8
      Width = 75
      Height = 73
      Action = actFechar
      Caption = 'F10 - &Fechar'
      TabOrder = 5
    end
    object btnEditar: TBitBtn
      Left = 371
      Top = 0
      Width = 75
      Height = 65
      Action = actEditar
      Caption = 'F8 - E&ditar'
      TabOrder = 6
    end
  end
  object ActionList1: TActionList
    Left = 704
    Top = 136
    object actIncluir: TAction
      Caption = 'F2 - &Incluir'
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actExcluir: TAction
      Caption = 'F3 - &Excluir'
      ShortCut = 114
      OnExecute = actExcluirExecute
    end
    object actConfirmar: TAction
      Caption = 'F4 - &Confirmar'
      ShortCut = 115
      OnExecute = actConfirmarExecute
    end
    object actCancelar: TAction
      Caption = 'F5 - C&ancelar'
      ShortCut = 116
      OnExecute = actCancelarExecute
    end
    object actPesquisar: TAction
      Caption = 'F6 - &Pesquisar'
      ShortCut = 117
      OnExecute = actPesquisarExecute
    end
    object actFechar: TAction
      Caption = 'F10 - &Fechar'
      ShortCut = 121
      OnExecute = actFecharExecute
    end
    object actEditar: TAction
      Caption = 'F8 - E&ditar'
      ShortCut = 119
      OnExecute = actEditarExecute
    end
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsRepublicaVirtual
    PesquisarIBGE = True
    Left = 706
    Top = 168
  end
end
