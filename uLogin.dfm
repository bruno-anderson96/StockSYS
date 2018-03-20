object telaLogin: TtelaLogin
  Left = 275
  Top = 161
  Width = 698
  Height = 164
  Caption = 'Login'
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
  object btnFechar: TSpeedButton
    Left = 616
    Top = 80
    Width = 49
    Height = 25
    Caption = 'Fechar'
  end
  object btnLogin: TSpeedButton
    Left = 616
    Top = 32
    Width = 49
    Height = 41
    Caption = 'Entrar'
  end
  object Label1: TLabel
    Left = 208
    Top = 24
    Width = 33
    Height = 13
    Caption = 'LOGIN'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 208
    Top = 64
    Width = 37
    Height = 13
    Caption = 'SENHA'
    FocusControl = DBEdit2
  end
  object DBEdit1: TDBEdit
    Left = 208
    Top = 40
    Width = 394
    Height = 21
    DataField = 'LOGIN'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 208
    Top = 80
    Width = 393
    Height = 21
    DataField = 'SENHA'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = telaDados.tblConta
    Left = 8
    Top = 8
  end
end
