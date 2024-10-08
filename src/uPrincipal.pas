unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, D2Bridge.Forms;

type
  TFormPrincipal =  class(TD2BridgeForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    GrupodeReceitasDespesas1: TMenuItem;
    Clientes1: TMenuItem;
    Clientes2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Movimento1: TMenuItem;
    ContasaReceber1: TMenuItem;
    ContasaReceber2: TMenuItem;
    MovimentodeCaixa1: TMenuItem;
    MovimentodeCaixa2: TMenuItem;
    Contasapagarporvencimento1: TMenuItem;
    Contasapagarporvencimento2: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    RelaodeTiposdeReceitaseDespesas1: TMenuItem;
    N3: TMenuItem;
    procedure Cadastro2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure RelaodeTiposdeReceitaseDespesas1Click(Sender: TObject);
    procedure GrupodeReceitasDespesas1Click(Sender: TObject);
  private
    { Private declarations }
  public

  protected
   procedure ExportD2Bridge; override;
   procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
   procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;


    { Public declarations }
  end;

function FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses uConTipo, uDM, ContasWebWebApp, D2BridgeFormTemplate, uRelTipo,
  Unit_FormCrudGrupo;


Function FormPrincipal: TFormPrincipal;
begin
 Result:= TFormPrincipal(TFormPrincipal.GetInstance);
end;

procedure TFormPrincipal.Cadastro2Click(Sender: TObject);
begin
    if FormconTipo =  nil then
      TFormConTipo.CreateInstance;
     FormConTipo.showmodal;
     FormConTipo.free;

end;

procedure TFormPrincipal.N2Click(Sender: TObject);
begin
Application.Terminate;
end;



procedure TFormPrincipal.ExportD2Bridge;
begin
 inherited;

 Title:= 'Sistema de Contas a Pagar e Receber';
 SubTitle:= 'ContasWeb';

 TemplateClassForm:= TD2BridgeFormTemplate;
 D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= 'template.html';
 D2Bridge.FrameworkExportType.TemplatePageHTMLFile := 'itemtemplate.html';

 //Export yours Controls
 with D2Bridge.Items.add do
 begin
// SideMenu(MainMenu1);
//  VCLObj(Label1);
//  VCLObj(Label2);
 end;
end;

procedure TFormPrincipal.GrupodeReceitasDespesas1Click(Sender: TObject);
begin
     if FormCrudGrupo = nil then
        TFormCrudGrupo.CreateInstance;
     FormCrudGrupo.Show;
end;

procedure TFormPrincipal.InitControlsD2Bridge(const PrismControl: TPrismControl);
begin
 inherited;

 //Menu example
 {
  if PrismControl.VCLComponent = MainMenu1 then
   PrismControl.AsMainMenu.Title:= 'AppTeste'; //or in SideMenu use asSideMenu

  if PrismControl.VCLComponent = MainMenu1 then
   PrismControl.AsMainMenu.Image.URL:= 'https://d2bridge.com.br/images/LogoD2BridgeTransp.png'; //or in SideMenu use asSideMenu

  //GroupIndex example
  if PrismControl.VCLComponent = MainMenu1 then
   with PrismControl.AsMainMenu do  //or in SideMenu use asSideMenu
   begin
    MenuGroups[0].Caption:= 'Principal';
    MenuGroups[1].Caption:= 'Services';
    MenuGroups[2].Caption:= 'Items';
   end;

  //Chance Icon and Propertys MODE 1 *Using MenuItem component
  PrismControl.AsMainMenu.MenuItemFromVCLComponent(Abrout1).Icon:= 'fa-solid fa-rocket';

  //Chance Icon and Propertys MODE 2 *Using MenuItem name
  PrismControl.AsMainMenu.MenuItemFromName('Abrout1').Icon:= 'fa-solid fa-rocket';
 }

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


procedure TFormPrincipal.RelaodeTiposdeReceitaseDespesas1Click(Sender: TObject);
begin

  RelTipo:= Treltipo.Create(Application);
  Reltipo.qrTipo.Open;
  if IsD2BridgeContext then
  begin
    RelTipo.RLReport1.ShowProgress:=false;
    RelTipo.RLReport1.SaveToFile('c:\projetoweb\pdf\relatorio.pdf');
    RelTipo.RLReport1.Prepare;
    RelTipo.RLPDFFilter1.FilterPages(reltipo.RLReport1.Pages);
    D2Bridge.PrismSession.SendFile('c:\projetoweb\pdf\relatorio.pdf')
  end
  else
    RelTipo.RLReport1.Preview();
  RelTipo.Free;
end;

procedure TFormPrincipal.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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
