object telaValidaXml: TtelaValidaXml
  Left = 154
  Top = 128
  Width = 488
  Height = 182
  Caption = 'Validar Arquivo XML'
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
    Left = 8
    Top = 8
    Width = 449
    Height = 65
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 408
      Top = 22
      Width = 23
      Height = 21
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object edtArquivo: TEdit
      Left = 16
      Top = 24
      Width = 385
      Height = 21
      TabOrder = 0
      OnExit = edtArquivoExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 103
    Width = 472
    Height = 41
    Align = alBottom
    TabOrder = 1
    object SpeedButton2: TSpeedButton
      Left = 264
      Top = 8
      Width = 105
      Height = 30
      Action = actFechar
    end
    object btnValida: TSpeedButton
      Left = 80
      Top = 6
      Width = 169
      Height = 33
      Action = actValidar
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos XML|*.xml|Todos|*.*'
    Left = 424
    Top = 112
  end
  object ActionList1: TActionList
    Left = 384
    Top = 112
    object actValidar: TAction
      Caption = 'F2 - Validar'
      ShortCut = 113
      OnExecute = actValidarExecute
    end
    object actFechar: TAction
      Caption = 'F3 - Fechar'
      ShortCut = 114
      OnExecute = actFecharExecute
    end
  end
end
