program prjMod3Ex1;

uses
  Vcl.Forms,
  uMod3Ex1 in 'uMod3Ex1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
