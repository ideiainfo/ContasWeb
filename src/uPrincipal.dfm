object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 588
  ClientWidth = 1097
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object MainMenu1: TMainMenu
    Left = 400
    Top = 224
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cadastro2: TMenuItem
        Caption = 'Tipo de Receitas-Despesas'
        OnClick = Cadastro2Click
      end
      object GrupodeReceitasDespesas1: TMenuItem
        Caption = 'Grupo de Receitas-Despesas'
        OnClick = GrupodeReceitasDespesas1Click
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
      end
      object Clientes2: TMenuItem
        Caption = 'Fornecedores'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = 'Sair'
        OnClick = N2Click
      end
    end
    object Movimento1: TMenuItem
      Caption = 'Movimento'
      object ContasaReceber1: TMenuItem
        Caption = 'Contas a Receber'
      end
      object ContasaReceber2: TMenuItem
        Caption = 'Contas a Pagar'
      end
      object MovimentodeCaixa1: TMenuItem
        Caption = 'Movimento de Caixa'
      end
    end
    object MovimentodeCaixa2: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelaodeTiposdeReceitaseDespesas1: TMenuItem
        Caption = 'Rela'#231#227'o de Tipos de Receitas e Despesas'
        OnClick = RelaodeTiposdeReceitaseDespesas1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Contasapagarporvencimento1: TMenuItem
        Caption = 'Contas a pagar por vencimento'
      end
      object Contasapagarporvencimento2: TMenuItem
        Caption = 'Contas a receber por vencimento'
      end
      object FluxodeCaixa1: TMenuItem
        Caption = 'Fluxo de Caixa'
      end
    end
  end
end
