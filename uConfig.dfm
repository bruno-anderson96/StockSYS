object telaConfig: TtelaConfig
  Left = 608
  Top = 26
  Width = 473
  Height = 688
  Caption = 'Configura'#231#227'o NFe'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 609
    Width = 457
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnConfirmar: TBitBtn
      Left = 104
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnFechar: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object BitBtn1: TBitBtn
      Left = 372
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Novo Emitente'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 457
    Height = 609
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = '&1 - Geral'
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 581
        Align = alClient
        TabOrder = 0
        object GroupBox5: TGroupBox
          Left = 8
          Top = 264
          Width = 273
          Height = 49
          Caption = 'Caminho de arquivo'
          TabOrder = 0
          object btnEscolherCaminho2: TSpeedButton
            Left = 240
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
            OnClick = btnEscolherCaminho2Click
          end
          object edtCaminhoArq: TEdit
            Left = 8
            Top = 16
            Width = 225
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 8
          Top = 168
          Width = 273
          Height = 65
          Caption = 'Logomarca'
          TabOrder = 1
          object btnEscolherCaminho: TSpeedButton
            Left = 240
            Top = 24
            Width = 23
            Height = 22
            Caption = '...'
            OnClick = btnEscolherCaminhoClick
          end
          object edtLogomarca: TEdit
            Left = 8
            Top = 24
            Width = 225
            Height = 21
            TabOrder = 0
          end
        end
        object chArquivos: TCheckBox
          Left = 8
          Top = 240
          Width = 281
          Height = 17
          Caption = 'Salvar Arquivos de Envio e Resposta'
          TabOrder = 2
        end
        object radioFormas: TRadioGroup
          Left = 8
          Top = 16
          Width = 273
          Height = 145
          Caption = 'Forma de Emiss'#227'o'
          Items.Strings = (
            'Normal'
            'DPEC'
            'Conting'#234'ncia'
            'SCAN'
            'FSDA')
          TabOrder = 3
        end
        object Schemas: TGroupBox
          Left = 8
          Top = 320
          Width = 273
          Height = 49
          Caption = 'Schemas'
          TabOrder = 4
          object SpeedButton1: TSpeedButton
            Left = 240
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
            OnClick = SpeedButton1Click
          end
          object edtCaminhoSchemas: TEdit
            Left = 8
            Top = 16
            Width = 225
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&2 - Certificado'
      ImageIndex = 1
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 581
        Align = alClient
        TabOrder = 0
        object GroupBox6: TGroupBox
          Left = 8
          Top = 16
          Width = 289
          Height = 46
          Caption = 'Caminho de Certificado'
          TabOrder = 0
          object btnCaminhoCert: TSpeedButton
            Left = 256
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
            OnClick = btnCaminhoCertClick
          end
          object edtCaminhoCert: TEdit
            Left = 8
            Top = 16
            Width = 241
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox7: TGroupBox
          Left = 8
          Top = 64
          Width = 169
          Height = 44
          Caption = 'Senha'
          TabOrder = 1
          object edtSenha: TEdit
            Left = 8
            Top = 16
            Width = 153
            Height = 21
            TabOrder = 0
          end
        end
        object GroupBox8: TGroupBox
          Left = 8
          Top = 111
          Width = 169
          Height = 45
          Caption = 'N'#250'mero de S'#233'rie'
          TabOrder = 2
          object edtNumSer: TEdit
            Left = 8
            Top = 16
            Width = 153
            Height = 21
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&3 - WebService'
      ImageIndex = 3
      object GroupBox9: TGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 581
        Align = alClient
        TabOrder = 0
        object Label11: TLabel
          Left = 9
          Top = 18
          Width = 14
          Height = 13
          Caption = 'UF'
        end
        object edtUfws: TEdit
          Left = 32
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object radioAmbiente: TRadioGroup
          Left = 8
          Top = 40
          Width = 186
          Height = 52
          Caption = 'Ambiente de Destino'
          Items.Strings = (
            'Produ'#231#227'o'
            'Homologa'#231#227'o')
          TabOrder = 1
        end
        object GroupBox10: TGroupBox
          Left = 8
          Top = 96
          Width = 225
          Height = 153
          Caption = 'Conex'#227'o'
          TabOrder = 2
          object Label12: TLabel
            Left = 8
            Top = 26
            Width = 22
            Height = 13
            Caption = 'Host'
          end
          object Label13: TLabel
            Left = 8
            Top = 58
            Width = 25
            Height = 13
            Caption = 'Porta'
          end
          object Label14: TLabel
            Left = 8
            Top = 88
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
          end
          object Label15: TLabel
            Left = 8
            Top = 120
            Width = 31
            Height = 13
            Caption = 'Senha'
          end
          object edtHost: TEdit
            Left = 48
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edtPorta: TEdit
            Left = 48
            Top = 56
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edtUsuario: TEdit
            Left = 48
            Top = 88
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object edtSenhaws: TEdit
            Left = 48
            Top = 120
            Width = 121
            Height = 21
            TabOrder = 3
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = '&4 - Email'
      ImageIndex = 4
      object GroupBox11: TGroupBox
        Left = 0
        Top = 0
        Width = 449
        Height = 581
        Align = alClient
        TabOrder = 0
        object Label17: TLabel
          Left = 24
          Top = 16
          Width = 22
          Height = 13
          Caption = 'Host'
        end
        object Label18: TLabel
          Left = 24
          Top = 48
          Width = 25
          Height = 13
          Caption = 'Porta'
        end
        object Label19: TLabel
          Left = 24
          Top = 80
          Width = 36
          Height = 13
          Caption = 'Usu'#225'rio'
        end
        object Label20: TLabel
          Left = 24
          Top = 112
          Width = 31
          Height = 13
          Caption = 'Senha'
        end
        object edtEHost: TEdit
          Left = 80
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edtEPorta: TEdit
          Left = 80
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtEUsuario: TEdit
          Left = 80
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object edtESenha: TEdit
          Left = 80
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 3
        end
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 396
    Top = 416
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    WebService = wsCorreios
    PesquisarIBGE = True
    Left = 396
    Top = 448
  end
end
