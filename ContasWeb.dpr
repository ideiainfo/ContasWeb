program ContasWeb;

{$IFDEF D2BRIDGE}
 {$APPTYPE CONSOLE}
{$ENDIF}



uses
  Vcl.Forms,
  D2Bridge.Instance,
  D2Bridge.ServerControllerBase in 'C:\d2bridgeframework\D2Bridge Framework\D2Bridge.ServerControllerBase.pas' {D2BridgeServerControllerBase: TDataModule},
  Prism.SessionBase in 'C:\d2bridgeframework\D2Bridge Framework\Prism\Prism.SessionBase.pas' {PrismSessionBase: TPrismSessionBase},
  ContasWebWebApp in 'ContasWebWebApp.pas',
  ContasWeb_Session in 'ContasWeb_Session.pas',
  D2BridgeFormTemplate in 'D2BridgeFormTemplate.pas',
  Unit_D2Bridge_Server_Console in 'Unit_D2Bridge_Server_Console.pas',
  Unit1 in 'Unit1.pas' {Form1},
  uCadTipo in 'src\uCadTipo.pas' {formCadTipo},
  uConTipo in 'src\uConTipo.pas' {FormConTipo},
  uDM in 'src\uDM.pas' {DM: TDataModule},
  uPrincipal in 'src\uPrincipal.pas' {FormPrincipal},
  uRelTipo in 'src\uRelTipo.pas' {RelTipo},
  Unit_FormCrudGrupo in 'src\Unit_FormCrudGrupo.pas' {FormCrudGrupo},
  Unit_FormCrudBase in 'src\Unit_FormCrudBase.pas' {FormCrudBase},
  ULogin in 'src\ULogin.pas' {Form_Login},
  Udashboard in 'src\Udashboard.pas' {FormDashboard},
  uKanban in 'src\uKanban.pas' {formKanban};

{$R *.res}

{$IFNDEF D2BRIDGE}
var
  Form1: TForm1;
{$ENDIF}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar:= False;
  {$IFNDEF D2BRIDGE}
//  Application.CreateForm(TForm_Login, Form_Login);
  if Form_Login = nil then
    TForm_Login.CreateInstance;
  Form_Login.Showmodal;
//   D2BridgeInstance.AddInstace(Form_Login);
  Application.Run;
  {$ELSE}
  TD2BridgeServerConsole.Run
  
  {$ENDIF}
end.
