program prjMod2Ex2;

uses
  Vcl.Forms,
  uMod2Ex2 in 'uMod2Ex2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
