unit D2BridgeFormTemplate;

interface

Uses
 System.Classes, System.SysUtils,
 D2Bridge.Prism.Form;


type
 TD2BridgeFormTemplate = class(TD2BridgePrismForm)
  private
   procedure ProcessHTML(Sender: TObject; var AHTMLText: string);
   procedure ProcessTagHTML(const TagString: string; var ReplaceTag: string);

   procedure CallBack(const CallBackName:string; EventParams: TStrings); override;

   function AbrirMenuTipo(EventParams: TStrings): String;

  public
   constructor Create(AOwner: TComponent; D2BridgePrismFramework: TObject); override;

 end;


implementation

Uses
 ContasWebWebApp, uConTipo, uPrincipal, uRelTipo,
  Unit_FormCrudGrupo, ContasWeb_Session, Udashboard, uKanban;


{ TD2BridgeFormTemplate }

function TD2BridgeFormTemplate.AbrirMenuTipo(EventParams: TStrings): String;
begin

    if FormconTipo =  nil then
      TFormConTipo.CreateInstance;
     FormConTipo.showmodal;
//     FormConTipo.free;
end;

procedure TD2BridgeFormTemplate.CallBack(const CallBackName: string;   EventParams: TStrings);
begin
  inherited;
 if SameText(CallBackName, 'RelatorioTipo') then
 begin
    RelTipo:= Treltipo.Create(nil);
    Reltipo.qrTipo.Open;

    RelTipo.RLReport1.SaveToFile('c:\projetosweb\pdf\relatorio.pdf');
    RelTipo.RLReport1.Prepare;
    RelTipo.RLPDFFilter1.FilterPages(reltipo.RLReport1.Pages);

    D2Bridge.PrismSession.SendFile('c:\projetosweb\pdf\relatorio.pdf',true) ;
    Reltipo.Free;
 end;

  if SameText(CallBackName, 'AbrirMenuGrupo') then
  begin
     if FormCrudGrupo = nil then
        TFormCrudGrupo.CreateInstance;
     FormCrudGrupo.Show;
  end;

  if SameText(CallBackName, 'AbrirMenuDashboard') then
  begin
     if FormDashboard = nil then
        TFormDashboard.CreateInstance;
     FormDashboard.Show;
  end;

    if SameText(CallBackName, 'AbrirMenuKanban') then
  begin
     if FormKanban = nil then
        TFormKanban.CreateInstance;
     FormKanban.Show;
  end;
end;

constructor TD2BridgeFormTemplate.Create(AOwner: TComponent;
  D2BridgePrismFramework: TObject);
begin
 inherited;

 //Events
 OnProcessHTML:= ProcessHTML;
 OnTagHTML:= ProcessTagHTML;


 //Yours CallBacks Ex:

  CallBacks.Register('AbrirMenuTipo', AbrirMenuTipo);


 //Other Example CallBack embed
 {
 Session.CallBacks.Register('OpenMenuItem',
   function(EventParams: TStrings): string
   begin
    if MyForm = nil then
     TMyForm.CreateInstance;
    MyForm.Show;
   end);
  }
end;

procedure TD2BridgeFormTemplate.ProcessHTML(Sender: TObject;
  var AHTMLText: string);
begin
 //Intercep HTML Code

end;

procedure TD2BridgeFormTemplate.ProcessTagHTML(const TagString: string;
  var ReplaceTag: string);
begin
 //Process TAGs HTML {{TAGNAME}}
 if TagString = 'usuario' then
 begin
  ReplaceTag := ContasWeb.FUserName;
 end;

end;

end.
