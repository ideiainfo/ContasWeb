object formCadTipo: TformCadTipo
  Left = 0
  Top = 0
  Caption = 'Tipo de Receitas e Despesas'
  ClientHeight = 321
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object lblCodigo: TLabel
    Left = 48
    Top = 40
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
    FocusControl = DBECodigo
  end
  object lblDescicao: TLabel
    Left = 48
    Top = 88
    Width = 51
    Height = 15
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEDescricao
  end
  object lblTipo: TLabel
    Left = 48
    Top = 201
    Width = 23
    Height = 15
    Caption = 'Tipo'
  end
  object lblGrupo: TLabel
    Left = 48
    Top = 144
    Width = 33
    Height = 15
    Caption = 'Grupo'
  end
  object DBECodigo: TDBEdit
    Left = 48
    Top = 56
    Width = 89
    Height = 23
    DataField = 'codigo'
    DataSource = FormConTipo.dsTipo
    TabOrder = 0
  end
  object DBEDescricao: TDBEdit
    Left = 48
    Top = 104
    Width = 465
    Height = 23
    DataField = 'descricao'
    DataSource = FormConTipo.dsTipo
    TabOrder = 1
  end
  object DBCTipo: TDBComboBox
    Left = 48
    Top = 217
    Width = 225
    Height = 23
    DataField = 'tipo'
    DataSource = FormConTipo.dsTipo
    Items.Strings = (
      'Receita'
      'Despesa')
    TabOrder = 2
  end
  object DBLGrupo: TDBLookupComboBox
    Left = 48
    Top = 165
    Width = 225
    Height = 23
    DataField = 'grupo'
    DataSource = FormConTipo.dsTipo
    KeyField = 'codigo'
    ListField = 'descricao'
    ListSource = FormConTipo.dsGrupo
    TabOrder = 3
  end
  object btnGravar: TButton
    Left = 336
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 4
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 438
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
end
