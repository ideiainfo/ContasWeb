object RelTipo: TRelTipo
  Left = 0
  Top = 0
  Caption = 'RelTipo'
  ClientHeight = 849
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 0
    Top = 8
    Width = 1016
    Height = 1441
    Margins.RightMargin = 15.000000000000000000
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpRA4
    object RLBand1: TRLBand
      Left = 47
      Top = 47
      Width = 898
      Height = 66
      BandType = btHeader
      object RLSystemInfo1: TRLSystemInfo
        Left = 528
        Top = 47
        Width = 142
        Height = 19
        Text = 'Emitido em: '
      end
      object RLLabel4: TRLLabel
        Left = 215
        Top = 0
        Width = 468
        Height = 27
        Align = faCenterTop
        Caption = 'Rela'#231#227'o de Tipos de Receitas e Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 47
      Top = 113
      Width = 898
      Height = 48
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel2: TRLLabel
        Left = 128
        Top = 14
        Width = 83
        Height = 19
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 528
        Top = 14
        Width = 39
        Height = 19
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 40
        Top = 14
        Width = 61
        Height = 19
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 47
      Top = 161
      Width = 898
      Height = 40
      object RLDBText1: TRLDBText
        Left = 32
        Top = 12
        Width = 54
        Height = 19
        DataField = 'codigo'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 124
        Top = 12
        Width = 77
        Height = 19
        DataField = 'descricao'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 536
        Top = 12
        Width = 31
        Height = 19
        DataField = 'tipo'
        DataSource = DataSource1
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 47
      Top = 201
      Width = 898
      Height = 48
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLSystemInfo2: TRLSystemInfo
        Left = 725
        Top = 1
        Width = 173
        Height = 19
        Align = faRightTop
        Info = itPageNumber
        Text = 'P'#225'gina: '
      end
    end
  end
  object qrTipo: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from conta')
    Left = 800
    Top = 336
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
  end
  object DataSource1: TDataSource
    DataSet = qrTipo
    Left = 880
    Top = 320
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.1.2 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 152
    Top = 352
  end
end
