program prjDataXampp;

uses
  Vcl.Forms,
  uDataXampp in 'uDataXampp.pas' {dataXampp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdataXampp, dataXampp);
  Application.Run;
end.
