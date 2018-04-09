object telaCadEmit: TtelaCadEmit
  Left = 714
  Top = 174
  Width = 451
  Height = 416
  Caption = 'Cadastro Emitente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 378
    Align = alClient
    TabOrder = 0
    object Label8: TLabel
      Left = 16
      Top = 230
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object TLabel
      Left = 14
      Top = 88
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object btnSalvar: TSpeedButton
      Left = 176
      Top = 336
      Width = 97
      Height = 25
      Caption = 'Salvar'
      OnClick = btnSalvarClick
    end
    object Label1: TLabel
      Left = 14
      Top = 113
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object Label10: TLabel
      Left = 16
      Top = 255
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label12: TLabel
      Left = 16
      Top = 13
      Width = 26
      Height = 13
      Caption = 'Login'
      FocusControl = edtLogin
    end
    object Label13: TLabel
      Left = 16
      Top = 35
      Width = 31
      Height = 13
      Caption = 'Senha'
      FocusControl = edtSenha
    end
    object Label16: TLabel
      Left = 16
      Top = 279
      Width = 69
      Height = 13
      Caption = 'C'#243'd.Munic'#237'pio'
    end
    object Label2: TLabel
      Left = 17
      Top = 137
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object Label21: TLabel
      Left = 16
      Top = 302
      Width = 25
      Height = 13
      Caption = 'Email'
      FocusControl = edtEmailEmitente
    end
    object Label3: TLabel
      Left = 239
      Top = 140
      Width = 50
      Height = 13
      Caption = 'I. Estadual'
    end
    object Label4: TLabel
      Left = 16
      Top = 160
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 352
      Top = 162
      Width = 25
      Height = 13
      Caption = 'Num.'
    end
    object Label6: TLabel
      Left = 16
      Top = 182
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label7: TLabel
      Left = 16
      Top = 206
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label9: TLabel
      Left = 371
      Top = 232
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object edtBairro: TDBEdit
      Left = 93
      Top = 182
      Width = 333
      Height = 21
      DataField = 'BAIRRO'
      DataSource = telaDados.dsEmitente
      TabOrder = 8
    end
    object edtCep: TDBEdit
      Left = 93
      Top = 206
      Width = 153
      Height = 21
      DataField = 'CEP'
      DataSource = telaDados.dsEmitente
      TabOrder = 9
    end
    object edtCidade: TDBEdit
      Left = 92
      Top = 230
      Width = 273
      Height = 21
      DataField = 'CIDADE'
      DataSource = telaDados.dsEmitente
      TabOrder = 10
    end
    object edtCnpj: TDBEdit
      Left = 95
      Top = 134
      Width = 137
      Height = 21
      DataField = 'CNPJ'
      DataSource = telaDados.dsEmitente
      TabOrder = 4
    end
    object edtCodMun: TDBEdit
      Left = 93
      Top = 278
      Width = 112
      Height = 21
      DataField = 'CODMUN'
      DataSource = telaDados.dsEmitente
      TabOrder = 13
    end
    object edtEmailEmitente: TDBEdit
      Left = 91
      Top = 302
      Width = 338
      Height = 21
      DataField = 'EMAIL'
      DataSource = telaDados.dsEmitente
      TabOrder = 14
    end
    object edtEndereco: TDBEdit
      Left = 94
      Top = 158
      Width = 249
      Height = 21
      DataField = 'ENDERECO'
      DataSource = telaDados.dsEmitente
      TabOrder = 6
    end
    object edtInscEst: TDBEdit
      Left = 293
      Top = 134
      Width = 132
      Height = 21
      DataField = 'INSCEST'
      DataSource = telaDados.dsEmitente
      TabOrder = 5
    end
    object edtLogin: TDBEdit
      Left = 97
      Top = 8
      Width = 238
      Height = 21
      DataField = 'LOGIN'
      DataSource = telaDados.dsLogin
      TabOrder = 0
    end
    object edtNomeFan: TDBEdit
      Left = 95
      Top = 110
      Width = 332
      Height = 21
      DataField = 'FANTASIA'
      DataSource = telaDados.dsEmitente
      TabOrder = 3
    end
    object edtNum: TDBEdit
      Left = 384
      Top = 158
      Width = 41
      Height = 21
      DataField = 'NUMERO'
      DataSource = telaDados.dsEmitente
      TabOrder = 7
    end
    object edtRazSoc: TDBEdit
      Left = 96
      Top = 86
      Width = 332
      Height = 21
      DataField = 'RAZ_SOC'
      DataSource = telaDados.dsEmitente
      TabOrder = 2
    end
    object edtSenha: TDBEdit
      Left = 97
      Top = 32
      Width = 238
      Height = 21
      DataField = 'SENHA'
      DataSource = telaDados.dsLogin
      TabOrder = 1
    end
    object edtTelefone: TDBEdit
      Left = 93
      Top = 254
      Width = 160
      Height = 21
      DataField = 'TELEFONE'
      DataSource = telaDados.dsEmitente
      TabOrder = 12
    end
    object edtUf: TDBEdit
      Left = 395
      Top = 230
      Width = 30
      Height = 21
      DataField = 'UF'
      DataSource = telaDados.dsEmitente
      TabOrder = 11
    end
  end
end
