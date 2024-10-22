unit Unit_FormCrudGrupo;

{ Copyright 2024 / 2025 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  D2Bridge.Forms, Unit_FormCrudBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFormCrudGrupo = class(TFormCrudBase)
    Crud_Queryid: TFDAutoIncField;
    Crud_Querycodigo: TIntegerField;
    Crud_Querydescricao: TStringField;
    Crud_Querytipo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
    //CRUD Events
    procedure CrudOnOpen; override;
    procedure CrudOnSearch(AText: string); override;
    function CrudOnEdit: boolean; override;
    function CrudOnInsert: boolean; override;
    function CrudOnSave: boolean; override;
    function CrudOnDelete: boolean; override;
    function CrudOnBack: boolean; override;
    function CrudOnClose: boolean; override;
  end;

function FormCrudGrupo:TFormCrudGrupo;

implementation

Uses
  ContasWebWebApp;

{$R *.dfm}

function FormCrudGrupo:TFormCrudGrupo;
begin
  result:= TFormCrudGrupo(TFormCrudGrupo.GetInstance);
end;

procedure TFormCrudGrupo.ExportD2Bridge;
begin
  inherited;

  Title:= '';
  SubTitle:= '';

  Crud_PanelTitle.Caption:= 'Cadastro de Grupos';
  Crud_PanelSubTitle.Caption:= '';

  //TemplateClassForm:= TD2BridgeFormTemplate;
  //D2Bridge.FrameworkExportType.TemplateMasterHTMLFile := '';
  //D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

  with Crud_CardData.Items.Add do
  begin

    FormGroup(label1.Caption, CSSClass.Col.colsize4).AddVCLObj(DBEdit1);
    FormGroup(label2.Caption, CSSClass.Col.colsize12).AddVCLObj(dbedit2);
    FormGroup(label3.Caption, CSSClass.Col.colsize6).AddVCLObj(dbedit3);
   { Yours components of tab "Data" }
  end;

  with Crud_CardData.Footer.Items.Add do
  begin
   { Aditional buttons in Footer }
  end;
end;

procedure TFormCrudGrupo.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

 //Change CRUD Component property
 {
  if PrismControl.VCLComponent = Crud_DBGrid_Search then
  begin
   with PrismControl.AsDBGrid do
   begin
    with Columns.ColumnByIndex(0) do
    begin
     //Example button EDIT invisible
     ButtonFromButtonModel(TButtonModel.Edit).Visible:= false;
     //Example button EDIT disabled
     ButtonFromButtonModel(TButtonModel.Edit).Enabled:= false;

     //Example Add new Button
     Width:= 105;
     with Buttons.Add do
     begin
      ButtonModel:= TButtonModel.Options;
      Caption:= '';
     end;
    end;
   end;
  end;
 }
end;

procedure TFormCrudGrupo.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
begin
 inherited;

 //Intercept HTML
 {
  if PrismControl.VCLComponent = Edit1 then
  begin
   HTMLControl:= '</>';
  end;
 }
end;

procedure TFormCrudGrupo.CrudOnOpen;
begin
 inherited;

 CrudOperation(OpSearch);
end;

procedure TFormCrudGrupo.CrudOnSearch;
begin
 inherited;

  Crud_Query.Close;
  Crud_query.sql.Text:='select * from grupoconta where descricao like '+ QuotedStr( '%'+ Crud_EditSearch.Text +'%') ;
  Crud_Query.Open;

 {
  //Example1
  Crud_Query.Close;
  Crud_Query.Parameters.ParamByName('Field').Value:= '%' + AText + '%';
  Crud_Query.Open;

  //Example2
   CrudDefaultSearch('TableName', 'FieldName', Crud_EditSearch.Text, 'FiedOrder');

  //Example3
  CrudDefaultSearch(
   'TableName',
   ['FieldOne', 'FieldTwo'], //Search in two fields example
   Crud_EditSearch.Text,
   ['FieldTree = 1', 'FieldFour = ''X'''],
   ['FieldOrder1', 'FieldOrder2']
  );
 }
end;

function TFormCrudGrupo.CrudOnEdit: boolean;
begin
 result:= inherited;

 Crud_Query.Edit;
end;

function TFormCrudGrupo.CrudOnInsert: boolean;
begin
 result:= inherited;


  if not Crud_Query.IsEmpty then
  begin
   Crud_Query.Insert;
  end;
  Crud_Query.Edit;

end;

function TFormCrudGrupo.CrudOnSave: boolean;
begin
 result:= inherited;

 Crud_Query.Edit;
 Crud_Query.Post;
end;

function TFormCrudGrupo.CrudOnDelete: boolean;
begin
 result:= inherited;

 Crud_Query.Edit;
 Crud_Query.Delete;
end;

function TFormCrudGrupo.CrudOnBack: boolean;
begin
 result:= inherited;

end;

function TFormCrudGrupo.CrudOnClose: boolean;
begin
 result:= inherited;

 Crud_Query.Close;
end;

end.