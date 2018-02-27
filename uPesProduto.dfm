object telaPesProduto: TtelaPesProduto
  Left = 195
  Top = 201
  Width = 881
  Height = 473
  Caption = 'Pesquisa Produto'
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
    Width = 865
    Height = 57
    Align = alTop
    TabOrder = 0
    object btnPesquisa: TSpeedButton
      Left = 832
      Top = 16
      Width = 23
      Height = 22
      Caption = 'P'
      OnClick = btnPesquisaClick
    end
    object editBusca: TEdit
      Left = 200
      Top = 16
      Width = 617
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
        'C'#243'digo'
        'Descri'#231#227'o'
        'NCM')
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 57
    Width = 865
    Height = 378
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 861
      Height = 361
      Align = alClient
      DataSource = telaDados.dsPesProdutos
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
          FieldName = 'ID'
          Title.Caption = 'C'#243'd. Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Caption = 'Unidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANT_CAIXA'
          Title.Caption = 'Quant. Caixa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE'
          Title.Caption = 'Estoque'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Title.Caption = 'Pre'#231'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_NCM'
          Title.Caption = 'NCM'
          Visible = True
        end>
    end
  end
end
