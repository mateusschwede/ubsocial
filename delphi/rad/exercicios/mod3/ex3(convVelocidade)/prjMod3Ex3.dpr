program prjMod3Ex3;

uses
  Vcl.Forms,
  uMod3Ex3 in 'uMod3Ex3.pas' {Mod3Ex3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMod3Ex3, Mod3Ex3);
  Application.Run;
end.
