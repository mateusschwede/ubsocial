program prjMod2Ex3;

uses
  Vcl.Forms,
  uMod2Ex3 in 'uMod2Ex3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
