program prjMod2Ex1;

uses
  Vcl.Forms,
  uMod2Ex1 in 'uMod2Ex1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
