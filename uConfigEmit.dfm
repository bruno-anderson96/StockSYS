object telaConfigEmit: TtelaConfigEmit
  Left = 227
  Top = 171
  Width = 468
  Height = 418
  Caption = 'Emitente'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 380
    Align = alClient
    TabOrder = 0
    object TLabel
      Left = 14
      Top = 34
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object Label1: TLabel
      Left = 14
      Top = 59
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object Label2: TLabel
      Left = 17
      Top = 83
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object Label3: TLabel
      Left = 240
      Top = 86
      Width = 50
      Height = 13
      Caption = 'I. Estadual'
    end
    object Label4: TLabel
      Left = 16
      Top = 106
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 353
      Top = 108
      Width = 25
      Height = 13
      Caption = 'Num.'
    end
    object Label6: TLabel
      Left = 16
      Top = 128
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label7: TLabel
      Left = 16
      Top = 152
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label8: TLabel
      Left = 16
      Top = 176
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 376
      Top = 178
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label10: TLabel
      Left = 16
      Top = 201
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label16: TLabel
      Left = 16
      Top = 225
      Width = 69
      Height = 13
      Caption = 'C'#243'd.Munic'#237'pio'
    end
    object Label21: TLabel
      Left = 16
      Top = 248
      Width = 25
      Height = 13
      Caption = 'Email'
      FocusControl = edtEmailEmitente
    end
    object btnSalvar: TSpeedButton
      Left = 200
      Top = 296
      Width = 65
      Height = 25
      Caption = 'Salvar'
      OnClick = btnSalvarClick
    end
    object btnEditar: TSpeedButton
      Left = 128
      Top = 296
      Width = 65
      Height = 24
      Caption = 'Editar'
      OnClick = btnEditarClick
    end
    object btnCadastrar: TSpeedButton
      Left = 360
      Top = 344
      Width = 89
      Height = 33
      Caption = 'Cadastrar'
      Visible = False
      OnClick = btnCadastrarClick
    end
    object edtRazSoc: TDBEdit
      Left = 96
      Top = 32
      Width = 332
      Height = 21
      DataField = 'RAZ_SOC'
      DataSource = telaDados.dsEmitente
      TabOrder = 0
    end
    object edtNomeFan: TDBEdit
      Left = 96
      Top = 56
      Width = 332
      Height = 21
      DataField = 'FANTASIA'
      DataSource = telaDados.dsEmitente
      TabOrder = 1
    end
    object edtInscEst: TDBEdit
      Left = 296
      Top = 80
      Width = 132
      Height = 21
      DataField = 'INSCEST'
      DataSource = telaDados.dsEmitente
      TabOrder = 2
    end
    object edtCnpj: TDBEdit
      Left = 96
      Top = 80
      Width = 137
      Height = 21
      DataField = 'CNPJ'
      DataSource = telaDados.dsEmitente
      TabOrder = 3
    end
    object edtEndereco: TDBEdit
      Left = 96
      Top = 104
      Width = 249
      Height = 21
      DataField = 'ENDERECO'
      DataSource = telaDados.dsEmitente
      TabOrder = 4
    end
    object edtNum: TDBEdit
      Left = 387
      Top = 104
      Width = 41
      Height = 21
      DataField = 'NUMERO'
      DataSource = telaDados.dsEmitente
      TabOrder = 5
    end
    object edtBairro: TDBEdit
      Left = 95
      Top = 128
      Width = 333
      Height = 21
      DataField = 'BAIRRO'
      DataSource = telaDados.dsEmitente
      TabOrder = 6
    end
    object edtCep: TDBEdit
      Left = 95
      Top = 152
      Width = 153
      Height = 21
      DataField = 'CEP'
      DataSource = telaDados.dsEmitente
      TabOrder = 7
    end
    object edtCidade: TDBEdit
      Left = 94
      Top = 176
      Width = 273
      Height = 21
      DataField = 'CIDADE'
      DataSource = telaDados.dsEmitente
      TabOrder = 8
    end
    object edtUf: TDBEdit
      Left = 400
      Top = 176
      Width = 30
      Height = 21
      DataField = 'UF'
      DataSource = telaDados.dsEmitente
      TabOrder = 9
    end
    object edtTelefone: TDBEdit
      Left = 93
      Top = 200
      Width = 160
      Height = 21
      DataField = 'TELEFONE'
      DataSource = telaDados.dsEmitente
      TabOrder = 10
    end
    object edtCodMun: TDBEdit
      Left = 93
      Top = 224
      Width = 112
      Height = 21
      DataField = 'CODMUN'
      DataSource = telaDados.dsEmitente
      TabOrder = 11
    end
    object edtEmailEmitente: TDBEdit
      Left = 92
      Top = 248
      Width = 338
      Height = 21
      DataField = 'EMAIL'
      DataSource = telaDados.dsEmitente
      TabOrder = 12
    end
  end
end
