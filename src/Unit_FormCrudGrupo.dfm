inherited FormCrudGrupo: TFormCrudGrupo
  Caption = 'FormCrudGrupo'
  TextHeight = 13
  inherited Crud_PageControl: TPageControl
    inherited Crud_TabSheetSearch: TTabSheet
      inherited Crud_DBGrid_Search: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'codigo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo'
            Visible = True
          end>
      end
    end
    inherited Crud_TabSheetData: TTabSheet
      object Label1: TLabel [0]
        Left = 24
        Top = 48
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEdit1
      end
      object Label2: TLabel [1]
        Left = 24
        Top = 88
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel [2]
        Left = 24
        Top = 128
        Width = 18
        Height = 13
        Caption = 'tipo'
        FocusControl = DBEdit3
      end
      object DBEdit1: TDBEdit
        Left = 24
        Top = 64
        Width = 134
        Height = 21
        DataField = 'codigo'
        DataSource = Crud_DSQuery
        TabOrder = 3
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 104
        Width = 600
        Height = 21
        DataField = 'descricao'
        DataSource = Crud_DSQuery
        TabOrder = 4
      end
      object DBEdit3: TDBEdit
        Left = 24
        Top = 144
        Width = 134
        Height = 21
        DataField = 'tipo'
        DataSource = Crud_DSQuery
        TabOrder = 5
      end
    end
  end
  inherited Crud_Query: TFDQuery
    Active = True
    SQL.Strings = (
      'select * from grupoconta')
    object Crud_Queryid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Crud_Querycodigo: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object Crud_Querydescricao: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object Crud_Querytipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 10
    end
  end
end
