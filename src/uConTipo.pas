unit uConTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, D2Bridge.Forms, uPrincipal;

type
  TFormConTipo = class(TFormPrincipal)
    Panel1: TPanel;
    lblLocalizar: TLabel;
    EditLocalizar: TEdit;
    BtnLocalizar: TButton;
    DBGrid1: TDBGrid;
    dsTipo: TDataSource;
    BtnNovo: TButton;
    BtnEditar: TButton;
    dsGrupo: TDataSource;
    procedure BtnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  protected
   procedure ExportD2Bridge; override;
   procedure InitControlsD2Bridge(const PrismControl: TPrismControl); override;
   procedure RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string); override;

  end;


  Function FormConTipo: TFormConTipo;

implementation

{$R *.dfm}

uses uDM, uCadTipo;

Function FormConTipo: TFormConTipo;
begin
 Result:= TFormConTipo(TFormConTipo.GetInstance);
end;

procedure TFormConTipo.BtnEditarClick(Sender: TObject);
begin
  if FormCadTipo = nil then
     TFormCadTipo.CreateInstance;
  dm.qrTipo.edit;
  FormCadTipo.showmodal;
  FormCadTipo.free;
end;

procedure TFormConTipo.BtnLocalizarClick(Sender: TObject);
begin
   DM.qrTipo.close;
   DM.qrGrupo.Close;

   Dm.qrTipo.SQL.Text := 'Select * from conta Where descricao like '+ QuotedStr('%'+editLocalizar.Text+'%');
   DM.qrTipo.open;
   DM.qrGrupo.open;;

end;

procedure TFormConTipo.BtnNovoClick(Sender: TObject);
begin
  if FormCadTipo = nil then
     TFormCadTipo.CreateInstance;
  dm.qrTipo.insert;
  FormCadTipo.showmodal;
  FormCadTipo.free;
end;

procedure TFormConTipo.DBGrid1DblClick(Sender: TObject);
begin
 BtnEditarClick(Sender);
end;

procedure TFormConTipo.FormShow(Sender: TObject);
begin
 BtnLocalizarClick(Sender);
end;

procedure TFormConTipo.ExportD2Bridge;
begin
 inherited;

 Title:= 'Tipos de Receitas e Despesas';
 SubTitle:= '';

// TemplateClassForm:= TD2BridgeFormTemplate;
// D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= '';
// D2Bridge.FrameworkExportType.TemplatePageHTMLFile := '';

 //Export yours Controls
 with D2Bridge.Items.add do
 begin
    with row.Items.Add do
    begin
        with FormGroup(lblLocalizar.Caption) do
          AddVCLObj(EditLocalizar,CSSClass.Text.Size.fs3);

        with FormGroup do
          AddVCLObj(BtnLocalizar,CSSClass.Button.search);

        with FormGroup do
          AddVCLObj(BtnEditar, 'btn btn-outline-warning');

        with FormGroup do
          AddVCLObj(BtnNovo, CSSClass.Button.add);
    end;

   with row.Items.Add do
      VCLObj(DBGrid1);

 end;
end;

procedure TFormConTipo.InitControlsD2Bridge(const PrismControl: TPrismControl);
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

procedure TFormConTipo.RenderD2Bridge(const PrismControl: TPrismControl; var HTMLControl: string);
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
