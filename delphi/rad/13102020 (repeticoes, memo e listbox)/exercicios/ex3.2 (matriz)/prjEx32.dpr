program prjEx32;

uses
  Vcl.Forms,
  uEx32 in 'uEx32.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
