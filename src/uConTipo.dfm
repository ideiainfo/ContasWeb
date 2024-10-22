object FormConTipo: TFormConTipo
  Left = 0
  Top = 0
  Caption = 'Tipo de Receitas e Despesas'
  ClientHeight = 442
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 726
    Height = 65
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 720
    object lblLocalizar: TLabel
      Left = 24
      Top = 24
      Width = 46
      Height = 15
      Caption = 'Localizar'
    end
    object EditLocalizar: TEdit
      Left = 88
      Top = 21
      Width = 250
      Height = 23
      TabOrder = 0
    end
    object BtnLocalizar: TButton
      Left = 344
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 1
      OnClick = BtnLocalizarClick
    end
    object BtnNovo: TButton
      Left = 536
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 2
      OnClick = BtnNovoClick
    end
    object BtnEditar: TButton
      Left = 439
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 3
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TButton
      Left = 640
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = BtnExcluirClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 65
    Width = 726
    Height = 377
    Align = alClient
    DataSource = dsTipo
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tipo'
        Title.Caption = 'Tipo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descgrupo'
        Title.Caption = 'Grupo'
        Visible = True
      end>
  end
  object dsTipo: TDataSource
    DataSet = DM.qrTipo
    Left = 448
    Top = 136
  end
  object dsGrupo: TDataSource
    DataSet = DM.qrGrupo
    Left = 448
    Top = 208
  end
end
