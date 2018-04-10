object telaConfigEmit: TtelaConfigEmit
  Left = 76
  Top = 187
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
      Left = 13
      Top = 10
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object Label1: TLabel
      Left = 13
      Top = 35
      Width = 71
      Height = 13
      Caption = 'Nome Fantasia'
    end
    object Label2: TLabel
      Left = 16
      Top = 59
      Width = 27
      Height = 13
      Caption = 'CNPJ'
    end
    object Label3: TLabel
      Left = 239
      Top = 62
      Width = 50
      Height = 13
      Caption = 'I. Estadual'
    end
    object Label4: TLabel
      Left = 15
      Top = 82
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 352
      Top = 84
      Width = 25
      Height = 13
      Caption = 'Num.'
    end
    object Label6: TLabel
      Left = 15
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label7: TLabel
      Left = 15
      Top = 128
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label8: TLabel
      Left = 15
      Top = 152
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label9: TLabel
      Left = 375
      Top = 154
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object Label10: TLabel
      Left = 15
      Top = 177
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label16: TLabel
      Left = 15
      Top = 201
      Width = 69
      Height = 13
      Caption = 'C'#243'd.Munic'#237'pio'
    end
    object Label21: TLabel
      Left = 16
      Top = 224
      Width = 25
      Height = 13
      Caption = 'Email'
      FocusControl = edtEmailEmitente
    end
    object btnSalvar: TSpeedButton
      Left = 200
      Top = 328
      Width = 65
      Height = 25
      Caption = 'Salvar'
      OnClick = btnSalvarClick
    end
    object btnEditar: TSpeedButton
      Left = 128
      Top = 328
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
    object Label11: TLabel
      Left = 16
      Top = 250
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object edtRazSoc: TDBEdit
      Left = 95
      Top = 8
      Width = 332
      Height = 21
      DataField = 'RAZ_SOC'
      DataSource = telaDados.dsEmitente
      TabOrder = 0
    end
    object edtNomeFan: TDBEdit
      Left = 95
      Top = 32
      Width = 332
      Height = 21
      DataField = 'FANTASIA'
      DataSource = telaDados.dsEmitente
      TabOrder = 1
    end
    object edtInscEst: TDBEdit
      Left = 295
      Top = 56
      Width = 132
      Height = 21
      DataField = 'INSCEST'
      DataSource = telaDados.dsEmitente
      TabOrder = 2
    end
    object edtCnpj: TDBEdit
      Left = 95
      Top = 56
      Width = 137
      Height = 21
      DataField = 'CNPJ'
      DataSource = telaDados.dsEmitente
      TabOrder = 3
    end
    object edtEndereco: TDBEdit
      Left = 95
      Top = 80
      Width = 249
      Height = 21
      DataField = 'ENDERECO'
      DataSource = telaDados.dsEmitente
      TabOrder = 4
    end
    object edtNum: TDBEdit
      Left = 386
      Top = 80
      Width = 41
      Height = 21
      DataField = 'NUMERO'
      DataSource = telaDados.dsEmitente
      TabOrder = 5
    end
    object edtBairro: TDBEdit
      Left = 94
      Top = 104
      Width = 333
      Height = 21
      DataField = 'BAIRRO'
      DataSource = telaDados.dsEmitente
      TabOrder = 6
    end
    object edtCep: TDBEdit
      Left = 94
      Top = 128
      Width = 153
      Height = 21
      DataField = 'CEP'
      DataSource = telaDados.dsEmitente
      TabOrder = 7
    end
    object edtCidade: TDBEdit
      Left = 93
      Top = 152
      Width = 273
      Height = 21
      DataField = 'CIDADE'
      DataSource = telaDados.dsEmitente
      TabOrder = 8
    end
    object edtUf: TDBEdit
      Left = 399
      Top = 152
      Width = 30
      Height = 21
      DataField = 'UF'
      DataSource = telaDados.dsEmitente
      TabOrder = 9
    end
    object edtTelefone: TDBEdit
      Left = 92
      Top = 176
      Width = 160
      Height = 21
      DataField = 'TELEFONE'
      DataSource = telaDados.dsEmitente
      TabOrder = 10
    end
    object edtCodMun: TDBEdit
      Left = 92
      Top = 200
      Width = 112
      Height = 21
      DataField = 'CODMUN'
      DataSource = telaDados.dsEmitente
      TabOrder = 11
    end
    object edtEmailEmitente: TDBEdit
      Left = 92
      Top = 224
      Width = 338
      Height = 21
      DataField = 'EMAIL'
      DataSource = telaDados.dsEmitente
      TabOrder = 12
    end
    object cbEmpresa: TDBComboBox
      Left = 92
      Top = 249
      Width = 169
      Height = 21
      DataField = 'TIPOEMP'
      DataSource = telaDados.dsEmitente
      ItemHeight = 13
      Items.Strings = (
        'Microempresa Municipal'
        'Microempreendedor Individual'
        'Empresa de Pequeno Porte')
      TabOrder = 13
    end
    object radReg: TDBRadioGroup
      Left = 264
      Top = 244
      Width = 167
      Height = 77
      Caption = 'Regime Tribut'#225'rio'
      DataField = 'REGIME'
      DataSource = telaDados.dsEmitente
      Items.Strings = (
        'Normal'
        'Simples Nacional')
      TabOrder = 14
      Values.Strings = (
        'Normal'
        'Simples Nacional')
    end
  end
end
