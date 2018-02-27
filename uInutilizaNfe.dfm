object telaInutilizaNfe: TtelaInutilizaNfe
  Left = 192
  Top = 124
  Width = 813
  Height = 491
  Caption = 'Inutilizar NFe'
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
    Left = 16
    Top = 8
    Width = 393
    Height = 369
    TabOrder = 0
    object Label6: TLabel
      Left = 16
      Top = 116
      Width = 55
      Height = 13
      Caption = 'Justificativa'
    end
    object Label5: TLabel
      Left = 138
      Top = 71
      Width = 62
      Height = 13
      Caption = 'N'#250'mero Final'
    end
    object Label4: TLabel
      Left = 16
      Top = 72
      Width = 67
      Height = 13
      Caption = 'N'#250'mero Inicial'
    end
    object Label3: TLabel
      Left = 128
      Top = 23
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label2: TLabel
      Left = 72
      Top = 23
      Width = 24
      Height = 13
      Caption = 'S'#233'rie'
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Modelo'
    end
    object Label7: TLabel
      Left = 216
      Top = 24
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object edtNumFin: TEdit
      Left = 138
      Top = 87
      Width = 119
      Height = 21
      TabOrder = 0
    end
    object edtNumIni: TEdit
      Left = 16
      Top = 88
      Width = 113
      Height = 21
      TabOrder = 1
    end
    object edtAno: TEdit
      Left = 128
      Top = 39
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object edtSerie: TEdit
      Left = 72
      Top = 39
      Width = 49
      Height = 21
      TabOrder = 3
    end
    object edtModelo: TEdit
      Left = 16
      Top = 40
      Width = 49
      Height = 21
      TabOrder = 4
    end
    object memoJustificativa: TMemo
      Left = 16
      Top = 136
      Width = 361
      Height = 217
      TabOrder = 5
    end
    object edtCnpj: TEdit
      Left = 216
      Top = 40
      Width = 169
      Height = 21
      TabOrder = 6
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 396
    Width = 797
    Height = 57
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 128
      Top = 16
      Width = 75
      Height = 25
      Action = actEnviar
      Caption = 'F2 - Enviar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 224
      Top = 16
      Width = 75
      Height = 25
      Action = actFechar
      Caption = 'F3 - Fechar'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 416
    Top = 8
    Width = 361
    Height = 369
    Caption = 'Retorno'
    TabOrder = 2
    object memoRetorno: TMemo
      Left = 8
      Top = 24
      Width = 345
      Height = 337
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 376
    Top = 404
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
