program prjMod3Ex2;

uses
  Vcl.Forms,
  uMod3Ex2 in 'uMod3Ex2.pas' {Mod3Ex1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMod3Ex1, Mod3Ex1);
  Application.Run;
end.
