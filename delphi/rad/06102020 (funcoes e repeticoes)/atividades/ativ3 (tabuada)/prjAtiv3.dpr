program prjAtiv3;

uses
  Vcl.Forms,
  uAtiv3 in 'uAtiv3.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
