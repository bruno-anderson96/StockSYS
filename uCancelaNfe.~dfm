object telaCancelaNFe: TtelaCancelaNFe
  Left = 168
  Top = 283
  Width = 617
  Height = 304
  Caption = 'Cancelar NFe'
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
    Top = 168
    Width = 94
    Height = 13
    Caption = 'N'#250'mero do Protcolo'
  end
  object Label2: TLabel
    Left = 232
    Top = 168
    Width = 55
    Height = 13
    Caption = 'Justificativa'
  end
  object gbNFe: TGroupBox
    Left = 8
    Top = 8
    Width = 585
    Height = 153
    Caption = 'Notas Fiscais Eletr'#244'nicas'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 561
      Height = 120
      DataSource = telaDados.dsPesPedidos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PEDIDO_NUM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_PEDIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAVENFE'
          Visible = True
        end>
    end
  end
  object edtProtocolo: TEdit
    Left = 8
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtJustificativa: TEdit
    Left = 232
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 225
    Width = 601
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Action = actCancelar
      Caption = 'F2 - Cancelar'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Action = actFechar
      Caption = 'F3 - Fechar'
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 568
    Top = 241
    object actCancelar: TAction
      Caption = 'F2 - Cancelar'
      ShortCut = 113
      OnExecute = actCancelarExecute
    end
    object actFechar: TAction
      Caption = 'F3 - Fechar'
      ShortCut = 114
      OnExecute = actFecharExecute
    end
  end
end
