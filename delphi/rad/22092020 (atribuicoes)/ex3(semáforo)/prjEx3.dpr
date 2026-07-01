program prjEx3;

uses
  Vcl.Forms,
  uEx3 in 'uEx3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
