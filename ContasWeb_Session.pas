unit ContasWeb_Session;

interface

uses
  System.SysUtils, System.Classes,
  Prism.SessionBase;

type
  TContasWebSession = class(TPrismSessionBase)
  private

  public
    FIdUser: integer;
    FUserName: String;
    FUserProfile: String;
   constructor Create(APrismSession: TPrismSession); override;  //OnNewSession
  end;



implementation

Uses
  D2Bridge.Instance,
  ContasWebWebApp, uDM;

{$R *.dfm}

constructor TContasWebSession.Create(APrismSession: TPrismSession); //OnNewSession
begin
 inherited;
 if DM = nil then
   TDM.CreateInstance;
 //Your code

end;

end.

