object telaPrincipal: TtelaPrincipal
  Left = 58
  Top = 60
  Width = 932
  Height = 400
  Caption = 'Projeto NFe - ACBr'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 856
    Top = 8
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Cadastro1: TMenuItem
        Caption = 'Cadastro'
        object Clientes1: TMenuItem
          Caption = 'Clientes'
          OnClick = Clientes1Click
        end
        object Produtos1: TMenuItem
          Caption = 'Produtos'
          OnClick = Produtos1Click
        end
        object Unidade1: TMenuItem
          Caption = 'Unidade'
          OnClick = Unidade1Click
        end
        object Fornecedores1: TMenuItem
          Caption = 'Fornecedores'
          OnClick = Fornecedores1Click
        end
      end
      object LanamentodePedidos1: TMenuItem
        Caption = 'Lan'#231'amento de Pedidos'
        OnClick = LanamentodePedidos1Click
      end
      object LanamentodeCompras1: TMenuItem
        Caption = 'Lan'#231'amento de Compras'
        OnClick = LanamentodeCompras1Click
      end
      object NFe1: TMenuItem
        Caption = 'NFe'
        object StatusdeServio1: TMenuItem
          Caption = 'Status de Servi'#231'o'
          OnClick = StatusdeServio1Click
        end
        object CriareEnviarNFe1: TMenuItem
          Caption = 'Criar e Enviar NFe'
          OnClick = CriareEnviarNFe1Click
        end
        object GErarNfe1: TMenuItem
          Caption = 'Gerar NFe'
          OnClick = GErarNfe1Click
        end
        object ValidarXML1: TMenuItem
          Caption = 'Validar XML'
          OnClick = ValidarXML1Click
        end
        object CancelamentoNFe1: TMenuItem
          Caption = 'Cancelamento NFe'
          OnClick = CancelamentoNFe1Click
        end
        object InutilizarNumerao1: TMenuItem
          Caption = 'Inutilizar Numera'#231#227'o'
          OnClick = InutilizarNumerao1Click
        end
        object Consultas1: TMenuItem
          Caption = 'Consultas'
        end
        object ImprimirDanfe1: TMenuItem
          Caption = 'Imprimir Danfe'
          OnClick = ImprimirDanfe1Click
        end
        object EnviarDPEC1: TMenuItem
          Caption = 'Enviar DPEC'
        end
        object EnviarEmailNFe1: TMenuItem
          Caption = 'Enviar Email NFe'
          OnClick = EnviarEmailNFe1Click
        end
        object GerarNFeEntrada1: TMenuItem
          Caption = 'Gerar NFe - Entrada'
          OnClick = GerarNFeEntrada1Click
        end
      end
    end
    object Configuraes1: TMenuItem
      Caption = 'Configura'#231#245'es'
      OnClick = Configuraes1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
