program prjAnimais;

uses
  Vcl.Forms,
  uAnimais in 'uAnimais.pas' {animal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tanimal, animal);
  Application.Run;
end.
