program prjAtiv2;

uses
  Vcl.Forms,
  uAtiv2 in 'uAtiv2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
