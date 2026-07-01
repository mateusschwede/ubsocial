program prjEx4;

uses
  Vcl.Forms,
  uEx4 in 'uEx4.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
