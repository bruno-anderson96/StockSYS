object telaEnviarNfe: TtelaEnviarNfe
  Left = 206
  Top = 241
  Width = 488
  Height = 206
  Caption = 'Enviar NFe'
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
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 71
    Height = 13
    Caption = 'N'#250'ero do Lote:'
  end
  object TLabel
    Left = 168
    Top = 72
    Width = 91
    Height = 13
    Caption = 'N'#250'mero do Pedido:'
  end
  object gb: TGroupBox
    Left = 8
    Top = 8
    Width = 457
    Height = 57
    Caption = 'Seleciona Arquivo XML da NFe'
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 416
      Top = 21
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object edtArquivo: TEdit
      Left = 16
      Top = 24
      Width = 393
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 127
    Width = 472
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Action = actEnviar
      Caption = 'F2 - Enviar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Action = actFechar
      Caption = 'F3 - Fechar'
      TabOrder = 1
    end
  end
  object edtNumLote: TEdit
    Left = 8
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtNumPed: TEdit
    Left = 168
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 416
    Top = 128
    object actEnviar: TAction
      Caption = 'F2 - Enviar'
      ShortCut = 113
      OnExecute = actEnviarExecute
    end
    object actFechar: TAction
      Caption = 'F3 - Fechar'
      ShortCut = 114
      OnExecute = actFecharExecute
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 384
    Top = 127
  end
end
