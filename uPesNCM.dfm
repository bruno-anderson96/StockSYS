object telaPesNCM: TtelaPesNCM
  Left = 288
  Top = 173
  Width = 786
  Height = 288
  Caption = 'Pesquisa NCM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 770
    Height = 250
    Align = alClient
    DataSource = telaDados.dsNCM
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'CODNCM'
        Title.Caption = 'C'#243'digo NCM'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCCATNCM'
        Title.Caption = 'Categoria'
        Width = 316
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCNCM'
        Title.Caption = 'Descri'#231#227'o'
        Width = 265
        Visible = True
      end>
  end
end
