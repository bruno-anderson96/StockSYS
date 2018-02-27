object telaGerarNfeEntrada: TtelaGerarNfeEntrada
  Left = 306
  Top = 191
  Width = 819
  Height = 481
  Caption = 'Gerar NFe - Entrada'
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
    Width = 803
    Height = 129
    Align = alTop
    TabOrder = 0
    object radOpt: TRadioGroup
      Left = 8
      Top = 16
      Width = 169
      Height = 65
      ItemIndex = 2
      Items.Strings = (
        'C'#243'digo Compra'
        'C'#243'digo Fornecedor'
        'Nome Fornecedor')
      TabOrder = 0
    end
    object edtDados: TEdit
      Left = 8
      Top = 96
      Width = 329
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object GroupBox2: TGroupBox
      Left = 192
      Top = 16
      Width = 147
      Height = 66
      Caption = 'Per'#237'odo'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 14
        Height = 13
        Caption = 'De'
      end
      object Label2: TLabel
        Left = 12
        Top = 42
        Width = 6
        Height = 13
        Caption = #224
      end
      object dtInicial: TDateTimePicker
        Left = 32
        Top = 16
        Width = 106
        Height = 21
        Date = 43033.707145902780000000
        Time = 43033.707145902780000000
        TabOrder = 0
      end
      object dtFinal: TDateTimePicker
        Left = 32
        Top = 40
        Width = 106
        Height = 21
        Date = 43033.707273206020000000
        Time = 43033.707273206020000000
        TabOrder = 1
      end
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 96
      Width = 75
      Height = 20
      Caption = 'Localizar'
      TabOrder = 3
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 424
      Top = 96
      Width = 75
      Height = 20
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 592
      Top = 48
      Width = 75
      Height = 73
      Caption = 'Gerar NFe'
      TabOrder = 5
      OnClick = BitBtn3Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 129
    Width = 803
    Height = 314
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 799
      Height = 297
      Align = alClient
      DataSource = dsConsultaCompras
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA_COMPRA'
          Title.Caption = 'DATA DO PEDIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'N'#218'MERO DA COMPRA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Caption = 'VALOR TOTAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORNECEDOR'
          Visible = True
        end>
    end
  end
  object dsConsultaCompras: TDataSource
    DataSet = telaDados.qryCompras
    Left = 600
    Top = 16
  end
end
