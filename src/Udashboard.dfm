object FormDashboard: TFormDashboard
  Left = 0
  Top = 0
  Caption = 'FormDashboard'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 64
    Top = 48
    Width = 37
    Height = 15
    Caption = 'Vendas'
  end
  object Label2: TLabel
    Left = 256
    Top = 48
    Width = 63
    Height = 15
    Caption = 'Renova'#231#245'es'
  end
  object Label3: TLabel
    Left = 448
    Top = 48
    Width = 42
    Height = 15
    Caption = 'Clientes'
  end
  object lb_vendas: TLabel
    Left = 64
    Top = 69
    Width = 65
    Height = 28
    Caption = '100,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb_renovacoes: TLabel
    Left = 256
    Top = 69
    Width = 82
    Height = 28
    Caption = '3.250,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lb_clientes: TLabel
    Left = 448
    Top = 69
    Width = 36
    Height = 28
    Caption = '158'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edit_Vendas: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 0
    Text = '100,00'
    OnChange = edit_VendasChange
  end
  object memo_series: TMemo
    Left = 54
    Top = 128
    Width = 489
    Height = 217
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      '[{  "name": "Vendas",'
      '    "data": [100, 40, 28, 51, 42, 82, 56]'
      ' }, {'
      '    "name": "Renova'#231#245'es",'
      '    "data": [11, 32, 45, 32, 34, 52, 41]'
      ' }, {'
      '    "name": "Clientes",'
      '    "data": [15, 11, 32, 18, 9, 24, 11]'
      '}]')
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object button_alterar: TButton
    Left = 54
    Top = 367
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = button_alterarClick
  end
end
