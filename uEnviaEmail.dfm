object telaEnviaEmail: TtelaEnviaEmail
  Left = 690
  Top = 120
  Width = 471
  Height = 251
  Caption = 'Enviar Email NFe'
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
    Top = 128
    Width = 90
    Height = 13
    Caption = 'Email Destinat'#225'rio :'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 441
    Height = 105
    Caption = 'Selecionar Arquivo'
    TabOrder = 0
    object spb: TSpeedButton
      Left = 392
      Top = 29
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = spbClick
    end
    object editArq: TEdit
      Left = 16
      Top = 32
      Width = 369
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 166
    Width = 455
    Height = 47
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 128
      Top = 8
      Width = 77
      Height = 26
      Action = actEnviar
      Caption = 'F2 - Enviar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Action = actFechar
      Caption = 'F3 - Fechar'
      TabOrder = 1
    end
  end
  object edtEmail: TEdit
    Left = 8
    Top = 144
    Width = 201
    Height = 21
    TabOrder = 2
  end
  object OpenDialog1: TOpenDialog
    Left = 400
    Top = 72
  end
  object ActionList1: TActionList
    Left = 400
    Top = 176
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
end
