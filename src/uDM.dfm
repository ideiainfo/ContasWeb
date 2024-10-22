object DM: TDM
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=cpagrec'
      'User_Name=root'
      'Password=produtiv'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 96
    Top = 64
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\projetosd2\dll\libmysql.dll'
    Left = 256
    Top = 64
  end
  object qrTipo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from conta')
    Left = 88
    Top = 152
    object qrTipoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrTipocodigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object qrTipodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 100
    end
    object qrTipotipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 10
    end
    object qrTipogrupo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grupo'
      Origin = 'grupo'
    end
    object qrTipodescgrupo: TStringField
      FieldKind = fkLookup
      FieldName = 'descgrupo'
      LookupDataSet = qrGrupo
      LookupKeyFields = 'codigo'
      LookupResultField = 'descricao'
      KeyFields = 'grupo'
      Lookup = True
    end
  end
  object qrGrupo: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from grupoconta')
    Left = 88
    Top = 248
    object qrGrupoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrGrupocodigo: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codigo'
      Origin = 'codigo'
    end
    object qrGrupodescricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qrGrupotipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 10
    end
  end
end
