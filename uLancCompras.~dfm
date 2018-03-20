object telaLancCompras: TtelaLancCompras
  Left = 251
  Top = 76
  Width = 1008
  Height = 593
  Caption = 'Lan'#231'amento de Compras'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 992
    Height = 555
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Lan'#231'amento'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 984
        Height = 527
        Align = alClient
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 8
          Top = 16
          Width = 609
          Height = 105
          TabOrder = 0
          object Label9: TLabel
            Left = 8
            Top = 8
            Width = 9
            Height = 13
            Caption = 'Id'
            FocusControl = editId
          end
          object Label11: TLabel
            Left = 8
            Top = 48
            Width = 118
            Height = 13
            Caption = 'Data e Hora do Cadastro'
          end
          object Label13: TLabel
            Left = 304
            Top = 48
            Width = 115
            Height = 13
            Caption = 'Data e Hora de Emiss'#227'o'
          end
          object editId: TDBEdit
            Left = 8
            Top = 24
            Width = 134
            Height = 21
            DataField = 'ID'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 0
          end
          object editDtCad: TDBEdit
            Left = 8
            Top = 72
            Width = 257
            Height = 21
            DataField = 'DATA_COMPRA'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 1
          end
          object editDtEmissao: TDBEdit
            Left = 304
            Top = 72
            Width = 249
            Height = 21
            DataField = 'DATA_ENTREGA'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 2
          end
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 128
          Width = 609
          Height = 57
          Caption = 'Fornecedor'
          TabOrder = 1
          object Label20: TLabel
            Left = 128
            Top = 24
            Width = 17
            Height = 13
            Caption = 'nCli'
            FocusControl = cbFornecedor
          end
          object editIdFornecedor: TDBEdit
            Left = 8
            Top = 24
            Width = 57
            Height = 21
            DataField = 'ID_FORNECEDOR'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 0
          end
          object cbFornecedor: TDBLookupComboBox
            Left = 72
            Top = 24
            Width = 505
            Height = 21
            DataField = 'nFor'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 1
          end
        end
        object radTpPg: TRadioGroup
          Left = 8
          Top = 192
          Width = 609
          Height = 113
          Caption = 'Tipo de Pagamento'
          Columns = 3
          Enabled = False
          Items.Strings = (
            '&0 - Dinheiro'
            '&1 - Cheque'
            '&2 - Cart'#227'o'
            '&3 - NP'
            '&4 - Carn'#234
            '&5 - Boleto'
            '&6 - Outros')
          TabOrder = 2
        end
        object GroupBox4: TGroupBox
          Left = 624
          Top = 16
          Width = 185
          Height = 321
          TabOrder = 3
          object Label15: TLabel
            Left = 8
            Top = 16
            Width = 69
            Height = 13
            Caption = 'Valor Produtos'
            FocusControl = editValProd
          end
          object Label16: TLabel
            Left = 8
            Top = 64
            Width = 58
            Height = 13
            Caption = 'Desconto (-)'
            FocusControl = editDesc
          end
          object Label17: TLabel
            Left = 8
            Top = 112
            Width = 64
            Height = 13
            Caption = 'Acr'#233'scimo (+)'
            FocusControl = editAsc
          end
          object Label18: TLabel
            Left = 8
            Top = 160
            Width = 96
            Height = 13
            Caption = 'Outras Despesas (+)'
            FocusControl = editOutrasDesp
          end
          object Label19: TLabel
            Left = 8
            Top = 208
            Width = 66
            Height = 13
            Caption = 'Valor Total (=)'
            FocusControl = editVtotal
          end
          object editValProd: TDBEdit
            Left = 8
            Top = 32
            Width = 167
            Height = 21
            DataField = 'VALOR'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 0
          end
          object editDesc: TDBEdit
            Left = 8
            Top = 80
            Width = 165
            Height = 21
            DataField = 'DESCONTO'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 1
          end
          object editAsc: TDBEdit
            Left = 8
            Top = 128
            Width = 164
            Height = 21
            DataField = 'ACRESCIO'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 2
          end
          object editOutrasDesp: TDBEdit
            Left = 8
            Top = 176
            Width = 165
            Height = 21
            DataField = 'OUTRAS_DESPESAS'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 3
          end
          object editVtotal: TDBEdit
            Left = 8
            Top = 224
            Width = 164
            Height = 21
            DataField = 'VALOR_TOTAL'
            DataSource = telaDados.dsCompras
            Enabled = False
            TabOrder = 4
          end
        end
        object btnIncItem: TBitBtn
          Left = 8
          Top = 312
          Width = 145
          Height = 25
          Caption = 'Incluir Item'
          Enabled = False
          TabOrder = 4
          OnClick = btnIncItemClick
        end
        object btnExcItem: TBitBtn
          Left = 164
          Top = 312
          Width = 145
          Height = 25
          Caption = 'Excluir Item'
          Enabled = False
          TabOrder = 5
        end
        object btnFinPed: TBitBtn
          Left = 319
          Top = 312
          Width = 145
          Height = 25
          Caption = '&Finalizar Pedido'
          Enabled = False
          TabOrder = 6
        end
        object btnRetPed: TBitBtn
          Left = 472
          Top = 312
          Width = 145
          Height = 25
          Caption = 'Retornar Pedido Finalizado'
          Enabled = False
          TabOrder = 7
        end
        object btnIncluir: TBitBtn
          Left = 816
          Top = 24
          Width = 151
          Height = 25
          Action = Incluir
          Caption = 'F2 - &Incluir'
          TabOrder = 8
        end
        object btnExcluir: TBitBtn
          Left = 816
          Top = 64
          Width = 151
          Height = 25
          Action = Excluir
          Caption = 'F3 - E&xcluir'
          TabOrder = 9
        end
        object btnConfirmar: TBitBtn
          Left = 816
          Top = 104
          Width = 151
          Height = 25
          Action = Confirmar
          Caption = 'F4 - &Confirmar'
          TabOrder = 10
        end
        object btnCancelar: TBitBtn
          Left = 816
          Top = 144
          Width = 151
          Height = 25
          Action = Cancelar
          Caption = 'F5 - C&ancelar'
          TabOrder = 11
        end
        object btnPesquisar: TBitBtn
          Left = 816
          Top = 184
          Width = 151
          Height = 25
          Action = Pesquisar
          Caption = 'F6 - &Pesquisar'
          TabOrder = 12
        end
        object btnImprimir: TBitBtn
          Left = 816
          Top = 224
          Width = 151
          Height = 25
          Action = Imprimir
          Caption = 'F7 - I&mprimir'
          TabOrder = 13
        end
        object btnEncerrar: TBitBtn
          Left = 816
          Top = 264
          Width = 151
          Height = 25
          Action = Encerrar
          Caption = 'F10 - &Fechar'
          TabOrder = 14
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 344
          Width = 961
          Height = 168
          DataSource = telaDados.dsCTempItens
          Enabled = False
          TabOrder = 15
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANTIDADE'
              Title.Caption = 'Quantidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Valor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCONTO'
              Title.Caption = 'Desconto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACRESCIMO'
              Title.Caption = 'Acr'#233'scio'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL'
              Title.Caption = 'Valor Total'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGEM'
              Title.Caption = 'Margem'
              Visible = True
            end>
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Endere'#231'o de Entrega'
      ImageIndex = 1
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 984
        Height = 527
        Align = alClient
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 64
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = editEendereco
        end
        object Label2: TLabel
          Left = 8
          Top = 112
          Width = 64
          Height = 13
          Caption = 'Complemento'
          FocusControl = editEcompl
        end
        object Label3: TLabel
          Left = 416
          Top = 64
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = editEnum
        end
        object Label4: TLabel
          Left = 296
          Top = 112
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = editEbairro
        end
        object Label5: TLabel
          Left = 8
          Top = 160
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = editEcidade
        end
        object Label6: TLabel
          Left = 376
          Top = 161
          Width = 14
          Height = 13
          Caption = 'UF'
          FocusControl = editEuf
        end
        object Label7: TLabel
          Left = 424
          Top = 160
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = editEcep
        end
        object Label8: TLabel
          Left = 8
          Top = 16
          Width = 41
          Height = 13
          Caption = 'Emitente'
          FocusControl = editEemitente
        end
        object editEendereco: TDBEdit
          Left = 8
          Top = 80
          Width = 394
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 0
        end
        object editEcompl: TDBEdit
          Left = 8
          Top = 128
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMPLEMENTO'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 1
        end
        object editEnum: TDBEdit
          Left = 416
          Top = 80
          Width = 145
          Height = 21
          CharCase = ecUpperCase
          DataField = 'NUMERO'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 2
        end
        object editEbairro: TDBEdit
          Left = 296
          Top = 128
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'BAIRRO'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 3
        end
        object editEcidade: TDBEdit
          Left = 8
          Top = 176
          Width = 353
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CIDADE'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 4
        end
        object editEuf: TDBEdit
          Left = 376
          Top = 175
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UF'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 5
        end
        object editEcep: TDBEdit
          Left = 424
          Top = 176
          Width = 134
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CEP'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 6
        end
        object editEemitente: TDBEdit
          Left = 8
          Top = 32
          Width = 553
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RAZ_SOC'
          DataSource = telaDados.dsEmitente
          Enabled = False
          TabOrder = 7
        end
        object BitBtn5: TBitBtn
          Left = 8
          Top = 216
          Width = 75
          Height = 25
          Caption = 'Confirmar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
      end
    end
  end
  object ActionList1: TActionList
    Left = 924
    Top = 336
    object Incluir: TAction
      Caption = 'F2 - &Incluir'
      ShortCut = 113
      OnExecute = IncluirExecute
    end
    object Cancelar: TAction
      Caption = 'F5 - C&ancelar'
      Enabled = False
      ShortCut = 116
      OnExecute = CancelarExecute
    end
    object Pesquisar: TAction
      Caption = 'F6 - &Pesquisar'
      ShortCut = 117
    end
    object Imprimir: TAction
      Caption = 'F7 - I&mprimir'
      ShortCut = 118
    end
    object Encerrar: TAction
      Caption = 'F10 - &Fechar'
      ShortCut = 121
      OnExecute = EncerrarExecute
    end
    object Confirmar: TAction
      Caption = 'F4 - &Confirmar'
      Enabled = False
      ShortCut = 115
      OnExecute = ConfirmarExecute
    end
    object Excluir: TAction
      Caption = 'F3 - E&xcluir'
      Enabled = False
      ShortCut = 114
    end
  end
end
