program prjEx2a;

uses
  Vcl.Forms,
  uEx2a in 'uEx2a.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
