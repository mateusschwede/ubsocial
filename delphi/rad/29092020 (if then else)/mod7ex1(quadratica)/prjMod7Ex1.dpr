program prjMod7Ex1;

uses
  Vcl.Forms,
  uMod7Ex1 in 'uMod7Ex1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
