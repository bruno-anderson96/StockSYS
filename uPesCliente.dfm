object telaPesCliente: TtelaPesCliente
  Left = 192
  Top = 163
  Width = 1109
  Height = 480
  Caption = 'Pesquisa Cliente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1093
    Height = 57
    Align = alTop
    TabOrder = 0
    object btnPesquisa: TSpeedButton
      Left = 864
      Top = 16
      Width = 23
      Height = 22
      Caption = 'P'
      OnClick = btnPesquisaClick
    end
    object editBusca: TEdit
      Left = 200
      Top = 16
      Width = 657
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object cbCategoria: TComboBox
      Left = 40
      Top = 16
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        'Nome'
        'CPF'
        'RG'
        'Cidade')
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 57
    Width = 1093
    Height = 385
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 1089
      Height = 368
      Align = alClient
      DataSource = telaDados.dsPesClientes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENDERECO'
          Title.Caption = 'Endere'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_END'
          Title.Caption = 'Num'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO_END'
          Title.Caption = 'Bairro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE_END'
          Title.Caption = 'CIdade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CNPJ_CPF'
          Title.Caption = 'CNPJ/CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INSC_RG'
          Title.Caption = 'INSC.E/RG'
          Visible = True
        end>
    end
  end
end
