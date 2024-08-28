unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qrTipo: TFDQuery;
    qrGrupo: TFDQuery;
    qrTipoid: TFDAutoIncField;
    qrTipocodigo: TIntegerField;
    qrTipodescricao: TStringField;
    qrTipotipo: TStringField;
    qrTipogrupo: TIntegerField;
    qrTipodescgrupo: TStringField;
    qrGrupoid: TFDAutoIncField;
    qrGrupocodigo: TIntegerField;
    qrGrupodescricao: TStringField;
    qrGrupotipo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
   class procedure CreateInstance ;
  end;

  function DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
Uses
  D2Bridge.Instance, ContasWebWebApp;


class procedure TDM.CreateInstance;
begin
 D2BridgeInstance.CreateInstance(self);
end;

function DM:TDM;
begin
 result:= TDM(D2BridgeInstance.GetInstance(TDM));
end;

end.
