unit uCadTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, D2Bridge.Forms, uprincipal;

type
  TformCadTipo = class(TFormPrincipal)
    lblCodigo: TLabel;
    DBECodigo: TDBEdit;
    lblDescicao: TLabel;
    DBEDescricao: TDBEdit;
    lblTipo: TLabel;
    lblGrupo: TLabel;
    DBCTipo: TDBComboBox;
    DBLGrupo: TDBLookupComboBox;
    btnGravar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
   procedure ExportD2Bridge; override;
   procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
   procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;

  end;


  function formCadTipo: TformCadTipo;

implementation

{$R *.dfm}

uses uConTipo, uDM;


Function formCadTipo: TformCadTipo;
begin
 Result:= TformCadTipo(TformCadTipo.GetInstance);
end;

procedure TformCadTipo.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformCadTipo.btnGravarClick(Sender: TObject);
begin
   dm.qrTipo.Post;
   close;
end;

procedure TformCadTipo.ExportD2Bridge;
begin
 inherited;

 Title:= 'Tipos de Receitas e Despesas';
 SubTitle:= '';

 //TemplateClassForm:= TD2BridgeFormTemplate;
// D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
// D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

 //Export yours Controls
 with D2Bridge.Items.add do
 begin
    with row.Items.Add do
        with FormGroup(lblcodigo.Caption) do
          AddVCLObj(DBECodigo);

    with row.Items.Add do
        with FormGroup(lblDescicao.Caption,CSSClass.Col.colsize6) do
          AddVCLObj(DBEDescricao);

    with row.Items.Add do
      begin
        with FormGroup(lblgrupo.Caption,CSSClass.Col.colsize3) do
          AddVCLObj(DBLGrupo);
        with FormGroup(lbltipo.Caption, CSSClass.Col.colsize3) do
          AddVCLObj(DBCTipo);
      end;
    with row.Items.Add do
     begin
       with HTMLDIV(CSSClass.DivHtml.Align_Right).Items.Add do
        begin
          with FormGroup do
            AddVCLObj(btnGravar,CSSClass.Button.save);

          with FormGroup do
            AddVCLObj(btnCancelar, CSSClass.Button.cancel);
       end;
     end;
   end;

end;

procedure TformCadTipo.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TformCadTipo.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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
