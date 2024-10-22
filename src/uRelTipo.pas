unit uRelTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLFilters, RLPDFFilter,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait;

type
  TRelTipo = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    qrTipo: TFDQuery;
    qrTipoid: TFDAutoIncField;
    qrTipocodigo: TIntegerField;
    qrTipodescricao: TStringField;
    qrTipotipo: TStringField;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    DataSource1: TDataSource;
    RLLabel4: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  var RelTipo: TRelTipo;

implementation

{$R *.dfm}

uses uDM;


//Function RelTipo: TRelTipo;
//begin
// Result:= TRelTipo(TRelTipo.GetInstance);
//end;
end.
