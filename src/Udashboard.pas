unit Udashboard;

{ Copyright 2024 / 2025 D2Bridge Framework by Talis Jonatas Gomes }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uprincipal,
  D2Bridge.Forms;

type
  TFormDashboard = class(TFormPrincipal)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edit_Vendas: TEdit;
    lb_vendas: TLabel;
    lb_renovacoes: TLabel;
    lb_clientes: TLabel;
    memo_series: TMemo;
    button_alterar: TButton;
    procedure edit_VendasChange(Sender: TObject);
    procedure button_alterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure ExportD2Bridge; override;
    procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
    procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;
  end;

function FormDashboard:TFormDashboard;

implementation


{$R *.dfm}

function FormDashboard:TFormDashboard;
begin
  result:= TFormDashboard(TFormDashboard.GetInstance);
end;

procedure TFormDashboard.button_alterarClick(Sender: TObject);
begin
  inherited;
  PrismSession.ExecJS('geragrafico();');

end;

procedure TFormDashboard.edit_VendasChange(Sender: TObject);
begin
  inherited;
  lb_vendas.Caption:=edit_vendas.Text;
end;

procedure TFormDashboard.ExportD2Bridge;
begin
  inherited;

  Title:= 'My D2Bridge Form';

//  TemplateClassForm:= TD2BridgeFormTemplate;
//  D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= 'template.html';
  D2Bridge.FrameworkExportType.TemplatePageHTMLFile := 'dashboard.html';

//  ExportD2BridgeAllControls;
  with D2Bridge.Items.add do
  begin
   VCLObj(lb_vendas);
   VCLObj(lb_renovacoes);
   VCLObj(lb_clientes);

//   VCLObj(edit_vendas);
   VCLObj(memo_series);
//   VCLObj(button_alterar);
  end;

end;

procedure TFormDashboard.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TFormDashboard.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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
