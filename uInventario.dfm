object telaInventario: TtelaInventario
  Left = 292
  Top = 292
  Width = 294
  Height = 280
  Caption = 'Invent'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 278
    Height = 242
    Align = alClient
    TabOrder = 0
    object btnVisualizar: TSpeedButton
      Left = 88
      Top = 176
      Width = 97
      Height = 33
      Caption = 'Visualizar'
      OnClick = btnVisualizarClick
    end
    object Label1: TLabel
      Left = 10
      Top = 24
      Width = 81
      Height = 13
      Caption = 'Tipo de Relat'#243'rio'
    end
    object Label2: TLabel
      Left = 64
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object cbRelatorio: TComboBox
      Left = 100
      Top = 22
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Custo'
      Items.Strings = (
        'Custo'
        'Venda')
    end
    object dtData: TDateTimePicker
      Left = 98
      Top = 53
      Width = 149
      Height = 21
      Date = 43468.810448159730000000
      Time = 43468.810448159730000000
      TabOrder = 1
    end
  end
end
