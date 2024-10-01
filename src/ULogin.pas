unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, D2Bridge.Forms;

type
  TForm_Login = class(TD2BridgeForm)
    Edit_Login: TEdit;
    Edit_Senha: TEdit;
    BUTTON_LOGAR: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure BUTTON_LOGARClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  protected
    procedure ExportD2Bridge; override;
  public
    destructor Destroy; override;

  end;


Function Form_Login: TForm_Login;

implementation

Uses
 uPrincipal,
 ContasWebWebApp;

{$R *.dfm}

Function Form_Login: TForm_Login;
begin
 result:= TForm_Login(TForm_Login.GetInstance);
end;

procedure TForm_Login.BUTTON_LOGARClick(Sender: TObject);
begin

 if Edit_Login.Text = '' then
 begin
  showmessage('Informe o Login');
  abort;
 end;

 if Edit_Senha.Text = '' then
 begin
  showmessage('Informe a senha');
  abort;
 end;

 if ((Edit_Login.Text = 'admin') and (Edit_Senha.Text = 'admin')) or
    ((Edit_Login.Text = 'user') and (Edit_Senha.Text = 'user')) then
 begin
  {$IFDEF D2BRIDGE}
  //User Vars

//  ContasWebWebApp.FIdUser:= 1;
//  ContasWebWebApp.FUserName:= Edit_Login.Text;
//  ContasWebWebApp.FUserProfile:= 'User Administrator';

  ContasWeb.FIdUser:= 1;
  ContasWeb.FUserName:= Edit_Login.Text;
  ContasWeb.FUserProfile:= 'User Administrator';

  //Info User
  //D2Bridge.PrismSession.InfoConnection.User:= ContasWebWebApp.FUserName;
  //D2Bridge.PrismSession.InfoConnection.Identity:= 'template';


   if FormPrincipal = nil then
      TFormPrincipal.CreateInstance;
  FormPrincipal.showmodal;



  {$ELSE}
  if FormPrincipal = nil then
   D2BridgeInstance.CreateInstance(TFormPrincipal);
  FormPrincipal.showmodal;

  application.Terminate;
  {$ENDIF}
 end else
 begin
  messagedlg('Usuário ou Senha não confere!', mtwarning, [mbok], 0);
 end;
end;

destructor TForm_Login.Destroy;
begin

  inherited;
end;

procedure TForm_Login.ExportD2Bridge;
begin
 inherited;

 D2Bridge.FrameworkExportType.TemplateMasterHTMLFile:= 'pages-login.html';

 D2Bridge.HTML.StyleSheets.Add('<link rel="manifest" href="manifest.json">');

 //D2Bridge.HTML.Render.Headers.Add('<link rel="manifest" href="manifest.json">');

 D2Bridge.Items.Add.VCLObj(Edit_Login);
 D2Bridge.Items.Add.VCLObj(Edit_Senha);
 D2Bridge.Items.Add.VCLObj(BUTTON_LOGAR);

end;

procedure TForm_Login.FormActivate(Sender: TObject);
begin
 Edit_Login.Text:= 'admin';
 Edit_Senha.Text:= 'admin';
end;

end.
