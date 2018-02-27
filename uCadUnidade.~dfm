object telaCadUnidade: TtelaCadUnidade
  Left = 539
  Top = 259
  Width = 368
  Height = 360
  Caption = 'Cadastro de Unidades'
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
    Width = 352
    Height = 322
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Sigla'
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = editNome
    end
    object editNome: TDBEdit
      Left = 8
      Top = 80
      Width = 199
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = telaDados.dsUnidade
      Enabled = False
      TabOrder = 1
    end
    object btnCadastrar: TBitBtn
      Left = 264
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
    object btnSair: TBitBtn
      Left = 264
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
    object btnInserir: TBitBtn
      Left = 264
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 4
      OnClick = btnInserirClick
    end
    object editSigla: TDBEdit
      Left = 8
      Top = 32
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      DataField = 'SIGLA'
      DataSource = telaDados.dsUnidade
      Enabled = False
      TabOrder = 0
    end
    object btnEdit: TBitBtn
      Left = 264
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 5
      OnClick = btnEditClick
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 144
      Width = 337
      Height = 169
      DataSource = telaDados.dsUnidade
      Enabled = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBEdit1: TDBEdit
      Left = 88
      Top = 32
      Width = 134
      Height = 21
      DataField = 'ID'
      DataSource = telaDados.dsUnidade
      TabOrder = 7
    end
  end
end
