unit uKanban;

{ Copyright 2024 / 2025 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uprincipal,
  D2Bridge.Forms;

type
  TformKanban = class(TFormPrincipal)
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function formKanban:TformKanban;

implementation

Uses
  ContasWebWebApp;

{$R *.dfm}

function formKanban:TformKanban;
begin
  result:= TformKanban(TformKanban.GetInstance);
end;

procedure TformKanban.ExportD2Bridge;
begin
  inherited;

  Title:= 'My D2Bridge Form';

  //TemplateClassForm:= TD2BridgeFormTemplate;
//  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := 'kanban.html';

  with D2Bridge.Items.add do
  begin
   {Yours Controls}
  end;

end;

procedure TformKanban.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

 //Change Init Property of Prism Controls
 {
  if PrismControl.VCLComponent = Edit1 then
   PrismControl.AsEdit.DataType:= TPrismFieldType.PrismFieldTypeInteger;

  if PrismControl.IsDBGrid then
  begin
   PrismControl.AsDBGrid.RecordsPerPage:= 10;
   PrismControl.AsDBGrid.MaxRecords:= 2000;
  end;
 }
end;

procedure TformKanban.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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

end.